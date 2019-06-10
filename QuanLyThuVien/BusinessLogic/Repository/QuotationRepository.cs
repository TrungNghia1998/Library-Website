using BusinessLogic.Repository.Base;
using DataProvider.Model;
using DataProvider.Repository;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BusinessLogic.Repository
{
    public interface IQuotationRepository : IRepository<Quotation>
    {
        //Nghĩa
        IEnumerable<Quotation> ListAllWithPageList(int page, int pageSize);

        Quotation GetOneQuotation(int QuotationRandom);

        //Huy
        IPagedList<Quotation> GetAllWithPageListSearch(int? page, int pageSize, string searchString);
    }

    public class QuotationRepository : BaseRepository<Quotation>, IQuotationRepository
    {
        public QuotationRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }

        //Phân Trang
        public IEnumerable<Quotation> ListAllWithPageList(int page, int pageSize)
        {
            return _dbContext.Quotations.OrderBy(x => x.QuotationID).ToPagedList(page, pageSize);
        }

        //End Phân Trang

        public Quotation GetOneQuotation(int QuotationRandom)
        {
            return _dbContext.Quotations.Where(x => x.QuotationID == QuotationRandom).SingleOrDefault();
        }

        //Huy
        public IPagedList<Quotation> GetAllWithPageListSearch(int? page, int pageSize, string searchString)
        {
            int pageNumber = (page ?? 1);
            IQueryable<Quotation> result = _dbContext.Quotations;
            int id = 0;
            Int32.TryParse(searchString, out id);

            if (!(string.IsNullOrEmpty(searchString)))
            {
                result = result.Where(x => x.NameQuotation.Contains(searchString) || x.QuotationID == id);
            }
            return result.OrderBy(x => x.QuotationID).ToPagedList(pageNumber, pageSize);
        }
    }
}