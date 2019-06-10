using BusinessLogic.ViewModel;
using DataProvider.Model;
using QuanLyThuVien.Service;
using System.IO;
using System.Linq;
using System.Web.Mvc;

namespace QuanLyThuVien.Areas.Admin.Controllers
{
    public class AudioBookController : BaseController
    {
        private IAudioBookService _audioBookService;
        private IBookService _bookService;

        public AudioBookController(IAudioBookService audioBookService, IBookService bookService)
        {
            this._audioBookService = audioBookService;
            this._bookService = bookService;
        }

        public ActionResult Index()
        {
            var audioList = _audioBookService.GetAllAudioBookView_Service();
            return View("Index", audioList);
        }

        [HttpPost]
        public ActionResult UploadAudio1(AudioBookModelView model)
        {
            string fileName = null;
            int fileSize = 0;
            int Size = 0;

            if(model.File != null)
            {
                fileName = Path.GetFileName(model.File.FileName);
                fileSize = model.File.ContentLength;
                Size = fileSize / 1000000;
                model.File.SaveAs(Server.MapPath("~/AudioFile/" + fileName));

                AudioBook audio = new AudioBook
                {
                    BookID = model.BookID,
                    AudioID = model.AudioID,
                    AudioName = model.AudioName,
                    FileAudioSize = Size,
                    FileAudioPath = "~/AudioFile/" + fileName,
                    Alias = model.Alias
                };

                _audioBookService.Update(audio);

                return RedirectToAction("Index");
            }
            else
            {
                AudioBook audio = _audioBookService.GetAudioBookByBookIDAndAudioID(model.BookID, model.AudioID);
                audio.AudioName = model.AudioName;
                audio.Alias = model.Alias;
                _audioBookService.Update(audio);

                return RedirectToAction("Index");
            }                                
        }

        [HttpPost]
        public ActionResult UploadAudio2(AudioBookModelView model)
        {
            string fileName = Path.GetFileName(model.File.FileName);
            int fileSize = model.File.ContentLength;
            int Size = fileSize / 1000000;
            model.File.SaveAs(Server.MapPath("~/AudioFile/" + fileName));
            AudioBook audio = new AudioBook
            {
                BookID = model.BookID,
                AudioID = model.AudioID,
                AudioName = model.AudioName,
                FileAudioSize = Size,
                FileAudioPath = "~/AudioFile/" + fileName,
                Alias = model.Alias
            };
            _audioBookService.Create(audio);
            return RedirectToAction("Index");
        }

        public ActionResult GetListNameBook()
        {
            var listBook = _bookService.GetAll().Select(x => new
            {
                idBook = x.BookID,
                nameBook = x.BookName
            });

            return Json(listBook, JsonRequestBehavior.AllowGet);
        }

        //Update audio
        public ActionResult GetAudiobyID(int idBook, int idAudioBook)
        {
            AudioBook audio = _audioBookService.GetAudioBookByID_Service(idBook, idAudioBook);
            return Json(new
            {
                BookID = audio.BookID,
                AudioID = audio.AudioID,
                AudioName = audio.AudioName,
                Alias = audio.Alias,
                UrlSave = audio.FileAudioPath
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult DeleteAudio(int idBook, int idAudioBook)
        {
            AudioBook audio = _audioBookService.GetAudioBookByID_Service(idBook, idAudioBook);
            _audioBookService.Delete(audio);
            //_audioBookService.Save();
            System.IO.File.Delete(Server.MapPath(audio.FileAudioPath));
            return RedirectToAction("Index");
        }
    }
}