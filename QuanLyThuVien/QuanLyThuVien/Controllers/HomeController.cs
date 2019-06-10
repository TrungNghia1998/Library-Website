using BusinessLogic.Repository;
using DataProvider.Model;
using QuanLyThuVien.Service;
using System;
using System.Linq;
using System.Web.Mvc;

namespace QuanLyThuVien.Controllers
{
    public class HomeController : Controller
    {
        private IBookService _bookService;
        private IBookCategoryService _bookCategoryService;
        private IInformationService _informationService;
        private IQuotationService _quotationService;

        public HomeController(IQuotationService quotationService, IInformationService informationService, IBookCategoryService bookCategoryService, IBookService bookService)
        {      
            this._quotationService = quotationService;
            this._informationService = informationService;
            this._bookCategoryService = bookCategoryService;
            this._bookService = bookService;           
        }
      
        // Trang chủ
        public ActionResult Index(int page = 1, int pageSize = 20)
        {
            //var Execute = new BookRepository();
            //var model = Execute.ListAllWithPageListBook(page, pageSize);

            var model = _bookService.ListAllWithPageListBook(page, pageSize);

            //Lấy model đẩy xuống View
            return View(model);
        }

        [ChildActionOnly]
        public ActionResult RandomQuotation()
        {
            Random rd = new Random();
            //var Execute = new QuotationRepository();
            //IQueryable<Quotation> model = Execute.GetAll();

            IQueryable<Quotation> model = _quotationService.GetAll();

            int min = 0;
            int max = model.Count();
            int QuotationRandom = rd.Next(min, max);
            //var modelQuotation = Execute.GetOneQuotation(QuotationRandom);
            string noidung = model.AsEnumerable().ElementAt(QuotationRandom).NameQuotation;
            ViewBag.NoiDung = noidung;
            return PartialView();
        }

        //Chỉ gọi một phần của trang không thể gọi thành một trang được
        [ChildActionOnly]
        public ActionResult MenuHeaderTheLoaiSach()
        {
            //var Execute = new BookCategoryRepository();
            //var modelTheLoaiSach = Execute.GetAll();

            var modelTheLoaiSach = _bookCategoryService.GetAll();
            return PartialView(modelTheLoaiSach);
        }

        //Chỉ gọi một phần của trang không thể gọi thành một trang được
        [ChildActionOnly]
        public ActionResult MenuHeaderThongTin()
        {
            //var Execute = new InfomationRepository();
            //var modelThongTin = Execute.GetAll();

            var modelThongTin = _informationService.GetAll(); 

            return PartialView(modelThongTin);
        }
    }
}