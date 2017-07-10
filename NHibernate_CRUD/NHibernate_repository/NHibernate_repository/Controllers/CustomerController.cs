using NHibernate_repository.Models;
using NHibernate_repository.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NHibernate_repository.Controllers
{
    public class CustomerController : Controller
    {
        // GET: Customer
        UnitofWork uow = new UnitofWork();
        // GET: Customer
        public ActionResult Index()
        {
            using (var tx = uow.BeginTransaction())
            {
                var listitem = uow.GetRepository<Customer>().All().ToList();

                return View(listitem);
            }
        }
        public ActionResult Create()
        {

            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Customer person)
        {
            using (var tx = uow.BeginTransaction())
            {
                // Do transactional things here!
                if (uow.GetRepository<Customer>().Add(person))
                {
                    return RedirectToAction("Index","Customer","Customer");
                }
                return View();
            }
        }
        public ActionResult AddOrder(int id) 
        {
            Order order = new Order() { CustomerID = id, OrderDate = DateTime.Now.Date.ToString("dd/MM/yyyy") };
            return View(order);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddOrderConfirm(Order addorder)
        {
            using (var tx = uow.BeginTransaction())
            {
                //Customer person = uow.GetRepository<Customer>().FindBy(addorder.CustomerID);

                //Order order = new Order(person) { CustomerID = addorder.CustomerID, OrderDate = addorder.OrderDate, ShipToName = addorder.ShipToName };
                //person.AddOrder(order);
                OrderSQL ordersql = new OrderSQL()
                {
                    CustomerID = addorder.CustomerID,
                    OrderDate = addorder.OrderDate,
                    ShipToName = addorder.ShipToName
                };
                // Do transactional things here!
                if (uow.GetRepository<OrderSQL>().Add(ordersql))
                {
                    return RedirectToAction("Index");
                }
                return View();
            }
        }
        public ActionResult Update(string id,string company, string contact)
        {
            Customer person = new Customer()
            {
                CustomerID = int.Parse(id),
                CompanyName = company,
                ContactName = contact
            };
            return View(person);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Update(Customer person)
        {
            using (var tx = uow.BeginTransaction())
            {
                // Do transactional things here!
                if (uow.GetRepository<Customer>().Update(person))
                {
                    return RedirectToAction("Index");
                }
                return View();
            }
        }
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfim(int id)
        {
            using (var tx = uow.BeginTransaction())
            {
                var person = uow.GetRepository<Customer>().FindBy(id);
                if (uow.GetRepository<Customer>().FindBy(id).ListOrder != null)
                {
                    IEnumerable<Order> lstorder = uow.GetRepository<Customer>().FindBy(id).ListOrder;
                    foreach (var item in lstorder)
                    {
                        uow.GetRepository<Order>().Delete(item);
                    }
                    person.ListOrder = null;
                }
                
                if (uow.GetRepository<Customer>().Delete(person))
                {
                    return RedirectToAction("Index");
                }
            }           
            return View();
        }
        
    }
}