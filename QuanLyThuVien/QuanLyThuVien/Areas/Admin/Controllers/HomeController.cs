using QuanLyThuVien.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyThuVien.Areas.Admin.Controllers
{
    public class HomeController : BaseController
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        public ActionResult Nav_UserLogin()
        {
            var session = (LoginInfor)Session[QuanLyThuVien.Common.Constants.USERSESSION];
            if(session!=null)
            {
                ViewBag.UserLogin = "Admin: " + session.Username;
            }
            return PartialView();
        }
    }
}