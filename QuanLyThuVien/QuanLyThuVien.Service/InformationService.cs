using BusinessLogic.Repository;
using BusinessLogic.Repository.Base;
using DataProvider.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyThuVien.Service
{
    public interface IInformationService
    {
        void Create(ThongTin thongTin);

        void Delete(ThongTin thongTin);

        ThongTin GetById(int id);

        void Update(ThongTin thongTin);

        IQueryable<ThongTin> GetAll(string[] includes = null);

        void Save();

        //Hàm riêng
        ThongTin GetByString(string sTring);
    }
    public class InformationService : IInformationService
    {
        IInformationRepository _informationRepository;
        IUnitOfWork _unitOfWork;

        public InformationService(IInformationRepository informationRepository, IUnitOfWork unitOfWork)
        {
            this._informationRepository = informationRepository;
            this._unitOfWork = unitOfWork;
        }
        public void Create(ThongTin thongTin)
        {
            _informationRepository.Create(thongTin);
        }

        public void Delete(ThongTin thongTin)
        {
            _informationRepository.Delete(thongTin);
        }

        public IQueryable<ThongTin> GetAll(string[] includes = null)
        {
            return _informationRepository.GetAll();
        }

        public ThongTin GetById(int id)
        {
            return _informationRepository.GetById(id);
        }

        public ThongTin GetByString(string sTring)
        {
            return _informationRepository.GetByString(sTring);
        }

        public void Save()
        {
            _unitOfWork.Commit();
        }

        public void Update(ThongTin thongTin)
        {
            _informationRepository.Update(thongTin);
        }
    }
}
