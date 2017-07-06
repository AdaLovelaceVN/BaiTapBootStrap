using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Swinkaran.Nhbnt.Web.Models
{
    public class Customer
    {
        public virtual int CustomerID { get; set; }
        public virtual string CompanyName{get;set;}
        public virtual string ContactName { get; set; }
        
        private IList<Order> orders = new List<Order>();
        public virtual IList<Order> Orders
        {
            get { return new List<Order>(orders).AsReadOnly(); }
            protected set { orders = value; }
        }


    }
}