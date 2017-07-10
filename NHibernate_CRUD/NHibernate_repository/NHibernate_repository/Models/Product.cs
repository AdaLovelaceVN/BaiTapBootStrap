using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NHibernate_repository.Models
{
    public class Product
    {
        public virtual int ProductID { get; set; }
        public virtual string ProductName { get; set; }

        public virtual Supplier SuppliedBy { get; set; }
        public virtual Order OrderProduct { get; set; }
    }
}