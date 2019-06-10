using BusinessLogic.Repository;
using DataProvider.Model;
using QuanLyThuVien.Areas.Admin.Models;
using QuanLyThuVien.Models;
using QuanLyThuVien.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyThuVien.Areas.Admin.Controllers
{
    public class ChapterDetailController : BaseController
    {
        private IBookService _bookService;
        private IBookCategoryService _bookCategoryService;
        private IAuthorService _authorService;
        private IEbookService _ebookService;
        private IUserService _userService;
        private ITypeEbookService _typeEbookService;
        private IChapterDetailRepository _chapterDetailRepository;

        public ChapterDetailController(IChapterDetailRepository chapterDetailRepository, ITypeEbookService typeEbookService, IUserService userService, IAuthorService authorService, IBookCategoryService bookCategoryService, IBookService bookService, IEbookService ebookService)
        {
            this._authorService = authorService;
            this._chapterDetailRepository = chapterDetailRepository;
            this._bookCategoryService = bookCategoryService;
            this._bookService = bookService;
            this._ebookService = ebookService;
            this._userService = userService;
            this._typeEbookService = typeEbookService;
        }
     
        // GET: Admin/ChapterDetail
        //ChapterDetailRepository chapterRepo = new ChapterDetailRepository();

        public ActionResult Index(int id = 0, string namebook = "")
        {
            return View();
        }

        public JsonResult List(int page = 1, string searchKey = "")
        {
            var result = _chapterDetailRepository.GetAllWithPageListSearch(page, 12, searchKey);
            return Json(new
            {
                data = result.Select(x => new {
                    IDBook = x.IDBook,NameBook=x.NameBook,
                    ChapterID = x.ChapterID,
                    Alias = x.Alias,
                    NameChapter = x.NameChapter,
                    Content = x.Content
                }),
                pageNumber = result.PageCount,
                keyword = searchKey
            }, JsonRequestBehavior.AllowGet);
        }


        public ActionResult GetListBook()
        {
            var listbook = _bookService.GetAll().Select(x => new
            {
                BookID = x.BookID,
                BookName = x.BookName
            });
            return Json(listbook, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult Add(int idbook)
        {
            LoadData(idbook);
            return View("Add");
        }


        public void LoadData(int idbook)
        {
            var book = _bookService.GetById(idbook);
            var lastChapter = _bookService.GetAllChapterByIDBook(1, 10000, idbook).Count;
            ViewBag.IDBookM = idbook;
            ViewBag.ChapterIDM = lastChapter;
            ViewBag.NameBook = book.BookName;
        }


        [HttpPost]
        public ActionResult Add(ChapterDetailModelInput chapter)
        {
            if (ModelState.IsValid)
            {
                if (_chapterDetailRepository.IsContainInListChapterBook(chapter.IDBook, chapter.ChapterID))
                {
                    ModelState.AddModelError("", "ChapterID này đã tồn tại");
                }
                else
                {
                    ChapterDetail ch = new ChapterDetail
                    {
                        IDBook = chapter.IDBook,
                        ChapterID = chapter.ChapterID,
                        Alias = chapter.Alias,
                        NameChapter = chapter.NameChapter,
                        Content = chapter.Content
                    };
                    _chapterDetailRepository.Create(ch);
                    return RedirectToAction("Edit", "Book", new { id = chapter.IDBook });
                }

            }
            LoadData(chapter.IDBook);
            return View();
        }


        [HttpPost]
        public JsonResult Delete(int bookid, int chapterid)
        {
            try
            {
                var chapter = _chapterDetailRepository.getByID2(bookid, chapterid);
                _chapterDetailRepository.Delete(chapter);
                return Json(new { success = true, message = "Xoá thành công" ,idbook=bookid}, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                return Json(new { success = false, message = ex.ToString() }, JsonRequestBehavior.AllowGet);
            }

        }

        public JsonResult Search(string searchkey)
        {
            var data = _bookService.GetAllWithPageListSearch(1, 12, searchkey);
            return Json(new
            {
                data = data.Select(x => new
                {
                    BookID = x.BookID,
                    BookName = x.BookName,
                })
            }, JsonRequestBehavior.AllowGet);
        }


        [HttpGet]
        public ActionResult Edit(int idbook, int idChapter)
        {
            LoadData(idbook);
            var chapter = _chapterDetailRepository.getByID2(idbook, idChapter);
            var model = new ChapterDetailModelInput
            {
                IDBook = chapter.IDBook,
                ChapterID = chapter.ChapterID,
                Alias = chapter.Alias,
                NameChapter = chapter.NameChapter,
                Content = chapter.Content
            };
            return View("Edit", model);
        }


        [HttpPost]
        public ActionResult Edit(ChapterDetailModelInput chapter)
        {
            if (ModelState.IsValid)
            {
                ChapterDetail ch = new ChapterDetail
                {
                    IDBook = chapter.IDBook,
                    ChapterID = chapter.ChapterID,
                    Alias = chapter.Alias,
                    NameChapter = chapter.NameChapter,
                    Content = chapter.Content
                };
                _chapterDetailRepository.Update(ch);
                return RedirectToAction("Edit", "Book", new { id = chapter.IDBook });

            }
            LoadData(chapter.IDBook);
            return View();
        }


    }
}