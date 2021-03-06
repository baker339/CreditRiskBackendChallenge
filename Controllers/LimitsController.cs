using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using NetCoreWebApp.Models;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace CreditRiskBackendChallenge.Controllers
{
    public class LimitsController : Controller
    {
        public IActionResult Index()
        {
            try
            {
                LimitsContext context = HttpContext.RequestServices.GetService(typeof(NetCoreWebApp.Models.LimitsContext)) as LimitsContext;

                return View(context.GetLimits());
            }
            catch
            {
                return Error();
            }
        }

        public IActionResult Error()
        {
            return View("Error");
        }
    }
}
