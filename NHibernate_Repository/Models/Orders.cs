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
        
        private Customer orderedBy;
        public virtual Customer OrderedBy
        {
            get { return orderedBy; }
            protected set { orderedBy = value; }
        }
    }
}