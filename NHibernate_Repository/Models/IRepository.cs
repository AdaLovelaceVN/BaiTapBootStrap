﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace nhibernate.Models
{
    public interface IRepository
    {
        void Save(object obj);
        void Delete(object obj);
        object GetById(Type objType, object objId);
        IQueryable<TEntity> ToList<TEntity>();
        bool Check_Exit(object id);
    }
}
