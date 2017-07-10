using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NHibernate_repository.Models
{
    public class Supplier
    {
        public virtual int SupplierID { get; set; }
        public virtual int ProductID { get; set; }
        public virtual string CompanyName { get; set; }
        public virtual string ContactName { get; set; }
        public virtual List<Product> Listproducts { get; set; }
        public virtual Order OrderCode { get; set; }

    }
}