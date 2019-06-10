using DataProvider.Model;
using QuanLyThuVien.Common;
using QuanLyThuVien.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace QuanLyThuVien.Areas.Admin.Controllers
{
    public class BookController : BaseController
    {
        private IBookService _bookService;
        private IBookCategoryService _bookCategoryService;
        private IAuthorService _authorService;
        private IEbookService _ebookService;
        private IUserService _userService;
        private ITypeEbookService _typeEbookService;

        public BookController(ITypeEbookService typeEbookService, IUserService userService, IAuthorService authorService, IBookCategoryService bookCategoryService, IBookService bookService, IEbookService ebookService)
        {
            this._authorService = authorService;
            this._bookCategoryService = bookCategoryService;
            this._bookService = bookService;
            this._ebookService = ebookService;
            this._userService = userService;
            this._typeEbookService = typeEbookService;
        }

        public ActionResult Index()
        {
            return View();
        }

        public JsonResult List(int page = 1, string searchKey = "")
        {
            var result = _bookService.GetAllWithPageListSearch(page, 12, searchKey);
            //Lỗi A circular reference was detected while serializing an object of type
            return Json(new
            {
                data = result.Select(x => new
                {
                    BookID = x.BookID,
                    BookName = x.BookName,
                    Description = x.Description,
                    Alias = x.Alias,
                    AuthorID = x.Author,
                    CategoryID = x.Category,
                    ViewCount = x.ViewCount,
                    MoreImages = x.MoreImages,
                    CreatedDate = x.CreatedDate,
                    CreatedBy = x.CreatedBy,
                    TopHot = x.TopHot
                }),
                pageNumber = result.PageCount,
                keyword = searchKey
            }, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult Add()
        {
            IEnumerable<Author> listAuthor = _authorService.GetAllAuthor();
            ViewData["AuthorList"] = new SelectList(listAuthor, "AuthorID", "AuthorName");

            IEnumerable<BookCategory> listCategory = _bookCategoryService.GetAllBookCategory();
            ViewBag.ListCategory = new SelectList(listCategory, "CategoryID", "CategoryName");

            ViewBag.Title = "Thêm mới sách";

            return View();
        }

        [HttpPost]
        public ActionResult Add(Book book)
        {
            book.CreatedDate = DateTime.Now;
            var logininfo = (LoginInfor)Session[Constants.USERSESSION];
            User user = _userService.GetById(Convert.ToInt32(logininfo.UserID));
            book.CreatedBy = user.Name;
            book.Status = 1;
            book.ViewCount = 0;
            _bookService.Create(book);
            TempData["testmsg"] = " Thêm thành công ";
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id != null)
            {
                int idnew = (id ?? 1);
                var model = _bookService.GetById(idnew);
                IEnumerable<Author> listAuthor = _authorService.GetAllAuthor();
                ViewBag.AuthorList = new SelectList(listAuthor, "AuthorID", "AuthorName");

                IEnumerable<BookCategory> listCategory = _bookCategoryService.GetAllBookCategory();
                ViewBag.ListCategory = new SelectList(listCategory, "CategoryID", "CategoryName");
                ViewBag.Title = "Chỉnh sửa";
                return View("Edit", model);
            }
            else
            {
                return View("Index");
            }
        }

        [HttpPost]
        public ActionResult Edit(Book book)
        {
            if (ModelState.IsValid)
            {
                var bookOld = _bookService.GetById(book.BookID); bookOld.BookName = book.BookName; bookOld.Description = book.Description; bookOld.Alias = book.Alias; bookOld.AuthorID = book.AuthorID; bookOld.CategoryID = book.CategoryID; bookOld.MoreImages = book.MoreImages; bookOld.TopHot = book.TopHot;
                _bookService.Update(bookOld);
                RedirectToAction("Index");
            }
            return View("Index");
        }

        [HttpPost]
        public JsonResult Delete(int ID)
        {
            try
            {
                var book = _bookService.GetById(ID); book.Status = 0;
                _bookService.Update(book);
                return Json(new { success = true, message = "Xoá thành công" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult GetAuthor()
        {
            var listAuthor = _authorService.GetAllAuthor().Select(x => new
            {
                authorID = x.AuthorID,
                authorName = x.AuthorName
            });
            return Json(listAuthor, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetCategory()
        {
            var listCategory = _bookCategoryService.GetAllBookCategory().Select(x => new
            {
                CategoryID = x.CategoryID,
                CategoryName = x.CategoryName
            });
            return Json(listCategory, JsonRequestBehavior.AllowGet);
        }

        //Lấy danh sách chapter theo ID
        public ActionResult GetAllChapterByID(int page, int id)
        {
            var listChapter = _bookService.GetAllChapterByIDBook(page, 5, id);
            int pageNumber1 = listChapter.PageCount;
            int amounChapter1 = listChapter.Count;
            return Json(new
            {
                data = listChapter.Select(x => new
                {
                    ID = x.ChapterID,
                    NameChapter = x.NameChapter
                }),
                pageNumber = listChapter.PageCount,
                idbook = id,
                amountChapter = listChapter.Count
            }, JsonRequestBehavior.AllowGet);
        }

        //Lấy danh sách ebook theo ID
        public ActionResult GetAllEbookByIDBook(int page = 1, int idbook = 0)
        {
            var listEbook = _bookService.GetAllEbookByIDBook(page, 5, idbook);
            return Json(new
            {
                data = listEbook.Select(x => new
                {
                    BookID = idbook,
                    TypeEbookID = x.TypeEbookID,
                    TypeEbookName = x.NameType,
                    Link = x.Link
                }),
                pageNumber = listEbook.PageCount,
                idbook = idbook,
            }, JsonRequestBehavior.AllowGet);
        }

        //Lấy danh sách ebook hỗ trợ
        public ActionResult GetAllListTypeEbook()
        {
            var listTypeEbook = _typeEbookService.GetAllTypeEbook().Select(x => new
            {
                TypeEbookName = x.Name,
                TypeEbookID = x.TypeID
            });
            return Json(listTypeEbook, JsonRequestBehavior.AllowGet);
        }

        //Thêm mới một ebook
        public ActionResult AddEbook(Ebook ebookObj)
        {
            try
            {
                _ebookService.Create(ebookObj);
                return Json(new { success = true, message = "Thêm thành công", idbook = ebookObj.BookID }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Loại ebook này đã tồn tại. Vui lòng xoá hoặc thêm mới một loại ebook khác", idbook = ebookObj.BookID }, JsonRequestBehavior.AllowGet);
            }
        }

        //Update một ebook
        public JsonResult GetEbookByID(int idbook, int typeid)
        {
            var ebook = _ebookService.GetEbookByID2(idbook, typeid);
            return Json(new
            {
                BookID = idbook,
                TypeEbookID = typeid,
                LinkDownload = ebook.Link
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult UpdateEbook(Ebook ebookObj)
        {
            try
            {
                _ebookService.Update(ebookObj);
                return Json(new { success = true, message = "Sửa thành công", idbook = ebookObj.BookID }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.ToString(), idbook = ebookObj.BookID }, JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult DeleteEbook(int idbook, int typeid)
        {
            try
            {
                var ebook = _ebookService.GetEbookByID2(idbook, typeid);
                _ebookService.Delete(ebook);
                return Json(new { success = true, message = "Xoá thành công", idbook = idbook }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.ToString(), idbook = idbook }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}