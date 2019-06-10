using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace QuanLyThuVien
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
             name: "Nghe Audio",
             url: "audio/{BookAlias}/{audioName}",
             defaults: new { controller = "Book", action = "ShowAudioBook", id = UrlParameter.Optional },
             namespaces: new[] { "QuanLyThuVien.Controllers" }
         );


            routes.MapRoute(
             name: "Đọc Online Chuyển Chương",
             url: "doc-sach/{BookAlias}/{chapAlias}",
             defaults: new { controller = "Book", action = "ChangeChapter", id = UrlParameter.Optional },
             namespaces: new[] { "QuanLyThuVien.Controllers" }
         );

            routes.MapRoute(
             name: "Đọc Online",
             url: "doc-sach/{BookAlias}/{chapAlias}",
             defaults: new { controller = "Book", action = "ReadOnline", id = UrlParameter.Optional },
             namespaces: new[] { "QuanLyThuVien.Controllers" }
         );

            //Combobox Thông tin
            routes.MapRoute(
              name: "Tất Cả Sách",
              url: "ebook/{Alias}-{bookID}",
              defaults: new { controller = "Book", action = "ShowBook", id = UrlParameter.Optional },
              namespaces: new[] { "QuanLyThuVien.Controllers" }
          );

            routes.MapRoute(
              name: "Search",
              url: "tim-kiem",
              defaults: new { controller = "Book", action = "Search", id = UrlParameter.Optional },
              namespaces: new[] { "QuanLyThuVien.Controllers" }
          );


            routes.MapRoute(
              name: "Sách",
              url: "ebook/{Alias}-{bookID}",
              defaults: new { controller = "Book", action = "ShowBook", id = UrlParameter.Optional },
              namespaces: new[] { "QuanLyThuVien.Controllers" }
          );

            routes.MapRoute(
               name: "Thể Loại Sách",
               url: "the-loai/{SeoTitle}",
               defaults: new { controller = "Book", action = "Category", id = UrlParameter.Optional },
               namespaces: new[] { "QuanLyThuVien.Controllers" }
           );

            routes.MapRoute(
               name: "Thông Tin",
               url: "thong-tin/{MetaTitle}",
               defaults: new { controller = "Book", action = "Information", id = UrlParameter.Optional },
               namespaces: new[] { "QuanLyThuVien.Controllers" }
           );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "QuanLyThuVien.Controllers" }
            );


        }
    }
}
