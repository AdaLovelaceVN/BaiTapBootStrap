using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NHibernate_repository.Service
{
    public interface IReadWriteRepository<TEntity> : IReadRepository<TEntity>, IWriteRepository<TEntity>
    where TEntity : class
    { }
}