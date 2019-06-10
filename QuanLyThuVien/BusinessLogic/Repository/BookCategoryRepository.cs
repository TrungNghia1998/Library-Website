using BusinessLogic.Repository.Base;
using DataProvider.Model;
using DataProvider.Repository;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BusinessLogic.Repository
{
    public interface IBookCategoryRepository : IRepository<BookCategory>
    {
        BookCategory GetByString(string sTring);

        IPagedList<BookCategory> GetAllWithPageListSearch(int? page, int pageSize, string searchString);

        List<BookCategory> GetAllBookCategory();
    }

    public class BookCategoryRepository : BaseRepository<BookCategory>, IBookCategoryRepository
    {
        public BookCategoryRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }

        public BookCategory GetByString(string sTring)
        {
            return _dbContext.BookCategories.Where(x => x.SeoTitle == sTring).SingleOrDefault();
        }

        public IPagedList<BookCategory> GetAllWithPageListSearch(int? page, int pageSize, string searchString)
        {
            int pageNumber = (page ?? 1);
            IQueryable<BookCategory> result = _dbContext.BookCategories.Where(x => x.Status == true);
            int id = 0;
            Int32.TryParse(searchString, out id);

            if (!(string.IsNullOrEmpty(searchString)))
            {
                result = result.Where(x => x.CategoryID == id || x.CategoryName.Contains(searchString));
            }
            return result.OrderBy(x => x.CategoryID).ToPagedList(pageNumber, pageSize);
        }

        public List<BookCategory> GetAllBookCategory()
        {
            return _dbContext.BookCategories.Where(x => x.Status == true).OrderBy(x => x.CategoryName).ToList();
        }
    }
}