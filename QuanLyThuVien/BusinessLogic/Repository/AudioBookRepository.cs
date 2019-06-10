using BusinessLogic.Repository.Base;
using BusinessLogic.ViewModel;
using DataProvider.Model;
using DataProvider.Repository;
using System.Collections.Generic;
using System.Linq;

namespace BusinessLogic.Repository
{
    public interface IAudioBookRepository : IRepository<AudioBook>
    {
        AudioBook ListAudioByBook(int idBook);

        List<AudioBook> ListAllAudioBook();

        AudioBook ListAudioByNameAudio(string nameAudio);

        AudioBook getAudioBookByID2(int idbook, int idaudio);

        List<AudioBookModelView> GetAllAudioBookView();
    }

    public class AudioBookRepository : BaseRepository<AudioBook>, IAudioBookRepository
    {
        public AudioBookRepository(IDbFactory dbFactory) : base(dbFactory)
        {
        }

        public List<AudioBook> ListAllAudioBook()
        {
            return _dbContext.AudioBooks.ToList();
        }

        //Lấy ra danh sách các Audio Book thuộc quyển sách đó
        public AudioBook ListAudioByBook(int idBook)
        {
            return _dbContext.AudioBooks.Where(x => x.BookID == idBook).SingleOrDefault();
        }

        public AudioBook ListAudioByNameAudio(string nameAudio)
        {
            return _dbContext.AudioBooks.Where(x => x.Alias == nameAudio).SingleOrDefault();
        }

        public AudioBook getAudioBookByID2(int idbook, int idaudio)
        {
            return _dbContext.AudioBooks.Where(x => x.BookID == idbook && x.AudioID == idaudio).FirstOrDefault();
        }

        public List<AudioBookModelView> GetAllAudioBookView()
        {
            IQueryable<AudioBookModelView> result = from audio in _dbContext.AudioBooks
                                                    join book in _dbContext.Books on audio.BookID equals book.BookID
                                                    select new AudioBookModelView
                                                    {
                                                        BookID = audio.BookID,
                                                        BookName = book.BookName,
                                                        AudioID = audio.AudioID,
                                                        AudioName = audio.AudioName,
                                                        FileAudioSize = audio.FileAudioSize,
                                                        FileAudioPath = audio.FileAudioPath,
                                                        Alias = audio.Alias
                                                    };
            return result.OrderBy(x => x.BookName).ToList();
        }
    }
}