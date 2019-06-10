using BusinessLogic.Repository.Base;
using Microsoft.ApplicationInsights.Extensibility.Implementation;
using QuanLyThuVien.Models;
using QuanLyThuVien.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyThuVien.Controllers
{
    public class LoginController : Controller
    {
        private readonly IUserService _userService;

        public LoginController(IUserService userService)
        {
            this._userService = userService;
        }

        public LoginController()
        {

        }

        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(UserModelView model)
        {
            if(ModelState.IsValid)
            {              
                int result = _userService.checkLogin(model.UserName, model.Password);

                if (result == 1)
                {
                    return RedirectToAction("Index", "Home");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Sai tài khoản hoặc mật khẩu");
                }
                else if(result==-1)
                {
                    ModelState.AddModelError( "", "Tài khoản đã bị khoá");
                }
                else
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại");
                }
                   
            }
            return View("Index");
        }
    }
}