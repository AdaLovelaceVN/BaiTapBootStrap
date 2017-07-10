using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NHibernate_repository.Service
{
    public interface IRepository
    {
        void Save(object obj);
        void Delete(object obj);
        object GetById(Type objType, object objId);
        IQueryable<TEntity> ToList<TEntity>();
    }
}