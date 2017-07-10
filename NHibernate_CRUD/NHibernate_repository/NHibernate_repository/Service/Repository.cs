using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NHibernate;
using NHibernate.Linq;

namespace NHibernate_repository.Service
{
    public class Repository<TEntity> : IReadWriteRepository<TEntity>
    where TEntity : class
    {
        private readonly ISession _session;
        private ITransaction _transaction;

        public Repository(ISession session)
        {
            _session = session;
        }

        #region IWriteRepository

        public bool Add(TEntity entity)
        {
            _session.Save(entity);
            _session.Flush();
            return true;
        }

        public bool Add(System.Collections.Generic.IEnumerable<TEntity> entities)
        {
            foreach (TEntity entity in entities)
            {
                _session.Save(entity);
                _session.Flush();
            }
            return true;
        }

        public bool Update(TEntity entity)
        {
            // _session.Merge(entity);
            _session.Clear();
            _session.Update(entity);
            //_transaction.Commit();
            _session.Flush();
            return true;
        }

        public bool Update(System.Collections.Generic.IEnumerable<TEntity> entities)
        {
            foreach (TEntity entity in entities)
            {
                _session.Clear();
                _session.Update(entity);
                _session.Save(entity);
                //_session.Flush();
            }
            return true;
        }

        public bool Delete(TEntity entity)
        {
            
            _session.Evict(entity);
            TEntity findAAgain = _session.Merge(entity);
            _session.Clear();
            _session.Delete(entity);
            _session.Flush();
            return true;
        }

        public bool Delete(System.Collections.Generic.IEnumerable<TEntity> entities)
        {
            foreach (TEntity entity in entities)
            {
                Object findAAgain = _session.Merge(entity);
                _session.Clear();
                _session.Delete(findAAgain);
                _session.Flush();

            }
            return true;
        }

        #endregion

        #region IReadRepository

        public System.Linq.IQueryable<TEntity> All()
        {
            return _session.Query<TEntity>();
        }

        public TEntity FindBy(System.Linq.Expressions.Expression<System.Func<TEntity, bool>> expression)
        {
            return FilterBy(expression).SingleOrDefault();
        }

        public TEntity FindBy(object id)
        {
            return _session.Get<TEntity>(id);
        }
        public bool Check_Exit(object id)
        {
            try
            {
                TEntity T = null;
                T = _session.Get<TEntity>(id);
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public System.Linq.IQueryable<TEntity> FilterBy(System.Linq.Expressions.Expression<System.Func<TEntity, bool>> expression)
        {
            return All().Where(expression).AsQueryable();
        }

        #endregion
        
    }
}