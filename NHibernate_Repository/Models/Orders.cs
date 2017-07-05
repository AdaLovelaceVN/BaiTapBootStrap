using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Swinkaran.Nhbnt.Web.Models
{
    public class Order
    {
<<<<<<< HEAD
        public virtual DateTime? OrderDate { get; set; }
        public virtual string ShipToName { get; set; }
        public virtual int OrderID { get; set; }
        
        private Customer orderedBy;
        public virtual Customer OrderedBy
        {
            get { return orderedBy; }
            protected set { orderedBy = value; }
        }
=======
        
        public virtual DateTime? OrderDate { get; set; }
        public virtual string ShipToName { get; set; }
        public virtual int OrderID { get; set; }
        public virtual int CustomerID { get; set; }

        //public Customers OrderedBy(int customerID)
        //{
        //    return unitOfWork.GetRepository<Customers>().FindBy(customerID);
        //}
>>>>>>> 14fbc891ea7c1e821ce06249ce84f5ceb98045f9
    }
}