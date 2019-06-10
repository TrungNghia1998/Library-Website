using BusinessLogic.Repository.Base;
using DataProvider.Model;
using DataProvider.Repository;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BusinessLogic.Repository
{
    public interface IAuthorRepository : IRepository<Author>
    {
        IPagedList<Author> GetAllWithPageListSearch(int? page, int pageSize, string searchString);

        List<Author> GetAllAuthor();
    }

    public class AuthorRepository : BaseRepository<Author>, IAuthorRepository
    {
        public AuthorRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }

        public IPagedList<Author> GetAllWithPageListSearch(int? page, int pageSize, string searchString)
        {
            int pageNumber = (page ?? 1);
            IQueryable<Author> result = _dbContext.Authors.Where(x => x.Status == 1);
            int id = 0;
            Int32.TryParse(searchString, out id);

            if (!(string.IsNullOrEmpty(searchString)))
            {
                result = result.Where(x => x.AuthorID == id || x.AuthorName.Contains(searchString) || x.DescriptionAuthor.Contains(searchString) || x.Alias.Contains(searchString));
            }
            return result.OrderBy(x => x.AuthorID).ToPagedList(pageNumber, pageSize);
        }

        public List<Author> GetAllAuthor()
        {
            return _dbContext.Authors.Where(x => x.Status == 1).OrderBy(x => x.AuthorName).ToList();
        }
    }
}