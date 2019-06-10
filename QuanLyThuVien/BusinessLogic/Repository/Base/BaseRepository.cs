using BusinessLogic.Repository.Base;
using DataProvider.Model;
using System.Data.Entity;
using System.Linq;

namespace DataProvider.Repository
{
    public class BaseRepository<T> : IRepository<T> where T : class
    {
        protected DbQuanLyThuVienContext _dbContext;
        private readonly IDbSet<T> dbSet;

        protected IDbFactory DbFactory
        {
            get;
            private set;
        }

        protected DbQuanLyThuVienContext DbContext
        {
            get { return _dbContext ?? (_dbContext = DbFactory.Init()); }
        }

        public BaseRepository(IDbFactory dbFactory)
        {
            DbFactory = dbFactory;
            dbSet = DbContext.Set<T>();
            //_dbContext = new DbQuanLyThuVienContext();
            //dbSet = _dbContext.Set<T>();
        }

        public void Create(T entity)
        {
            dbSet.Add(entity);
            _dbContext.SaveChanges();
        }

        public void Delete(T entity)
        {
            dbSet.Attach(entity);
            dbSet.Remove(entity);
            _dbContext.SaveChanges();
        }    

        public T GetById(int id)
        {
            return dbSet.Find(id);
        }

        public void Update(T entity)
        {
            dbSet.Attach(entity);
            _dbContext.Entry(entity).State = EntityState.Modified;
            _dbContext.SaveChanges();
        }

        public IQueryable<T> GetAll(string[] includes = null)
        {          
            if (includes != null && includes.Count() > 0)
            {
                var query = _dbContext.Set<T>().Include(includes.First());
                foreach (var include in includes.Skip(1))
                    query = query.Include(include);
                return query.AsQueryable();
            }

            return _dbContext.Set<T>().AsQueryable();
        }
    }
}