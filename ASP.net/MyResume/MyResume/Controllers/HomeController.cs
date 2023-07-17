using Microsoft.AspNetCore.Mvc;
using MyResume.Models;
using System.Diagnostics;

namespace MyResume.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}