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
    public interface IUserService
    {
        void Create(User user);

        void Delete(User user);

        User GetById(int id);

        void Update(User user);

        IQueryable<User> GetAll(string[] includes = null);

        void Save();

        //Hàm riêng
        int checkLogin(string userName, string passWord);
        IPagedList<User> GetAllWithPageList(int? page, int pageSize);
        IPagedList<User> GetAllWithPageListSearch(int? page, int pageSize, string searchString);
        User GetUserByUsername(string username);
    }
    public class UserService : IUserService
    {
        IUserRepository _userRepository;
        IUnitOfWork _unitOfWork;

        public UserService(IUserRepository userRepository, IUnitOfWork unitOfWork)
        {
            this._userRepository = userRepository;
            this._unitOfWork = unitOfWork;
        }

        public int checkLogin(string userName, string passWord)
        {
            return _userRepository.checkLogin(userName, passWord);
        }

        public void Create(User user)
        {
            _userRepository.Create(user);
        }

        public void Delete(User user)
        {
            _userRepository.Delete(user);
        }

        public IQueryable<User> GetAll(string[] includes = null)
        {
            return _userRepository.GetAll();
        }

        public IPagedList<User> GetAllWithPageList(int? page, int pageSize)
        {
            return _userRepository.GetAllWithPageList(page, pageSize);
        }

        public IPagedList<User> GetAllWithPageListSearch(int? page, int pageSize, string searchString)
        {
            return _userRepository.GetAllWithPageListSearch(page, pageSize, searchString);
        }

        public User GetById(int id)
        {
            return _userRepository.GetById(id);
        }

        public User GetUserByUsername(string username)
        {
            return _userRepository.GetUserByUsername(username);
        }

        public void Save()
        {
            _unitOfWork.Commit();
        }

        public void Update(User user)
        {
            _userRepository.Update(user);
        }
    }
}
