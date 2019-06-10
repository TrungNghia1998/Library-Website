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
    public interface IAuthorService
    {
        void Create(Author author);

        void Delete(Author author);

        Author GetById(int id);

        void Update(Author author);

        IQueryable<Author> GetAll(string[] includes = null);

        void Save();

        //Hàm riêng
        IPagedList<Author> GetAllWithPageListSearch(int? page, int pageSize, string searchString);
        List<Author> GetAllAuthor();
    }

    public class AuthorService : IAuthorService
    {
        IAuthorRepository _authorRepository;
        IUnitOfWork _unitOfWork;

        public AuthorService(IAuthorRepository authorRepository, IUnitOfWork unitOfWork)
        {
            this._authorRepository = authorRepository;
            this._unitOfWork = unitOfWork;
        }

        public void Create(Author author)
        {
             _authorRepository.Create(author);
        }

        public void Delete(Author author)
        {
            _authorRepository.Delete(author);
        }

        public IQueryable<Author> GetAll(string[] includes = null)
        {
            return _authorRepository.GetAll();
        }

        //Hàm riêng
        public List<Author> GetAllAuthor()
        {
            return _authorRepository.GetAllAuthor();
        }

        //Hàm riêng
        public IPagedList<Author> GetAllWithPageListSearch(int? page, int pageSize, string searchString)
        {
            return _authorRepository.GetAllWithPageListSearch(page, pageSize, searchString);
        }

        public Author GetById(int id)
        {
            return _authorRepository.GetById(id);
        }

        public void Save()
        {
            _unitOfWork.Commit();
        }

        public void Update(Author author)
        {
            _authorRepository.Update(author);
        }
    }

}
