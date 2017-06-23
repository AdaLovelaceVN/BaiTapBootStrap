using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BaiTapBooStrap.Controllers
{
    public class BlankPageController : Controller
    {
        // GET: BlankPage
        public ActionResult Index()
        {
            return View();
        }
    }
}