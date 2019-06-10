using BusinessLogic.Repository.Base;
using DataProvider.Model;
using DataProvider.Repository;
using System.Collections.Generic;
using System.Linq;

namespace BusinessLogic.Repository
{
    public interface ITypeEbookRepository : IRepository<TypeEbook>
    {
        List<TypeEbook> GetAllTypeEbook();
    }

    public class TypeEbookRepository : BaseRepository<TypeEbook>, ITypeEbookRepository
    {
        public TypeEbookRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }

        public List<TypeEbook> GetAllTypeEbook()
        {
            return _dbContext.TypeEbooks.Where(x => x.Status == 1).ToList();
        }
    }
}