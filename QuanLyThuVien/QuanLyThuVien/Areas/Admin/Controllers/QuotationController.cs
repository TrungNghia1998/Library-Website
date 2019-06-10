using BusinessLogic.Repository;
using DataProvider.Model;
using QuanLyThuVien.Models;
using QuanLyThuVien.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyThuVien.Areas.Admin.Controllers
{
    public class QuotationController : BaseController
    {
        //QuotationRepository quotationRepo = new QuotationRepository();

        private IBookService _bookService;
        private IBookCategoryService _bookCategoryService;
        private IAuthorService _authorService;
        private IEbookService _ebookService;
        private IUserService _userService;
        private ITypeEbookService _typeEbookService;
        private IQuotationService _quotationService;

        public QuotationController(IQuotationService quotationService, ITypeEbookService typeEbookService, IUserService userService, IAuthorService authorService, IBookCategoryService bookCategoryService, IBookService bookService, IEbookService ebookService)
        {
            this._authorService = authorService;
            this._quotationService = quotationService;
            this._bookCategoryService = bookCategoryService;
            this._bookService = bookService;
            this._ebookService = ebookService;
            this._userService = userService;
            this._typeEbookService = typeEbookService;
        }

        public QuotationController()
        {

        }

        public ActionResult Index()
        {
            return View();
        }

        public JsonResult List(int page = 1, string searchKey = "")
        {
            var result = _quotationService.GetAllWithPageListSearch(page, 12, searchKey);
            return Json(new { data = result, pageNumber = result.PageCount, keyword = searchKey }, JsonRequestBehavior.AllowGet);
            //return Json(new { data = userRepo.GetAll() }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Add(Quotation quo)
        {
            try
            {
                _quotationService.Create(quo);
                return Json(new { success = true, message = "Add Successfully" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                return Json(new { success = false, message = ex.ToString() }, JsonRequestBehavior.AllowGet);
            }

        }
        public JsonResult GetbyID(int ID)
        {
            var quo = _quotationService.GetById(ID);
            return Json(quo, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Update(Quotation quo)
        {
            try
            {
                _quotationService.Update(quo);
                return Json(new { success = true, message = "Update Successfully" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                return Json(new { success = false, message = ex.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }
        public JsonResult Delete(int ID)
        {
            try
            {
                var quo = _quotationService.GetById(ID);
                _quotationService.Delete(quo);
                return Json(new { success = true, message = "Delete Successfully" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                return Json(new { success = false, message = ex.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

    }
}