using BusinessLogic.Repository.Base;
using DataProvider.Model;
using DataProvider.Repository;
using System.Linq;

namespace BusinessLogic.Repository
{
    public interface IInformationRepository : IRepository<ThongTin>
    {
        ThongTin GetByString(string sTring);
    }

    public class InformationRepository : BaseRepository<ThongTin>, IInformationRepository
    {
        public InformationRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }

        public ThongTin GetByString(string sTring)
        {
            return _dbContext.ThongTins.Where(x => x.MetaTitle == sTring).SingleOrDefault();
        }
    }
}