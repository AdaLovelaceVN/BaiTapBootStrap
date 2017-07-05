using NHibernate;
using NHibernate.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Swinkaran.Nhbnt.Web.Models;
using nhibernate.Models;
using System.Net;

namespace Swinkaran.Nhbnt.Web.Controllers
{
    public class CustomersController : Controller
    {
        UnitOfWork unitOfWork = new UnitOfWork();
        // GET: Customers
        public ActionResult Index()
        {
            var listItem = unitOfWork.GetRepository<Customers>().All().ToList();
            return View(listItem);
        }

        public ActionResult Create()
        {
            return View();
        }

        // POST: People/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Customers customer)
        {

            using (var tx = unitOfWork.BeginTransaction())
            {
                // Do transactional things here!
                if (unitOfWork.GetRepository<Customers>().Add(customer))
                {
                    return RedirectToAction("Index");
                }
                return View();
            }

        }
    }
}