using BusinessLogic.Repository;
using BusinessLogic.Repository.Base;
using BusinessLogic.ViewModel;
using DataProvider.Model;
using System.Collections.Generic;
using System.Linq;

namespace QuanLyThuVien.Service
{
    public interface IAudioBookService
    {
        void Create(AudioBook audioBook);

        void Delete(AudioBook audioBook);

        AudioBook GetById(int id);

        void Update(AudioBook audioBook);

        IQueryable<AudioBook> GetAll(string[] includes = null);

        void Save();

        //Hàm service riêng
        AudioBook GetAudioBookByID_Service(int idBook, int idAudioBook);

        List<AudioBookModelView> GetAllAudioBookView_Service();

        AudioBook ListAudioByBook(int idBook);

        AudioBook ListAudioByNameAudio(string nameAudio);

        AudioBook GetAudioBookByBookIDAndAudioID(int idBook, int idAudio);
    }

    public class AudioBookService : IAudioBookService
    {
        private IAudioBookRepository _audioBookRepository;
        private IUnitOfWork _unitOfWork;

        public AudioBookService(IAudioBookRepository audioBookRepository, IUnitOfWork unitOfWork)
        {
            this._audioBookRepository = audioBookRepository;
            this._unitOfWork = unitOfWork;
        }

        public void Create(AudioBook audioBook)
        {
            _audioBookRepository.Create(audioBook);
        }

        public void Delete(AudioBook audioBook)
        {
            _audioBookRepository.Delete(audioBook);
        }

        public IQueryable<AudioBook> GetAll(string[] includes = null)
        {
            return _audioBookRepository.GetAll();
        }

        public List<AudioBookModelView> GetAllAudioBookView_Service()
        {
            return _audioBookRepository.GetAllAudioBookView();
        }

        public AudioBook GetAudioBookByBookIDAndAudioID(int idBook, int idAudio)
        {
            return _audioBookRepository.getAudioBookByID2(idBook, idAudio);
        }

        public AudioBook GetAudioBookByID_Service(int idBook, int idAudioBook)
        {
            return _audioBookRepository.getAudioBookByID2(idBook, idAudioBook);
        }

        public AudioBook GetById(int id)
        {
            return _audioBookRepository.GetById(id);
        }

        public AudioBook ListAudioByBook(int idBook)
        {
            return _audioBookRepository.ListAudioByBook(idBook);
        }

        public AudioBook ListAudioByNameAudio(string nameAudio)
        {
            return _audioBookRepository.ListAudioByNameAudio(nameAudio);
        }

        public void Save()
        {
            _unitOfWork.Commit();
        }

        public void Update(AudioBook audioBook)
        {
            _audioBookRepository.Update(audioBook);
        }
    }
}