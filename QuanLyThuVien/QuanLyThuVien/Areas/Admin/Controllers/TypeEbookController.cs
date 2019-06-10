using BusinessLogic.Repository;
using DataProvider.Model;
using QuanLyThuVien.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyThuVien.Areas.Admin.Controllers
{
    public class TypeEbookController : BaseController
    {        
        private IBookService _bookService;
        private IBookCategoryService _bookCategoryService;
        private IAuthorService _authorService;
        private IEbookService _ebookService;
        private IUserService _userService;
        private ITypeEbookService _typeEbookService;

        public TypeEbookController(ITypeEbookService typeEbookService, IUserService userService, IAuthorService authorService, IBookCategoryService bookCategoryService, IBookService bookService, IEbookService ebookService)
        {
            this._authorService = authorService;
            this._bookCategoryService = bookCategoryService;
            this._bookService = bookService;
            this._ebookService = ebookService;
            this._userService = userService;
            this._typeEbookService = typeEbookService;
        }

        public TypeEbookController()
        {

        }


        // GET: Admin/TypeEbook
        public ActionResult Index()
        {
            List<TypeEbook> listTypeEbook = _typeEbookService.GetAllTypeEbook();
            return View(listTypeEbook);
        }


        //Thêm mới một ebook
        public ActionResult Add(TypeEbook typeObj)
        {
            try
            {
                typeObj.Status = 1;
                _typeEbookService.Create(typeObj);
                return Json(new { success = true, message = "Thêm thành công"}, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                return Json(new { success = false, message =ex.Message.ToString()}, JsonRequestBehavior.AllowGet);
            }
        }

        //Update một ebook
        public JsonResult GetTypeEbookByID(int typeid)
        {
            var typeEbook = _typeEbookService.GetById(typeid);
            return Json(new
            {
                TypeID= typeEbook.TypeID,
                Name=typeEbook.Name
            }, JsonRequestBehavior.AllowGet);
        }


        public JsonResult Update(TypeEbook typeObj)
        {
            try
            {
                typeObj.Status = 1;
                _typeEbookService.Update(typeObj);
                return Json(new { success = true, message = "Chỉnh sửa thành công"}, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                return Json(new { success = false, message = ex.Message.ToString()}, JsonRequestBehavior.AllowGet);
            }
        }


        public JsonResult Delete(int typeid)
        {
            try
            {
                var typeEbook = _typeEbookService.GetById(typeid);
                typeEbook.Status = 0;
                _typeEbookService.Update(typeEbook);
                return Json(new { success = true, message = "Xoá thành công"}, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {

                return Json(new { success = false, message = ex.Message.ToString()}, JsonRequestBehavior.AllowGet);
            }
        }
    }
}