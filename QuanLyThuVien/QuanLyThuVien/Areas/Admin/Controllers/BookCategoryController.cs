using DataProvider.Model;
using QuanLyThuVien.Service;
using System;
using System.Linq;
using System.Web.Mvc;

namespace QuanLyThuVien.Areas.Admin.Controllers
{
    public class BookCategoryController : BaseController
    {
        private IBookCategoryService _bookCategoryService;
        private IUserService _userService;

        public BookCategoryController(IUserService userService, IBookCategoryService bookCategoryService, IBookService bookService)
        {
            this._bookCategoryService = bookCategoryService;
            this._userService = userService;
        }

        public ActionResult Index()
        {
            return View();
        }

        public JsonResult List(int page = 1, string searchKey = "")
        {
            var result = _bookCategoryService.GetAllWithPageListSearch(page, 12, searchKey);
            return Json(new
            {
                data = result.Select(x => new
                {
                    CategoryID = x.CategoryID,
                    CategoryName = x.CategoryName,
                    SeoTitle = x.SeoTitle,
                    MetaKeywords = x.MetaKeywords,
                    MetaDescription = x.MetaDescription,
                    Status = x.Status,
                    CreatedDate = x.CreatedDate,
                    CreatedBy = x.CreatedBy,
                    ShowOnHome = x.ShowOnHome
                }),
                pageNumber = result.PageCount,
                keyword = searchKey
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Add(BookCategory bookcate)
        {
            try
            {
                bookcate.CreatedDate = DateTime.Now;
                bookcate.Status = true;
                bookcate.CreatedBy = TenNguoiTao();
                bookcate.ShowOnHome = true;
                _bookCategoryService.Create(bookcate);
                return Json(new { success = true, message = "Thêm thành công" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult GetbyID(int ID)
        {
            var bookcategory = _bookCategoryService.GetById(ID);
            return Json(new
            {
                CategoryID = bookcategory.CategoryID,
                CategoryName = bookcategory.CategoryName,
                SeoTitle = bookcategory.SeoTitle,
                MetaKeywords = bookcategory.MetaKeywords,
                MetaDescription = bookcategory.MetaDescription,
                Status = bookcategory.Status,
                CreatedDate = bookcategory.CreatedDate,
                CreatedBy = bookcategory.CreatedBy,
                ShowOnHome = bookcategory.ShowOnHome
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Update(BookCategory bookcate)
        {
            try
            {
                BookCategory bookcateold = _bookCategoryService.GetById(bookcate.CategoryID); bookcateold.CategoryName = bookcate.CategoryName; bookcateold.SeoTitle = bookcate.SeoTitle; bookcateold.MetaKeywords = bookcate.MetaKeywords; bookcateold.MetaDescription = bookcate.MetaDescription; bookcateold.ShowOnHome = bookcate.ShowOnHome;
                bookcate.Status = true;
                _bookCategoryService.Update(bookcateold);
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
                var bookcate = _bookCategoryService.GetById(ID);
                bookcate.Status = false;
                _bookCategoryService.Update(bookcate);
                return Json(new { success = true, message = "Xoá thành công" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        private string TenNguoiTao()
        {
            var user = (Common.LoginInfor)Session[Common.Constants.USERSESSION];
            var user2 = _userService.GetById(Convert.ToInt32(user.UserID));
            return user2.Name;
        }
    }
}