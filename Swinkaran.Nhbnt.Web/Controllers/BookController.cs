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
        // GET: Book
        public ActionResult Index()
        {
            ViewBag.Message = "Your application description page.";
            using (RepositoryBase repository = new RepositoryBase())
            {
                repository.BeginTransaction();
                var persons = repository.ToList<Book>();
                return View(persons.ToList());

            }
        }

        // GET: Book/Details/5
        //private Model db = new Model();

        
        // GET: People/Details/5
        public ActionResult Details(int? id)
        {
            using (RepositoryBase repository = new RepositoryBase())
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }

                var people = repository.ToList<Book>().Where(b => b.Id == id).FirstOrDefault();
                if (people == null)
                {
                    return HttpNotFound();
                }
                return View(people);

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
            using (RepositoryBase repository = new RepositoryBase())
            {
                repository.BeginTransaction();
                if (ModelState.IsValid)
                {
                    repository.Save(person);
                    repository.CommitTransaction();
                    return RedirectToAction("Index");
                }
            }
            return View();
        }

        // GET: People/Edit/5
        public ActionResult Edit(int? id)
        {
            using (RepositoryBase repository = new RepositoryBase())
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }

                var people = repository.ToList<Book>().Where(b => b.Id == id).FirstOrDefault();
                if (people == null)
                {
                    return HttpNotFound();
                }
                return View(people);

            }
        }

        // POST: People/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Book person)
        {
            using (RepositoryBase repository = new RepositoryBase())
            {
                repository.BeginTransaction();
                if (ModelState.IsValid)
                {

                    repository.Save(person);
                    repository.CommitTransaction();
                    return RedirectToAction("Index");
                }
            }
            return View();
        }

        // GET: People/Delete/5
        public ActionResult Delete(int? id)
        {
            using (RepositoryBase repository = new RepositoryBase())
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }

                var people = repository.ToList<Book>().Where(b => b.Id == id).FirstOrDefault();
                if (people == null)
                {
                    return HttpNotFound();
                }
                ViewBag.SubmitAction = "Confirm delete";
                return View("Edit",people);

            }
        }

        // POST: People/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(Book person)
        {
            using (RepositoryBase repository = new RepositoryBase())
            {
                repository.BeginTransaction();
                if (person == null)
                {
                    return HttpNotFound();
                }
                repository.Delete(person);
                repository.CommitTransaction();
            }
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            using (RepositoryBase repository = new RepositoryBase())
            {
                repository.Dispose();
            }
        }
    }
}