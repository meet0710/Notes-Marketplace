﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Demo.Models;
using Demo.Utility;

namespace Demo.Controllers
{
	public class HomeController : Controller
	{
		private NotesEntities _Context;

		public HomeController()
		{
			_Context = new NotesEntities();
		}

		public ActionResult Index()
		{
			return View();
		}

		[HttpGet]
		public ActionResult SearchNotes()
		{
			var typeList = _Context.Types.ToList();
			var categoryList = _Context.Categories.ToList();
			var universitylist = _Context.SellerNotes.ToList();
			var countrylist = _Context.Countries.ToList();

			ViewBag.TypeList = typeList;
			ViewBag.CategoryList = categoryList;
			ViewBag.UniversityList = universitylist;
			ViewBag.CountryList = countrylist;

			var search = (from s in _Context.SellerNotes where s.Status == 4
						  join cat in _Context.Categories on s.Category equals cat.ID
						  join typ in _Context.Types on s.NoteType equals typ.ID
						  join country in _Context.Countries on s.Country equals country.ID
						  let avgratings = (from Review in _Context.SellerNotesReviews
											where Review.NoteID == s.ID
											group Review by Review.NoteID into grp
											select new AvgRatings
											{
												Rating = Math.Round(grp.Average(m => m.Ratings)),
												Total = grp.Count()
											})
						  let totalspam = (from Spam in _Context.SellerNotesReportedIssues
										   where Spam.NoteID == s.ID
										   group Spam by Spam.NoteID into grp
										   select new SpamNote
										   {
											   TotalSpam = grp.Count()
										   })

						 let totalnotes = (from sn in _Context.SellerNotes
										   where sn.Status ==4
										   group sn by sn.Status into grp
										   select new Totalnotes
                                           {
											   totalnotes = grp.Count()
                                           })

						  select new SearchNote
						  {
							  Note = s,
							  types = typ,
							  category = cat,
							  country = country,
							  Total = avgratings.Select(a=>a.Total).FirstOrDefault(),
							  Rating = avgratings.Select(a=>a.Rating).FirstOrDefault(),
							  TotalSpam = totalspam.Select(a=>a.TotalSpam).FirstOrDefault(),
							  totalnotes = totalnotes.Select(a=>a.totalnotes).FirstOrDefault()
						  }).ToList();
			return View(search);
        }

		[HttpGet]
		public ActionResult NoteDetails(int id)
        {
			List<SellerNote> Notes = _Context.SellerNotes.ToList();
			List<SellerNotesReview> reviews = _Context.SellerNotesReviews.ToList();
			List<Country> country = _Context.Countries.ToList();
			List<Category> category = _Context.Categories.ToList();
			List<User> users = _Context.Users.ToList();
			var details = (from s in Notes
						  where (s.ID == id)
						  join c in country on s.Country equals c.ID 
						  join cat in category on s.Category equals cat.ID
						   let ratingandreview =(from r in _Context.SellerNotesReviews where r.NoteID == id
												join u in _Context.Users on r.ReviewedByID equals u.ID
												join up in _Context.UserProfiles on r.ReviewedByID equals up.UserID
												select new RatingandReview
                                                {
													IndRating = r.Ratings,
													Review = r.Comments,
													FirstName = u.FirstName,
													LastName = u.LastName,
													ProfilePicture = up.ProfilePicture,
													noteid = r.ID
                                                }).ToList()

						   let avgratings = (from Review in _Context.SellerNotesReviews
											 where Review.NoteID == s.ID
											 group Review by Review.NoteID into grp
											 select new AvgRatings
											 {
												 Rating = Math.Round(grp.Average(m => m.Ratings)),
												 Total = grp.Count()
											 })
						   let totalspam = (from Spam in _Context.SellerNotesReportedIssues
											where Spam.NoteID == s.ID
											group Spam by Spam.NoteID into grp
											select new SpamNote
											{
												TotalSpam = grp.Count()
											})



						   select new NoteDetail 
						  { 
								note = s,
								country = c,
								category = cat,
                               //review = r,
                               //user = u,

                               IndRating = ratingandreview.Select(a=>a.IndRating).FirstOrDefault(),
                               Review = ratingandreview.Select(a=>a.Review).FirstOrDefault(),
                            //      FirstName = ratingandreview.Select(a => a.FirstName).FirstOrDefault(),
                             //     LastName = ratingandreview.Select(a => a.LastName).FirstOrDefault(),
                             //  ProfilePicture = ratingandreview.Select(a=>a.ProfilePicture).FirstOrDefault(),

                               rr = ratingandreview,

							   Total = avgratings.Select(a => a.Total).FirstOrDefault(),
							    Rating = avgratings.Select(a => a.Rating).FirstOrDefault(),
							    TotalSpam = totalspam.Select(a => a.TotalSpam).FirstOrDefault()

						   }).FirstOrDefault();
			return View(details);
        }

		

		[HttpGet]
		public ActionResult ContactUs()
		{
			if(User.Identity.IsAuthenticated)
            {
				var currentuser = Convert.ToInt32(Session["UserId"]);
				var result = _Context.Users.Where(m => m.ID == currentuser).FirstOrDefault();
				ContactUs user = new ContactUs
				{
					Fullname = result.FirstName + result.LastName,
					EmailID = result.EmailID
				};
				return View(user);
            }
            else
            {
				return View();
			}
				
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult ContactUs(ContactUs user)
		{
			if (!ModelState.IsValid)
			{
				return RedirectToAction("ContactUs", "Home");
			}

			var email = (from admin in _Context.Users where admin.RoleID == 2 || admin.RoleID == 3 select admin);
			//var emailto = _Context.Users.Where(m => m.RoleID == 3).FirstOrDefault();

			foreach (var emailto in email)
			{
				string body = string.Empty;
				using (StreamReader reader = new StreamReader(Server.MapPath("~/Mail_Template/ContactUs.html")))
				{
					body = reader.ReadToEnd();
				}

				body = body.Replace("{Description}", user.Comments);
				body = body.Replace("{Name}", user.Fullname);

				try
				{
					bool IsSendEmail = SendEmail.EmailSend(emailto.EmailID, user.Fullname + "- Query", body, true);
				}

				catch (Exception e)
				{
					throw e;
				}
			}

			return RedirectToAction("ContactUs", "Home");
		}

		public ActionResult FAQ()
        {
			return View();
        }
	}
}