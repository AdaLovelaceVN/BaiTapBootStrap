using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NHibernate_repository.Models
{
    public class Customer
    {
        public virtual int CustomerID { get; set; }
        public virtual string CompanyName { get; set; }
        public virtual string ContactName { get; set; }
        public virtual IList<Order> ListOrder { get; set; }
        public void AddOrder(Order order)
        {
            if (order != null && !orders.Contains(order))
            {
                orders.Add(order);
            }
        }
        public IList<Order> Orders
        {
            get { return new List<Order>(orders).AsReadOnly(); }
            protected set { orders = value; }
        }
        public void RemoveOrder(Order order)
        {
            if (order != null && orders.Contains(order))
            {
                orders.Remove(order);
            }
        }
        private IList<Order> orders = new List<Order>();

    }
}