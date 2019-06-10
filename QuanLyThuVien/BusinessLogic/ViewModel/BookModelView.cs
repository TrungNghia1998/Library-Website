using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.ViewModel
{
    public class BookModelView
    {
        public int BookID { get; set; }
        public string BookName { get; set; }
        public string Description { get; set; }
        public string Alias { get; set; }
        public string Author { get; set; }
        public string Category { get; set; }
        public Nullable<int> ViewCount { get; set; }
        public string MoreImages { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<bool> TopHot { get; set; }
        public Nullable<int> Status { get; set; }
    }
}
