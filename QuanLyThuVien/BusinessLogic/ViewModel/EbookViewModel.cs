using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.ViewModel
{
    public class EbookViewModel
    {
        public int BookID { get; set; }
        public int TypeEbookID { get; set; }
        public string NameBook { get; set; }
        public string NameType { get; set; }
        public string Link { get; set; }
    }
}
