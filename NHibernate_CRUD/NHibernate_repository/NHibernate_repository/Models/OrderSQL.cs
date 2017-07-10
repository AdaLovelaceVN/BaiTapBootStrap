using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NHibernate_repository.Models
{
    public class OrderSQL
    {
        public virtual int OrderID { get; set; }
        public virtual int CustomerID { get; set; }
        public virtual string OrderDate { get; set; }
        public virtual string ShipToName { get; set; }
    }
}