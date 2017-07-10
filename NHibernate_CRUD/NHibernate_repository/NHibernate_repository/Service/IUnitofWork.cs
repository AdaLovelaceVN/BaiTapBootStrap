using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NHibernate_repository.Service
{
    public interface IUnitofWork : IDisposable
    {    
        IReadWriteRepository<TEntity> GetRepository<TEntity>() where TEntity : class;
        void Commit();
        void Rollback();
        
    }
}