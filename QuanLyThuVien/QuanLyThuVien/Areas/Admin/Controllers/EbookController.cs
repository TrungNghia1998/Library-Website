using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLogic;
using BusinessLogic.Repository.Base;
using BusinessLogic.Repository;
using QuanLyThuVien.Service;

namespace QuanLyThuVien.Areas.Admin.Controllers
{
    public class EbookController : BaseController
    {
        private IBookService _bookService;
        private IBookCategoryService _bookCategoryService;
        private IAuthorService _authorService;
        private IEbookService _ebookService;
        private IUserService _userService;
        private ITypeEbookService _typeEbookService;

        public EbookController(ITypeEbookService typeEbookService, IUserService userService, IAuthorService authorService, IBookCategoryService bookCategoryService, IBookService bookService, IEbookService ebookService)
        {
            this._authorService = authorService;
            this._bookCategoryService = bookCategoryService;
            this._bookService = bookService;
            this._ebookService = ebookService;
            this._userService = userService;
            this._typeEbookService = typeEbookService;
        }

        public EbookController()
        {

        }

        // GET: Admin/Ebook
        //EbookRepository ebookRepo = new EbookRepository();

        public ActionResult Index()
        {
            var listEbookView = _ebookService.GetAllListEbookView();
            return View(listEbookView);
        }

        public ActionResult GetAllListBook()
        {
            var listBook = _bookService.GetAll().Select(x => new 
            {
                BookName=x.BookName,
                BookID=x.BookID
            });
            return Json(listBook, JsonRequestBehavior.AllowGet);
        }

        public ActionResult List()
        {
            var listEbookView = _ebookService.GetAllListEbookView().Select(x => new
            {
                BookID = x.BookID,
                TypeEbookID = x.TypeEbookID,
                NameBook = x.NameBook,
                NameType = x.NameType,
                Link = x.Link
            });
            return Json(new { data = listEbookView }, JsonRequestBehavior.AllowGet);
        }
    }
}