﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Demo.Models;
using Demo.Utility;

namespace Demo.Controllers
{
    public class RegistrationController : Controller
    {
        private NotesEntities _Context;

        public RegistrationController()
        {
            _Context = new NotesEntities();
        }
        
        // GET: Registration
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(UserRegistration user)
        {
            if (!ModelState.IsValid)
            {
                return RedirectToAction("Index", "Registration");
            }

            var emailexist = _Context.Users.Where(m => m.EmailID == user.EmailID).FirstOrDefault();
            if (emailexist != null)
            {
                ViewBag.Fail = "Your Account is already registerd!";
            }
            else
            {
                var register = _Context.Set<User>();
                register.Add(new User
                {
                    RoleID = 1,
                    FirstName = user.Firstname,
                    LastName = user.LastName,
                    EmailID = user.EmailID,
                    Password = user.Password,
                    CreatedDate = DateTime.Parse(DateTime.Now.ToString("dd MMMM yyyy HH:mm:ss")),
                    isActive = true,
                    isEmailVerified = false
                });

                /* _Context.SaveChanges();
                 _Context.Dispose();*/

                string body = string.Empty;
                using (StreamReader reader = new StreamReader(Server.MapPath("~/Mail_Template/EmailConfirmation.html")))
                {
                    body = reader.ReadToEnd();
                }

                var callbackUrl = Url.Action("ConfirmEmail", "Registration", new
                {
                    userId = user.EmailID
                    ,
                    pass = user.Password
                }, protocol: Request.Url.Scheme);

                body = body.Replace("{Username}", user.Firstname);
                body = body.Replace("{ConfirmationLink}", callbackUrl);

                try
                {
                    bool IsSendEmail = SendEmail.EmailSend(user.EmailID, "Notes Marketplace - Email Verification", body, true);
                    _Context.SaveChanges();
                    _Context.Dispose();
                }

                catch (Exception e)
                {
                    throw e;
                }

                ViewBag.Success = "<p><span><i class='fa fa-check-circle'></i></span> Your account has been successfully created </p>";
            }
                return View();
            
		}

        public ActionResult ConfirmEmail(string userId, string pass)
        {
            var result = _Context.Users.Where(m => m.EmailID == userId && m.Password == pass).FirstOrDefault();
            result.isEmailVerified = true;
            _Context.SaveChanges();
            _Context.Dispose();

            return RedirectToAction("Index", "Login");
        }


    }
}