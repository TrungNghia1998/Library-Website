using BusinessLogic.Repository.Base;
using QuanLyThuVien.Areas.Admin.Models;
using QuanLyThuVien.Common;
using QuanLyThuVien.Service;
using System.Web.Mvc;

namespace QuanLyThuVien.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        
        //private UserRepository userRepo = new UserRepository();

        private IUserService _userService;
        
        public LoginController(IUserService userService)
        {
            this._userService = userService;           
        }
       
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View("Index");
        }

        [HttpPost]
        public ActionResult Login(UserLogin model)
        {
            if (ModelState.IsValid)
            {
                var result = _userService.checkLogin(model.Username, model.Password);
                if (result == 1)
                {
                    var user = _userService.GetUserByUsername(model.Username);
                    var loginInfo = new LoginInfor();
                    loginInfo.UserID = user.UserID;
                    loginInfo.Username = user.UserName;
                    Session.Add(Constants.USERSESSION, loginInfo);
                    return RedirectToAction("Index", "Home");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản bị khoá");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại");
                }
                else
                {
                    ModelState.AddModelError("", "Đăng nhập thất bại");
                }
            }
            return View("Index");
        }

        public ActionResult Logout()
        {
            Session[Constants.USERSESSION] = null;
            return Redirect("/Admin/Login/");
        }
    }
}