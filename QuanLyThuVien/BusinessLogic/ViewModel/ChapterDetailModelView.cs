using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.ViewModel
{
    public class ChapterDetailModelView
    {
       public int IDBook { get; set; }
        public string NameBook { get; set;  }
        public int ChapterID { get; set; }
        public string Alias { get; set; }
        public string NameChapter { get; set; }
        public string Content { get; set; }
    }
}
