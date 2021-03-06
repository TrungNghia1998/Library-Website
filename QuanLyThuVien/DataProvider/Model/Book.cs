//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataProvider.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Book
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Book()
        {
            this.ChapterDetails = new HashSet<ChapterDetail>();
            this.AudioBooks = new HashSet<AudioBook>();
            this.Ebooks = new HashSet<Ebook>();
        }
    
        public int BookID { get; set; }
        public string BookName { get; set; }
        public string Description { get; set; }
        public string Alias { get; set; }
        public Nullable<int> AuthorID { get; set; }
        public Nullable<int> CategoryID { get; set; }
        public Nullable<int> ViewCount { get; set; }
        public string MoreImages { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<bool> TopHot { get; set; }
        public Nullable<int> Status { get; set; }
    
        public virtual Author Author { get; set; }
        public virtual BookCategory BookCategory { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChapterDetail> ChapterDetails { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AudioBook> AudioBooks { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Ebook> Ebooks { get; set; }
    }
}
