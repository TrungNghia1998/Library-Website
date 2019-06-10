namespace BusinessLogic.Repository.Base
{
    public interface IUnitOfWork
    {
        void Commit();
    }
}