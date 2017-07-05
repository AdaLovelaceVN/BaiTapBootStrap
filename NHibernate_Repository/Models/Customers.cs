using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Swinkaran.Nhbnt.Web.Models
{
    public class Customer
    {
        public virtual int CustomerID { get; set; }
<<<<<<< HEAD
        public virtual string CompanyName{get;set;}
        public virtual string ContactName { get; set; }

=======
        public virtual string CompanyName { get; set; }
        public virtual string ContactName { get; set; }


>>>>>>> 14fbc891ea7c1e821ce06249ce84f5ceb98045f9
        private IList<Order> orders = new List<Order>();
        public virtual IList<Order> Orders
        {
            get { return new List<Order>(orders).AsReadOnly(); }
<<<<<<< HEAD
            protected set { orders = value; }
=======
            protected set
            {
                orders = value;
            }
>>>>>>> 14fbc891ea7c1e821ce06249ce84f5ceb98045f9
        }


    }
}