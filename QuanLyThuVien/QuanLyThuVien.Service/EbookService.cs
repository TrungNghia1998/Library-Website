using BusinessLogic.Repository.Base;
using BusinessLogic.ViewModel;
using DataProvider.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyThuVien.Service
{
    public interface IEbookService
    {
        void Create(Ebook ebook);

        void Delete(Ebook ebook);

        Ebook GetById(int id);

        void Update(Ebook ebook);

        IQueryable<Ebook> GetAll(string[] includes = null);

        void Save();

        //Hàm riêng
        Ebook GetEbookByID2(int idbook, int typeid);
        //IPagedList<Ebook> GetAllWithPageListSearch(int? page, int pageSize, string searchString);
        List<EbookViewModel> GetAllListEbookViewByID(int bookID);
        IEnumerable<EbookViewModel> GetAllListEbookView();
    }
    public class EbookService : IEbookService
    {
        IEbookRepository _ebookRepository;
        IUnitOfWork _unitOfWork;

        public EbookService(IEbookRepository ebookRepository, IUnitOfWork unitOfWork)
        {
            this._ebookRepository = ebookRepository;
            this._unitOfWork = unitOfWork;
        }

        public void Create(Ebook ebook)
        {
            _ebookRepository.Create(ebook);
        }

        public void Delete(Ebook ebook)
        {
            _ebookRepository.Delete(ebook);
        }

        public IQueryable<Ebook> GetAll(string[] includes = null)
        {
            return _ebookRepository.GetAll();
        }

        public IEnumerable<EbookViewModel> GetAllListEbookView()
        {
            return _ebookRepository.GetAllListEbookView();
        }

        public List<EbookViewModel> GetAllListEbookViewByID(int bookID)
        {
            return _ebookRepository.GetAllListEbookViewByID(bookID);
        }

        public Ebook GetById(int id)
        {
            return _ebookRepository.GetById(id);
        }

        public Ebook GetEbookByID2(int idbook, int typeid)
        {
            return _ebookRepository.GetEbookByID2(idbook, typeid);
        }

        public void Save()
        {
            _unitOfWork.Commit();
        }

        public void Update(Ebook ebook)
        {
            _ebookRepository.Update(ebook);
        }
    }
}
