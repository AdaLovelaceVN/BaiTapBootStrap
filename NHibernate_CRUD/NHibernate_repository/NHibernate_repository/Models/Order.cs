using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NHibernate_repository.Models
{
    public class Order
    {
        public Order() { }

        public Order(Customer orderedBy)
        {
            OrderBy = orderedBy;
            OrderBy.AddOrder(this);
        }
        public virtual int OrderID { get; set; }
        public virtual int CustomerID { get; set; }
        public virtual string OrderDate { get; set; }
        public virtual string ShipToName { get; set; }
        public virtual Customer OrderBy {
            get { return orderedBy; }
            set { orderedBy = value; }
        }
        private Customer orderedBy;
    }
}