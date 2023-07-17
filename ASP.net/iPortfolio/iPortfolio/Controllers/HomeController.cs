using iPortfolio.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace iPortfolio.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            ViewBag.Title = "Index";
            return View();
        }

        public IActionResult About()
        {
            ViewBag.Title = "About";
            return View();
        }

        public IActionResult Resume()
        {
            ViewBag.Title = "Resume";
            return View();
        }

        public IActionResult Portfolio()
        {
            ViewBag.Title = "Portfolio";
            return View();
        }

        public IActionResult Services()
        {
            ViewBag.Title = "Services";
            return View();
        }

        public IActionResult Contact()
        {
            ViewBag.Title = "Contact";
            return View();
        }
    }
}