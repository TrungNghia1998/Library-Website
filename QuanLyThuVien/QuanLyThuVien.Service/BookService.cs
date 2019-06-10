using BusinessLogic.Repository;
using BusinessLogic.Repository.Base;
using BusinessLogic.ViewModel;
using DataProvider.Model;
using PagedList;
using System.Collections.Generic;
using System.Linq;

namespace QuanLyThuVien.Service
{
    public interface IBookService
    {
        void Create(Book Book);

        void Delete(Book Book);

        Book GetById(int id);

        void Update(Book Book);

        IQueryable<Book> GetAll(string[] includes = null);       

        void Save();

        //Hàm service riêng
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

    public class BookService : IBookService
    {
        private IBookRepository _bookRepository;
        private IUnitOfWork _unitOfWork;

        public BookService(IBookRepository bookRepository, IUnitOfWork unitOfWork)
        {
            this._bookRepository = bookRepository;
            this._unitOfWork = unitOfWork;
        }

        public void Create(Book Book)
        {
            _bookRepository.Create(Book);
        }

        public void Delete(Book Book)
        {
            _bookRepository.Delete(Book);
        }

        public IQueryable<Book> GetAll(string[] includes = null)
        {
            return _bookRepository.GetAll();
        }

        public IPagedList<ChapterDetail> GetAllChapterByIDBook(int? page, int pageSize, int id)
        {
            return _bookRepository.GetAllChapterByIDBook(page, pageSize, id);
        }

        public IPagedList<EbookViewModel> GetAllEbookByIDBook(int? page, int pageSize, int id)
        {
            return _bookRepository.GetAllEbookByIDBook(page, pageSize, id);
        }

        public IPagedList<BookModelView> GetAllWithPageListSearch(int? page, int pageSize, string searchString)
        {
            return _bookRepository.GetAllWithPageListSearch(page, pageSize, searchString);
        }

        public Book GetById(int id)
        {
            return _bookRepository.GetById(id);
        }

        public IEnumerable<Book> ListAllWithPageListBook(int page, int pageSize)
        {
            return _bookRepository.ListAllWithPageListBook(page, pageSize);
        }

        public List<Book> ListBookByCategory(int categoryID)
        {
            return _bookRepository.ListBookByCategory(categoryID);
        }

        public IEnumerable<Book> ListBookByCategoryWithPageListBook(int categoryID, int page, int pageSize)
        {
            return _bookRepository.ListBookByCategoryWithPageListBook(categoryID, page, pageSize);
        }

        public List<DanhSachChuongCuaCuonSachViewModel> ListChapterDetailOfBook(int idBook)
        {
            return _bookRepository.ListChapterDetailOfBook(idBook);
        }

        public List<DanhSachChuongCuaCuonSachViewModel> ListChapterDetailOfBookDeleteFirst(int idBook)
        {
            return _bookRepository.ListChapterDetailOfBookDeleteFirst(idBook);
        }

        public List<DanhSachChuongCuaCuonSachViewModel> ListChuongSachTruChuongDuocChon(int idBook, int idChapter)
        {
            return _bookRepository.ListChuongSachTruChuongDuocChon(idBook, idChapter);
        }

        public List<string> ListName(string keyword)
        {
            return _bookRepository.ListName(keyword);
        }

        public void Save()
        {
            _unitOfWork.Commit();
        }

        public IEnumerable<Book> SearchBook(string keyword, int page, int pageSize)
        {
            return _bookRepository.SearchBook(keyword, page, pageSize);
        }

        public ChuongDauTienCuaMotCuonSach TheFirstChapOfBook(int idBook)
        {
            return _bookRepository.TheFirstChapOfBook(idBook);
        }

        public void Update(Book Book)
        {
            _bookRepository.Update(Book);
        }
    }
}