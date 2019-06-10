using BusinessLogic.Repository.Base;
using BusinessLogic.ViewModel;
using DataProvider.Model;
using DataProvider.Repository;
using PagedList;
using System;
using System.Linq;

namespace BusinessLogic.Repository
{
    public interface IChapterDetailRepository : IRepository<ChapterDetail>
    {
        //Phần giao diện
        ChapterDetail GetByString(string sTring);

        ChapterDetail getByID2(int bookid, int chapterid);

        bool IsContainInListChapterBook(int idBook, int idChapter);

        //Phần Admin
        IPagedList<ChapterDetailModelView> GetAllWithPageListSearch(int? page, int pageSize, string searchString);
    }

    public class ChapterDetailRepository : BaseRepository<ChapterDetail>, IChapterDetailRepository
    {
        public ChapterDetailRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }

        //Phần Giao Diện
        public ChapterDetail GetByString(string sTring)
        {
            return _dbContext.ChapterDetails.Where(x => x.Alias == sTring).SingleOrDefault();
        }

        //Phần Admin
        public ChapterDetail getByID2(int bookid, int chapterid)
        {
            if (bookid != 0)
            {
                if (chapterid != 0)
                {
                    return _dbContext.ChapterDetails.Where(x => x.IDBook == bookid & x.ChapterID == chapterid).FirstOrDefault();
                }
                else
                {
                    return null;
                }
            }
            else
                return null;
        }

        public IPagedList<ChapterDetailModelView> GetAllWithPageListSearch(int? page, int pageSize, string searchString)
        {
            int pageNumber = (page ?? 1);
            IQueryable<ChapterDetailModelView> result = from chapter in _dbContext.ChapterDetails
                                                        join book in _dbContext.Books on chapter.IDBook equals book.BookID
                                                        select new ChapterDetailModelView
                                                        {
                                                            IDBook = chapter.IDBook,
                                                            NameBook = book.BookName,
                                                            ChapterID = chapter.ChapterID,
                                                            Alias = chapter.Alias,
                                                            NameChapter = chapter.NameChapter,
                                                            Content = chapter.Content
                                                        };
            //IQueryable<ChapterDetail> result = _dbContext.ChapterDetails;
            int id = 0;
            Int32.TryParse(searchString, out id);

            if (!(string.IsNullOrEmpty(searchString)))
            {
                result = result.Where(x => x.ChapterID == id || x.NameChapter.Contains(searchString) || x.NameBook.Contains(searchString));
            }
            return result.OrderBy(x => x.ChapterID).ToPagedList(pageNumber, pageSize);
        }

        public bool IsContainInListChapterBook(int idBook, int idChapter)
        {
            var result = _dbContext.ChapterDetails.Where(x => x.IDBook == idBook && x.ChapterID == idChapter).FirstOrDefault();
            if (result != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}