using DataProvider.Model;
using QuanLyThuVien.Service;
using System;
using System.Linq;
using System.Web.Mvc;

namespace QuanLyThuVien.Areas.Admin.Controllers
{
    public class UserController : BaseController
    {        
        private IUserService _userService;

        public UserController(IUserService userService)
        {
            this._userService = userService;
        }

        public ActionResult Index()
        {
            return View();
        }

        public JsonResult List(int page = 1, string searchKey = "")
        {
            var result = _userService.GetAllWithPageListSearch(page, 12, searchKey);
            return Json(new
            {
                data = result.Select(x => new
                {
                    UserID = x.UserID,
                    UserName = x.UserName,
                    Password = x.Password,
                    Name = x.Name,
                    Address = x.Address,
                    Email = x.Email,
                    Phone = x.Phone,
                    CreatedDate = x.CreatedDate,
                    Status = x.Status,
                    Type = x.Type
                }),
                pageNumber = result.PageCount,
                keyword = searchKey
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Add(User usr)
        {
            try
            {
                usr.CreatedDate = DateTime.Now;
                usr.Status = true;
                _userService.Create(usr);
                return Json(new { success = true, message = "Thêm  thành công" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult GetbyID(int ID)
        {
            var user = _userService.GetById(ID);
            return Json(new
            {
                UserID = user.UserID,
                UserName = user.UserName,
                Password = user.Password,
                Name = user.Name,
                Address = user.Address,
                Email = user.Email,
                Phone = user.Phone,
                CreatedDate = user.CreatedDate,
                Status = user.Status,
                Type = user.Type
            }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Update(User usr)
        {
            try
            {
                usr.CreatedDate = DateTime.Now;
                usr.Status = true;
                _userService.Update(usr);
                return Json(new { success = true, message = "Chỉnh sửa thành công" }, JsonRequestBehavior.AllowGet);
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
                var usr = _userService.GetById(ID);
                usr.Status = false;
                _userService.Update(usr);
                return Json(new { success = true, message = "Xoá thành công" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.ToString() }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}