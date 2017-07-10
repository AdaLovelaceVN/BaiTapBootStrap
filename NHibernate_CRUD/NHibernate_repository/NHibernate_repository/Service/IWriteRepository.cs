using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NHibernate_repository.Service
{
    public interface IWriteRepository<TEntity> where TEntity : class
    {       
        bool Add(TEntity entity);
        bool Add(IEnumerable<TEntity> entities);
        bool Update(TEntity entity);
        bool Update(IEnumerable<TEntity> entities);
        bool Delete(TEntity entity);
        bool Delete(IEnumerable<TEntity> entities);
        
    }
}