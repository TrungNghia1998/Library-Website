using BusinessLogic.Repository;
using BusinessLogic.Repository.Base;
using QuanLyThuVien.Models;
using QuanLyThuVien.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyThuVien.Controllers
{
    public class BookController : Controller
    {
        private IBookService _bookService;
        private IBookCategoryService _bookCategoryService;
        private IAuthorService _authorService;
        private IEbookService _ebookService;
        private IUserService _userService;
        private ITypeEbookService _typeEbookService;
        private IAudioBookService _audioBookService;
        private IChapterDetailService _chapterDetailService;
        private IInformationService _informationService;

        public BookController(IInformationService informationService, IChapterDetailService chapterDetailService , IAudioBookService audioBookService, ITypeEbookService typeEbookService, IUserService userService, IAuthorService authorService, IBookCategoryService bookCategoryService, IBookService bookService, IEbookService ebookService)
        {
            this._authorService = authorService;
            this._informationService = informationService;
            this._chapterDetailService = chapterDetailService;
            this._audioBookService = audioBookService;
            this._bookCategoryService = bookCategoryService;
            this._bookService = bookService;
            this._ebookService = ebookService;
            this._userService = userService;
            this._typeEbookService = typeEbookService;
        }

        public BookController()
        {

        }

        //Trang chủ
        public ActionResult Index()
        {
            return View();
        }

        //Lấy tất cả sách in ra trên trang chủ
        [ChildActionOnly]
        public ActionResult BodyListBook(/*int page = 1, int pageSize = 10*/)
        {
            //var Execute = new BookRepository();
            //var modelBook = Execute.GetAll();

            var modelBook = _bookService.GetAll();

            //var modelBook = Execute.ListAllWithPageListBook(page, pageSize);
            return PartialView(modelBook);
        }

        //Lấy ra bảng bên phải
        [ChildActionOnly]
        public ActionResult TaoBangBenPhai()
        {
            var model = _bookCategoryService.GetAll();
            return PartialView(model);
        }

        //Cấu hình trong RouteConfig
        //Controller thực hiện khi người dùng click chọn thể loại sách trên combobox hoặc trên bảng slide bên phải
        public ActionResult Category(string SeoTitle, int page = 1, int pageSize = 20)
        {
            if (SeoTitle == "tat-ca-sach")
            {
                //var allBook = new BookRepository().GetAll();
                var allBook = _bookService.ListAllWithPageListBook(page, pageSize);
                var TheLoaiSachDuocChon = _bookCategoryService.GetByString(SeoTitle);
                ViewBag.TheLoaiSach = _bookCategoryService.GetById(TheLoaiSachDuocChon.CategoryID);
                return View(allBook);
            }
            else
            {
                var TheLoaiSachDuocChon = _bookCategoryService.GetByString(SeoTitle);
                //var BookTrongTheLoaiSachDuocChon = new BookRepository().ListBookByCategory(TheLoaiSachDuocChon.CategoryID);
                var BookTrongTheLoaiSachDuocChon = _bookService.ListBookByCategoryWithPageListBook(TheLoaiSachDuocChon.CategoryID, page, pageSize);
                ViewBag.TheLoaiSach = _bookCategoryService.GetById(TheLoaiSachDuocChon.CategoryID);
                return View(BookTrongTheLoaiSachDuocChon);
            }
            //return View();
        }

        public JsonResult ListName(string q)
        {
            var data = _bookService.ListName(q);
            return Json(new
            {
                data = data,
                status = true
            }, JsonRequestBehavior.AllowGet);
        }

        //Cấu hình trong RouteConfig
        //Controller thực hiện khi người dùng click chọn thông tin cụ thể trên combobox Thông tin 
        //
        public ActionResult Information(string MetaTitle)
        {
            var ThongTinDuocChon = _informationService.GetByString(MetaTitle);
            return View(ThongTinDuocChon);
        }

        //Cấu hình trong RouteConfig
        //Controller thực hiện khi click vào một cuốn sách bất kỳ
        //Chi tiết cuốn sách được Click
        public ActionResult ShowBook(int bookID)
        {
            var Book = _bookService.GetById(bookID);
            ViewBag.Author = _authorService.GetById(Book.AuthorID.Value);
            ViewBag.Category = _bookCategoryService.GetById(Book.CategoryID.Value);
            ViewBag.Ebook = _ebookService.GetAllListEbookViewByID(bookID);
            //ViewBag.Chapter = new ChapterDetailRepository().GetById(bookID);
            return View(Book);
        }

        //Button Search
        public ActionResult Search(string keyword, int page = 1, int pageSize = 2)
        {
            //var TheLoaiSachDuocChon = new BookCategoryRepository().GetByString(SeoTitle);
            ////var BookTrongTheLoaiSachDuocChon = new BookRepository().ListBookByCategory(TheLoaiSachDuocChon.CategoryID);
            var BookSearch = _bookService.SearchBook(keyword, page, pageSize);
            ViewBag.Keyword = keyword;
            // ViewBag.TheLoaiSach = new BookCategoryRepository().GetById(TheLoaiSachDuocChon.CategoryID);
            return View(BookSearch);
        }

        public ActionResult BodyListBook(int page = 1, int pageSize = 20)
        {
            //var Execute = new BookCategoryRepository();
            var Execute = _bookService;
            //var model = Execute.GetAll();
            var model = Execute.ListAllWithPageListBook(page, pageSize);
            //Lấy model đẩy xuống View
            return PartialView("BodyListBook", model);
        }

        [ChildActionOnly]
        public ActionResult ComboboxDanhSachChuong(string chapAlias)
        {
            var ChuongSachDuocChon = _chapterDetailService.GetByString(chapAlias);
            //var Book = new BookRepository().ListChapterDetailOfBook(ChuongSachDuocChon.IDBook);
            var modelListAllChuongCuaSach = _bookService.ListChapterDetailOfBook(ChuongSachDuocChon.IDBook);
            return PartialView(modelListAllChuongCuaSach);
        }

        [ChildActionOnly]
        public ActionResult DanhSachChuong(int bookID)
        {
            var Book = _bookService.GetById(bookID);
            var model = _bookService.ListChapterDetailOfBook(Book.BookID);
            return PartialView(model);

        }


        //Khi người dùng click vào button Audio Book
        [ChildActionOnly]
        public ActionResult ButtonAudioBook(int bookID)
        {
            var Book =  _bookService.GetById(bookID);
            ViewBag.Book = Book.Alias;
            var model = _audioBookService.ListAudioByBook(Book.BookID);
            return PartialView(model);
        }

        //Load nút Button ReadOnline
        [ChildActionOnly]
        public ActionResult ButtonReadOnline(int bookID)
        {
            var Book = _bookService.GetById(bookID);
            var model = _bookService.TheFirstChapOfBook(Book.BookID);
            return PartialView(model);
        }



        //Cấu hình trong RouteConfig
        //Controller thực hiện việc đọc online (sau khi click vào button Đọc Online)
        public ActionResult ReadOnline(string chapAlias)
        {
            var ChuongSachDuocChon = _chapterDetailService.GetByString(chapAlias);
            ViewBag.Book = _bookService.GetById(ChuongSachDuocChon.IDBook);
            ViewBag.ChuongSachDuocChon = ChuongSachDuocChon;
            var ListAllChuongTruChuongDauTien = _bookService.ListChapterDetailOfBookDeleteFirst(ChuongSachDuocChon.IDBook);
            return View(ListAllChuongTruChuongDauTien);
        }

        //Khi click vào Button Audio
        public ActionResult ShowAudioBook(string audioName)
        {
            //var AudioBook = new AudioBookRepository().ListAllAudioBook();
            var AudioBook = _audioBookService.ListAudioByNameAudio(audioName);
            var Book = _bookService.GetById(AudioBook.BookID);
            ViewBag.Book = Book;
            ViewBag.Author = _authorService.GetById(Book.AuthorID.Value);
            ViewBag.Category = _bookCategoryService.GetById(Book.CategoryID.Value);
            return View(AudioBook);
        }

        public ActionResult ChangeChapter(string chapAlias)
        {
            var ChuongSachDuocChon = _chapterDetailService.GetByString(chapAlias);
            ViewBag.Book = _bookService.GetById(ChuongSachDuocChon.IDBook);
            ViewBag.ChuongSachDuocChon = ChuongSachDuocChon;
            var ListAllChuongTruChuongDuocChon = _bookService.ListChuongSachTruChuongDuocChon(ChuongSachDuocChon.IDBook, ChuongSachDuocChon.ChapterID);
            return View(ListAllChuongTruChuongDuocChon);
        }
    }
}