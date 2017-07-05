using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Swinkaran.Nhbnt.Web.Models
{
    public class Customers
    {
        UnitOfWork unitOfWork = new UnitOfWork();
        public Customers() {}

        public virtual int CustomerID { get; }
        public virtual string companyName{get;set;}
        public virtual string ContactName { get; set; }

        public IList<Orders> Orders()
        {
            return unitOfWork.GetRepository<Orders>().All().ToList();
        }

    }
}