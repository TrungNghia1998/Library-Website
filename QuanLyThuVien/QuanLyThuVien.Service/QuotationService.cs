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
    public interface IQuotationService
    {
        void Create(Quotation quotation);

        void Delete(Quotation quotation);

        Quotation GetById(int id);

        void Update(Quotation quotation);

        IQueryable<Quotation> GetAll(string[] includes = null);

        void Save();

        //Hàm riêng       
        IEnumerable<Quotation> ListAllWithPageList(int page, int pageSize);
        Quotation GetOneQuotation(int QuotationRandom);

        IPagedList<Quotation> GetAllWithPageListSearch(int? page, int pageSize, string searchString);
    }

    public class QuotationService : IQuotationService
    {
        private IQuotationRepository _quotationRepository;
        private IUnitOfWork _unitOfWork;

        public QuotationService(IQuotationRepository quotationRepository, IUnitOfWork unitOfWork)
        {
            this._quotationRepository = quotationRepository;
            this._unitOfWork = unitOfWork;
        }

        public void Create(Quotation quotation)
        {
            _quotationRepository.Create(quotation);
        }

        public void Delete(Quotation quotation)
        {
            _quotationRepository.Delete(quotation);
        }

        public IQueryable<Quotation> GetAll(string[] includes = null)
        {
            return _quotationRepository.GetAll();
        }

        public IPagedList<Quotation> GetAllWithPageListSearch(int? page, int pageSize, string searchString)
        {
            return _quotationRepository.GetAllWithPageListSearch(page, pageSize, searchString);
        }

        public Quotation GetById(int id)
        {
            return _quotationRepository.GetById(id);
        }

        public Quotation GetOneQuotation(int QuotationRandom)
        {
            return _quotationRepository.GetOneQuotation(QuotationRandom);
        }

        public IEnumerable<Quotation> ListAllWithPageList(int page, int pageSize)
        {
            return _quotationRepository.ListAllWithPageList(page, pageSize);
        }

        public void Save()
        {
            _unitOfWork.Commit();
        }

        public void Update(Quotation quotation)
        {
            _quotationRepository.Update(quotation);
        }
    }
}
