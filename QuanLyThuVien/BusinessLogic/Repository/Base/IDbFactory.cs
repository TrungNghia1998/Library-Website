using DataProvider.Model;
using System;

namespace BusinessLogic.Repository.Base
{
    public interface IDbFactory : IDisposable
    {
        DbQuanLyThuVienContext Init();
    }
}