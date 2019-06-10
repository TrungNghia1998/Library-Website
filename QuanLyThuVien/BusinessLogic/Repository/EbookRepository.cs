using BusinessLogic.ViewModel;
using DataProvider.Model;
using DataProvider.Repository;
using System.Collections.Generic;
using System.Linq;

namespace BusinessLogic.Repository.Base
{
    public interface IEbookRepository : IRepository<Ebook>
    {
        Ebook GetEbookByID2(int idbook, int typeid);

        //IPagedList<Ebook> GetAllWithPageListSearch(int? page, int pageSize, string searchString);
        List<EbookViewModel> GetAllListEbookViewByID(int bookID);

        IEnumerable<EbookViewModel> GetAllListEbookView();
    }

    public class EbookRepository : BaseRepository<Ebook>, IEbookRepository
    {
        public EbookRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }

        public Ebook GetEbookByID2(int idbook, int typeid)
        {
            var result = _dbContext.Ebooks.Where(x => x.BookID == idbook && x.TypeEbookID == typeid).FirstOrDefault();
            return result;
        }

        //public IEnumerable<EbookViewModel> GetListEbookViewTypeName()
        //{
        //    var ketqua = (from e in _dbContext.Ebooks
        //                  join te in _dbContext.TypeEbooks on e.TypeEbookID equals te.TypeID
        //                  select new EbookViewModel
        //                  {
        //                      TypeEbookID = e.TypeEbookID,
        //                      NameType = te.Name,
        //                  }).AsEnumerable<EbookViewModel>().OrderBy(x => x.NameType);
        //    return ketqua;
        //}

        public IEnumerable<EbookViewModel> GetAllListEbookView()
        {
            var ketqua = (from e in _dbContext.Ebooks
                          join te in _dbContext.TypeEbooks on e.TypeEbookID equals te.TypeID
                          join b in _dbContext.Books on e.BookID equals b.BookID
                          select new EbookViewModel
                          {
                              BookID = e.BookID,
                              TypeEbookID = e.TypeEbookID,
                              NameBook = b.BookName,
                              NameType = te.Name,
                              Link = e.Link
                          }).AsEnumerable<EbookViewModel>().OrderBy(x => x.NameBook);
            return ketqua;
        }

        public List<EbookViewModel> GetAllListEbookViewByID(int bookID)
        {
            var ketqua = (from e in _dbContext.Ebooks
                          join te in _dbContext.TypeEbooks on e.TypeEbookID equals te.TypeID
                          join b in _dbContext.Books on e.BookID equals b.BookID
                          where e.BookID == bookID
                          select new EbookViewModel
                          {
                              BookID = e.BookID,
                              TypeEbookID = e.TypeEbookID,
                              NameBook = b.BookName,
                              NameType = te.Name,
                              Link = e.Link
                          }).AsEnumerable<EbookViewModel>().OrderBy(x => x.NameBook);
            return ketqua.ToList();
        }
    }
}