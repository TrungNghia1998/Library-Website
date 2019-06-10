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
    public interface ITypeEbookService
    {
        void Create(TypeEbook typeEbook);

        void Delete(TypeEbook typeEbook);

        TypeEbook GetById(int id);

        void Update(TypeEbook typeEbook);

        IQueryable<TypeEbook> GetAll(string[] includes = null);

        void Save();

        //Hàm riêng

        List<TypeEbook> GetAllTypeEbook();
    }
    public class TypeEbookService : ITypeEbookService
    {
        ITypeEbookRepository _typeEbookRepository;
        IUnitOfWork _unitOfWork;

        public TypeEbookService(ITypeEbookRepository typeEbookRepository, IUnitOfWork unitOfWork)
        {
            this._typeEbookRepository = typeEbookRepository;
            this._unitOfWork = unitOfWork;
        }

        public void Create(TypeEbook typeEbook)
        {
            _typeEbookRepository.Create(typeEbook);
        }

        public void Delete(TypeEbook typeEbook)
        {
            _typeEbookRepository.Delete(typeEbook);
        }

        public IQueryable<TypeEbook> GetAll(string[] includes = null)
        {
            return _typeEbookRepository.GetAll();
        }

        public List<TypeEbook> GetAllTypeEbook()
        {
            return _typeEbookRepository.GetAllTypeEbook();
        }

        public TypeEbook GetById(int id)
        {
            return _typeEbookRepository.GetById(id);
        }

        public void Save()
        {
            _unitOfWork.Commit();
        }

        public void Update(TypeEbook typeEbook)
        {
            _typeEbookRepository.Update(typeEbook);
        }
    }
}
