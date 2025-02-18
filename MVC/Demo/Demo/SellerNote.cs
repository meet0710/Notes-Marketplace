//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Demo
{
    using System;
    using System.Collections.Generic;
    
    public partial class SellerNote
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SellerNote()
        {
            this.Downloads = new HashSet<Download>();
            this.SellerNotesReportedIssues = new HashSet<SellerNotesReportedIssue>();
            this.SellerNotesReviews = new HashSet<SellerNotesReview>();
        }
    
        public int ID { get; set; }
        public int SellerID { get; set; }
        public int Status { get; set; }
        public Nullable<int> ActionedBY { get; set; }
        public string AdminRemarks { get; set; }
        public Nullable<System.DateTime> PublishedDate { get; set; }
        public string Title { get; set; }
        public int Category { get; set; }
        public string DisplayPicture { get; set; }
        public Nullable<int> NoteType { get; set; }
        public Nullable<int> NumberofPages { get; set; }
        public string Description { get; set; }
        public string UniversityName { get; set; }
        public Nullable<int> Country { get; set; }
        public string Course { get; set; }
        public string CourseCode { get; set; }
        public string Professor { get; set; }
        public bool IsPaid { get; set; }
        public decimal SellingPrice { get; set; }
        public string NotesPreview { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<int> CreatedBy { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        public Nullable<int> ModifiedBy { get; set; }
        public bool isActive { get; set; }
    
        public virtual Category Category1 { get; set; }
        public virtual Country Country1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Download> Downloads { get; set; }
        public virtual NoteStatu NoteStatu { get; set; }
        public virtual SellerNote SellerNotes1 { get; set; }
        public virtual SellerNote SellerNote1 { get; set; }
        public virtual Type Type { get; set; }
        public virtual User User { get; set; }
        public virtual User User1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SellerNotesReportedIssue> SellerNotesReportedIssues { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SellerNotesReview> SellerNotesReviews { get; set; }
    }
}
