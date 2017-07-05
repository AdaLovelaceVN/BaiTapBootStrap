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
    public class BookController : Controller
    {
        UnitOfWork unitOfWork=new UnitOfWork();
        // GET: Book
        public ActionResult Index()
        {
            //UnitOfWork unitOfWork = new UnitOfWork();
<<<<<<< HEAD
            var listItem1 = unitOfWork.GetRepository<Customer>().All().ToList();
            
            var listItem = unitOfWork.GetRepository<Book>().All().ToList();
=======
            var listItem = unitOfWork.GetRepository<Customers>().All().ToList();
            var listOrder = listItem[0].Orders.ToList();
           // var listItem = unitOfWork.GetRepository<Book>().All().ToList();
>>>>>>> 14fbc891ea7c1e821ce06249ce84f5ceb98045f9
            return View(listItem);
        }

        // GET: Book/Details/5
        //private Model db = new Model();

        
        // GET: People/Details/5
        public ActionResult Details(int? id)
        {
            using (var tx = unitOfWork.BeginTransaction())
            {
                // Do transactional things here!
                return View(unitOfWork.GetRepository<Book>().FindBy(id));
            }         
        }

        // GET: People/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: People/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create( Book person)
        {
            
            using (var tx = unitOfWork.BeginTransaction())
            {
                // Do transactional things here!
                if (unitOfWork.GetRepository<Book>().Add(person))
                {
                    return RedirectToAction("Index");
                }
                return View();
            }
           
        }

        // GET: People/Edit/5
        public ActionResult Edit(int? id)
        {
            using (var tx = unitOfWork.BeginTransaction())
            {
                // Do transactional things here!
                return View(unitOfWork.GetRepository<Book>().FindBy(id));
            }
        }

        // POST: People/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Book person)

        {
            using (var tx = unitOfWork.BeginTransaction())
            {
                // Do transactional things here!
                if (unitOfWork.GetRepository<Book>().Update(person))
                {
                    
                    return RedirectToAction("Index");
                }
                return View();
            }
        }

        // GET: People/Delete/5
        //public ActionResult Delete(Int64? id)
        //{
        //    using (RepositoryBase repository = new RepositoryBase())
        //    {
        //        if (id == null)
        //        {
        //            return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //        }
        //        using (var tx = unitOfWork.BeginTransaction())
        //        {
        //            // Do transactional things here!
        //            ViewBag.SubmitAction = "Confirm delete";
        //            return View("Edit", unitOfWork.GetRepository<Book>().FindBy(id));
        //        }
                

        //    }
        //}

        // POST: People/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfrim(int? id)
        {
            using (RepositoryBase repository = new RepositoryBase())
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                using (var tx = unitOfWork.BeginTransaction())
                {
                    // Do transactional things here!
                    if (unitOfWork.GetRepository<Book>().Delete(unitOfWork.GetRepository<Book>().FindBy(id)))
                    {
                        return RedirectToAction("Index");
                    }
                    return View();
                }
            }
        }

        //protected override void Dispose(bool disposing)
        //{
        //    unitOfWork.Dispose();
        //}
    }
}