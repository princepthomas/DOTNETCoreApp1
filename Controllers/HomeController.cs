using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IDbConnection _dbConnection;

        public HomeController(ILogger<HomeController> logger, IDbConnection dbConnection)
        {
            _logger = logger;
            _dbConnection = dbConnection ?? throw new ArgumentNullException(nameof(dbConnection));
        }

        public async Task<IActionResult> Index()
        {
                var insertSql = "INSERT INTO request_log (request_date) " +
                    "VALUES (@RequestDate)";

                await _dbConnection.ExecuteAsync(insertSql, new
                {
                    RequestDate = DateTime.Now
                });

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
