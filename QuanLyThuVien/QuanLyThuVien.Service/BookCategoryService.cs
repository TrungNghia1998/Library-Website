using BusinessLogic.Repository;
using BusinessLogic.Repository.Base;
using DataProvider.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyThuVien.Service
{
    public interface IBookCategoryService
    {
        void Create(BookCategory bookCategory);

        void Delete(BookCategory bookCategory);

        BookCategory GetById(int id);

        void Update(BookCategory bookCategory);

        IQueryable<BookCategory> GetAll(string[] includes = null);

        void Save();

        //Hàm riêng
        BookCategory GetByString(string sTring);
        IPagedList<BookCategory> GetAllWithPageListSearch(int? page, int pageSize, string searchString);
        List<BookCategory> GetAllBookCategory();
    }
    public class BookCategoryService : IBookCategoryService
    {
        IBookCategoryRepository _bookCategoryRepository;
        IUnitOfWork _unitOfWork;

        public BookCategoryService(IBookCategoryRepository bookCategoryRepository, IUnitOfWork unitOfWork)
        {
            this._bookCategoryRepository = bookCategoryRepository;
            this._unitOfWork = unitOfWork;
        }

        public void Create(BookCategory bookCategory)
        {
            _bookCategoryRepository.Create(bookCategory);
        }

        public void Delete(BookCategory bookCategory)
        {
            _bookCategoryRepository.Delete(bookCategory);
        }

        public IQueryable<BookCategory> GetAll(string[] includes = null)
        {
            return _bookCategoryRepository.GetAll();
        }

        public List<BookCategory> GetAllBookCategory()
        {
            return _bookCategoryRepository.GetAllBookCategory();
        }

        public IPagedList<BookCategory> GetAllWithPageListSearch(int? page, int pageSize, string searchString)
        {
            return _bookCategoryRepository.GetAllWithPageListSearch(page, pageSize, searchString);
        }

        public BookCategory GetById(int id)
        {
            return _bookCategoryRepository.GetById(id);
        }

        public BookCategory GetByString(string sTring)
        {
            return _bookCategoryRepository.GetByString(sTring);
        }

        public void Save()
        {
            _unitOfWork.Commit();
        }

        public void Update(BookCategory bookCategory)
        {
            _bookCategoryRepository.Update(bookCategory);
        }
    }
}
