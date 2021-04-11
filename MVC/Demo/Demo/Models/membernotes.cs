﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Demo.Models
{
    public class membernotes
    {
        public int NoteID { get; set; }
        public string NoteTitle { get; set; }
        public string  category { get; set; }
        public string status { get; set; }
        public int downloads { get; set; }
        public int earning { get; set; }
        public DateTime AddedDate { get; set; }
        public DateTime PublishedDate { get; set; }
    }
}