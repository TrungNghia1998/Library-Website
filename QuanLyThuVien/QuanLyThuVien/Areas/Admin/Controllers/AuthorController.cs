using DataProvider.Model;
using QuanLyThuVien.Service;
using System;
using System.Linq;
using System.Web.Mvc;

namespace QuanLyThuVien.Areas.Admin.Controllers
{
    public class AuthorController : BaseController
    {
        private IAuthorService _authorService;

        public AuthorController(IAuthorService authorService)
        {
            this._authorService = authorService;
        }

        public ActionResult Index()
        {
            return View();
        }

        public JsonResult List(int page = 1, string searchKey = "")
        {
            var result = _authorService.GetAllWithPageListSearch(page, 12, searchKey);
            return Json(new
            {
                data = result.Select(x => new
                {
                    AuthorID = x.AuthorID,
                    AuthorName = x.AuthorName,
                    DescriptionAuthor = x.DescriptionAuthor,
                    Alias = x.Alias
                }),
                pageNumber = result.PageCount,
                keyword = searchKey
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Add(Author auth)
        {
            try
            {
                auth.Status = 1;
                _authorService.Create(auth);
                return Json(new { success = true, message = "Thêm thành công" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult GetbyID(int ID)
        {
            var auth = _authorService.GetById(ID);
            return Json(new
            {
                AuthorID = auth.AuthorID,
                AuthorName = auth.AuthorName,
                DescriptionAuthor = auth.DescriptionAuthor,
                Alias = auth.Alias
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Update(Author auth)
        {
            try
            {
                auth.Status = 1;
                _authorService.Update(auth);
                return Json(new { success = true, message = "Sửa thành công" }, JsonRequestBehavior.AllowGet);
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
                var auth = _authorService.GetById(ID);
                auth.Status = 0;
                _authorService.Update(auth);
                return Json(new { success = true, message = "Xoá thành công" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}