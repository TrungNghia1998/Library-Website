using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QuanLyThuVien.Models
{
    public class AudioFile
    {
        public int BookID { get; set; }
        public int AudioID { get; set; }
        public string AudioName { get; set; }
        public Nullable<int> FileAudioSize { get; set; }
        public string FileAudioPath { get; set; }
    }
}