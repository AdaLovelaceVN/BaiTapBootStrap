using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Swinkaran.Nhbnt.Web.Models
{
    public class Order
    {
        
        public virtual DateTime? OrderDate { get; set; }
        public virtual string ShipToName { get; set; }
        public virtual int OrderID { get; set; }
        public virtual int CustomerID { get; set; }

        //public Customers OrderedBy(int customerID)
        //{
        //    return unitOfWork.GetRepository<Customers>().FindBy(customerID);
        //}
    }
}