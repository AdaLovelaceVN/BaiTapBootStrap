using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Swinkaran.Nhbnt.Web.Models
{
    public class Orders
    {
        UnitOfWork unitOfWork = new UnitOfWork();
        public Orders() { }

        public virtual DateTime? OrderDate { get; set; }
        public virtual string ShipToName { get; set; }
        public virtual int OrderID { get; }
        public virtual int CustomerID { get; set; }

        public Orders(Orders orders)
        {
            using (var tx = unitOfWork.BeginTransaction())
            {
                if (unitOfWork.GetRepository<Customers>().Check_Exit(orders.CustomerID))
                    unitOfWork.GetRepository<Orders>().Add(orders);
            }
        }

        public Customers OrderedBy(int customerID)
        {
            return unitOfWork.GetRepository<Customers>().FindBy(customerID);
        }
    }
}