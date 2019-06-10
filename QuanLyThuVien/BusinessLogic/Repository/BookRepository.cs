using BusinessLogic.Repository.Base;
using BusinessLogic.ViewModel;
using DataProvider.Model;
using DataProvider.Repository;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BusinessLogic.Repository
{
    public interface IBookRepository : IRepository<Book>
    {
        //Phần Giao Diện Người Dùng
        List<Book> ListBookByCategory(int categoryID);

        IEnumerable<Book> ListAllWithPageListBook(int page, int pageSize);

        IEnumerable<Book> ListBookByCategoryWithPageListBook(int categoryID, int page, int pageSize);

        List<DanhSachChuongCuaCuonSachViewModel> ListChapterDetailOfBook(int idBook);

        List<DanhSachChuongCuaCuonSachViewModel> ListChapterDetailOfBookDeleteFirst(int idBook);

        List<DanhSachChuongCuaCuonSachViewModel> ListChuongSachTruChuongDuocChon(int idBook, int idChapter);

        ChuongDauTienCuaMotCuonSach TheFirstChapOfBook(int idBook);

        IPagedList<EbookViewModel> GetAllEbookByIDBook(int? page, int pageSize, int id);

        List<string> ListName(string keyword);

        IEnumerable<Book> SearchBook(string keyword, int page, int pageSize);

        //Phần Admin
        IPagedList<BookModelView> GetAllWithPageListSearch(int? page, int pageSize, string searchString);

        IPagedList<ChapterDetail> GetAllChapterByIDBook(int? page, int pageSize, int id);
    }

    public class BookRepository : BaseRepository<Book>, IBookRepository
    {
        public BookRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }

        //Lấy ra chương đầu tiên của cuốn sách
        public ChuongDauTienCuaMotCuonSach TheFirstChapOfBook(int idBook)
        {
            var model = from book in _dbContext.Books
                        join chapbook in _dbContext.ChapterDetails
                        on book.BookID equals chapbook.IDBook
                        where book.BookID == idBook && chapbook.ChapterID == 1
                        select new ChuongDauTienCuaMotCuonSach()
                        {
                            BookAlias = book.Alias,
                            ChapFirstAlias = chapbook.Alias,
                        };
            return model.FirstOrDefault();
        }

        //Lấy ra danh sách các chương của một cuốn sách
        public List<DanhSachChuongCuaCuonSachViewModel> ListChapterDetailOfBook(int idBook)
        {
            var model = from a in _dbContext.ChapterDetails
                        join b in _dbContext.Books
                        on a.IDBook equals b.BookID
                        where a.IDBook == idBook
                        select new DanhSachChuongCuaCuonSachViewModel()
                        {
                            ChapterID = a.ChapterID,
                            NameChapter = a.NameChapter,
                            BookAlias = b.Alias,
                            ChapterAlias = a.Alias
                        };
            return model.ToList();
        }

        //Lấy ra danh sách các chương của một cuốn sách trừ chương đầu tiên
        public List<DanhSachChuongCuaCuonSachViewModel> ListChapterDetailOfBookDeleteFirst(int idBook)
        {
            var model = from a in _dbContext.ChapterDetails
                        join b in _dbContext.Books
                        on a.IDBook equals b.BookID
                        where a.IDBook == idBook && a.ChapterID != 1
                        select new DanhSachChuongCuaCuonSachViewModel()
                        {
                            ChapterID = a.ChapterID,
                            NameChapter = a.NameChapter,
                            BookAlias = b.Alias,
                            ChapterAlias = a.Alias
                        };
            return model.ToList();
        }

        //Lấy ra danh sách các chương của một cuốn sách trừ chương đầu tiên
        public List<DanhSachChuongCuaCuonSachViewModel> ListChuongSachTruChuongDuocChon(int idBook, int idChapter)
        {
            var model = from a in _dbContext.ChapterDetails
                        join b in _dbContext.Books
                        on a.IDBook equals b.BookID
                        where a.IDBook == idBook && a.ChapterID != idChapter
                        select new DanhSachChuongCuaCuonSachViewModel()
                        {
                            ChapterID = a.ChapterID,
                            NameChapter = a.NameChapter,
                            BookAlias = b.Alias,
                            ChapterAlias = a.Alias
                        };
            return model.ToList();
        }

        //Lấy ra danh sách các sách thuộc thể loại sách đó
        public List<Book> ListBookByCategory(int categoryID)
        {
            //var category = _dbContext.Books.Find(categoryID);
            return _dbContext.Books.Where(x => x.CategoryID == categoryID).ToList();
        }

        //Phân trang
        public IEnumerable<Book> ListAllWithPageListBook(int page, int pageSize)
        {
            //return _dbContext.Books.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
            return _dbContext.Books.Where(x => x.Status == 1).OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }

        public IEnumerable<Book> ListBookByCategoryWithPageListBook(int categoryID, int page, int pageSize)
        {
            return _dbContext.Books.Where(x => x.CategoryID == categoryID).OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }

        //Search
        public IEnumerable<Book> SearchBook(string keyword, int page, int pageSize)
        {
            return _dbContext.Books.Where(x => x.BookName.Contains(keyword)).OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }

        //Lấy ra các tên sách cho việc tìm kiếm
        public List<string> ListName(string keyword)
        {
            return _dbContext.Books.Where(x => x.BookName.Contains(keyword)).Select(x => x.BookName).ToList();
        }

        //Phần Admin
        public IPagedList<BookModelView> GetAllWithPageListSearch(int? page, int pageSize, string searchString)
        {
            int pageNumber = (page ?? 1);
            IQueryable<BookModelView> result = from book in _dbContext.Books
                                               join author in _dbContext.Authors on book.AuthorID equals author.AuthorID
                                               join category in _dbContext.BookCategories on book.CategoryID equals category.CategoryID
                                               where book.Status == 1                                              
                                               select new BookModelView
                                               {
                                                   BookID = book.BookID,
                                                   BookName = book.BookName,
                                                   Description = book.Description,
                                                   Alias = book.Alias,
                                                   Author = author.AuthorName,
                                                   Category = category.CategoryName,
                                                   ViewCount = book.ViewCount,
                                                   MoreImages = book.MoreImages,
                                                   CreatedDate = book.CreatedDate,
                                                   CreatedBy = book.CreatedBy,
                                                   TopHot = book.TopHot,
                                                   Status = book.Status
                                               };
            //IQueryable<Book> result = _dbContext.Books.Where(x => x.Status == 1);
            int id = 0;
            Int32.TryParse(searchString, out id);

            if (!(string.IsNullOrEmpty(searchString)))
            {
                result = result.Where(x => x.BookID == id || x.BookName.Contains(searchString) || x.Author.Contains(searchString) | x.Category.Contains(searchString));
            }
            return result.OrderByDescending(x => x.CreatedDate).ToPagedList(pageNumber, pageSize);
        }

        public IPagedList<ChapterDetail> GetAllChapterByIDBook(int? page, int pageSize, int id)
        {
            int pageNumber = (page ?? 1);
            var result = _dbContext.ChapterDetails.Where(x => x.IDBook == id).OrderBy(x => x.ChapterID).ToPagedList(pageNumber, pageSize);
            return result;
        }

        public IPagedList<EbookViewModel> GetAllEbookByIDBook(int? page, int pageSize, int id)
        {
            int pageNumber = (page ?? 1);
            var ketqua = (from e in _dbContext.Ebooks
                          join te in _dbContext.TypeEbooks on e.TypeEbookID equals te.TypeID
                          where e.BookID == id
                          select new EbookViewModel
                          {
                              BookID = id,
                              TypeEbookID = e.TypeEbookID,
                              NameType = te.Name,
                              Link = e.Link
                          }).AsEnumerable<EbookViewModel>().OrderBy(x => x.NameType).ToPagedList(pageNumber, pageSize);
            return ketqua;
        }
    }
}