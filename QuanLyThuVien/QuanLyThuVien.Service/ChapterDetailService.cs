using BusinessLogic.Repository;
using BusinessLogic.Repository.Base;
using BusinessLogic.ViewModel;
using DataProvider.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyThuVien.Service
{
    public interface IChapterDetailService
    {
        void Create(ChapterDetail chapterDetail);

        void Delete(ChapterDetail chapterDetail);

        ChapterDetail GetById(int id);

        void Update(ChapterDetail chapterDetail);

        IQueryable<ChapterDetail> GetAll(string[] includes = null);

        void Save();

        //Hàm riêng
        //Phần giao diện
        ChapterDetail GetByString(string sTring);
        ChapterDetail getByID2(int bookid, int chapterid);
        bool IsContainInListChapterBook(int idBook, int idChapter);

        //Phần Admin
        IPagedList<ChapterDetailModelView> GetAllWithPageListSearch(int? page, int pageSize, string searchString);
    }

    public class ChapterDetailService : IChapterDetailService
    {
        IChapterDetailRepository _chapterDetailRepository;
        IUnitOfWork _unitOfWork;

        public ChapterDetailService(IChapterDetailRepository chapterDetailRepository, IUnitOfWork unitOfWork)
        {
            this._chapterDetailRepository = chapterDetailRepository;
            this._unitOfWork = unitOfWork;
        }

        public void Create(ChapterDetail chapterDetail)
        {
            _chapterDetailRepository.Create(chapterDetail);
        }

        public void Delete(ChapterDetail chapterDetail)
        {
            _chapterDetailRepository.Delete(chapterDetail);
        }

        public IQueryable<ChapterDetail> GetAll(string[] includes = null)
        {
            return _chapterDetailRepository.GetAll();
        }

        public IPagedList<ChapterDetailModelView> GetAllWithPageListSearch(int? page, int pageSize, string searchString)
        {
            return _chapterDetailRepository.GetAllWithPageListSearch(page, pageSize, searchString);
        }

        public ChapterDetail GetById(int id)
        {
            return _chapterDetailRepository.GetById(id);
        }

        public ChapterDetail getByID2(int bookid, int chapterid)
        {
            return _chapterDetailRepository.getByID2(bookid, chapterid);
        }

        public ChapterDetail GetByString(string sTring)
        {
            return _chapterDetailRepository.GetByString(sTring);
        }

        public bool IsContainInListChapterBook(int idBook, int idChapter)
        {
            return _chapterDetailRepository.IsContainInListChapterBook(idBook, idChapter);
        }

        public void Save()
        {
            _unitOfWork.Commit();
        }

        public void Update(ChapterDetail chapterDetail)
        {
            _chapterDetailRepository.Update(chapterDetail);
        }
    }
}
