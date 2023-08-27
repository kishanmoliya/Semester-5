using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.SqlClient;

namespace SQL_Crud.Areas.LOC_State.Controllers
{
    [Area("LOC_State")]
    public class LOC_StateController : Controller
    {
        #region Configuration...
        private IConfiguration Configuration;

        public LOC_StateController(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        #endregion

        #region State List...
        public IActionResult Index()
        {
            string connectionString = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable(); 
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand commnd = connection.CreateCommand();
            commnd.CommandType = CommandType.StoredProcedure;
            commnd.CommandText = "PR_State_SelectAll";
            SqlDataReader data_reader = commnd.ExecuteReader();
            dt.Load(data_reader);
            connection.Close();

            return View("LOC_StateList", dt);
        }
        #endregion
    }
}
