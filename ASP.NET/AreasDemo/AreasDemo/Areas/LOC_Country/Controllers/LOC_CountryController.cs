using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.SqlClient;

namespace AreasDemo.Areas.LOC_Country.Controllers
{
    [Area("LOC_Country")]
    public class LOC_CountryController : Controller
    {
        private IConfiguration Configuration;
        public LOC_CountryController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }

        public IActionResult Index()
        {
            string myConnectionStrings = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection(myConnectionStrings);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_Country_SelectAll";
            SqlDataReader data_reader = command.ExecuteReader();
            dt.Load(data_reader);
            connection.Close();

            return View("LOC_CountryList", dt);
        }
    }
}
