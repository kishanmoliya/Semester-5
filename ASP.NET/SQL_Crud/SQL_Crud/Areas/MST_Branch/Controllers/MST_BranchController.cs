using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using SQL_Crud.Areas.LOC_Country.Models;
using SQL_Crud.Areas.MST_Branch.Models;
using SQL_Crud.Areas.LOC_City.Models;

namespace SQL_Crud.Areas.MST_Branch.Controllers
{
    [Area("MST_Branch")]
    public class MST_BranchController : Controller
    {
        #region Configuation...
        private IConfiguration Configuration;
        public MST_BranchController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }
        #endregion

        #region Branch Display...
        public IActionResult Index()
        {
            string myConnectionStrings = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection(myConnectionStrings);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_Branch_SelectAll";
            SqlDataReader data_reader = command.ExecuteReader();
            dt.Load(data_reader);
            connection.Close();

            return View("MST_BranchList", dt);
        }
        #endregion

        #region Branch Delete...
        public IActionResult MST_BranchDelete(int BranchID)
        {
            try
            {
                string myConnectionStrings = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection connection = new SqlConnection(myConnectionStrings);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "PR_Branch_DeleteByPK";
                command.Parameters.AddWithValue("@BranchID", BranchID);
                command.ExecuteNonQuery();
                connection.Close();

                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return RedirectToAction("Index");
            }
        }
        #endregion

        #region Branch Add Edit...
        public IActionResult MST_BranchAddEdit(int? ID)
        {
            ViewBag.Data = ID;
            if (ID != null)
            {
                try
                {
                    string connectionString = this.Configuration.GetConnectionString("myConnectionString");
                    DataTable dt = new DataTable();
                    SqlConnection connection = new SqlConnection(connectionString);
                    connection.Open();
                    SqlCommand command = connection.CreateCommand();
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "PR_Branch_SelectByPK";
                    command.Parameters.AddWithValue("@BranchID", ID);
                    SqlDataReader data_reader = command.ExecuteReader();
                    dt.Load(data_reader);
                    connection.Close();

                    MST_BranchModel model = new MST_BranchModel
                    {
                        BranchID = Convert.ToInt32(dt.Rows[0]["BranchID"]),
                        BranchName = Convert.ToString(dt.Rows[0]["BranchName"]),
                        BranchCode = Convert.ToString(dt.Rows[0]["BranchCode"]),
                    };

                    return View(model);
                }
                catch (Exception ex)
                {
                    return View();
                }
            }
            else
            {
                MST_BranchModel model = new MST_BranchModel
                {
                    BranchID = ID,
                };

                return View(model);
            }
        }
        #endregion

        #region Branch Save...
        public IActionResult Save(MST_BranchModel BranchModel)
        {
            try
            {
                string connectionString = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                if (BranchModel.BranchID == null)
                {
                    command.CommandText = "PR_Branch_Insert_Record";
                }
                else
                {
                    command.CommandText = "PR_Branch_UpdateByPK";
                    command.Parameters.AddWithValue("@BranchID", BranchModel.BranchID);
                }
                command.Parameters.AddWithValue("@BranchName", BranchModel.BranchName);
                command.Parameters.AddWithValue("@BranchCode", BranchModel.BranchCode);
                command.ExecuteNonQuery();
                connection.Close();

                return RedirectToAction("Index");

            }
            catch (Exception ex)
            {
                return RedirectToAction("Index");
            }
        }
        #endregion

        #region Search Branch...
        public IActionResult MST_BranchSearch(MST_BranchModel MST_Branch)
        {
            string connectionString = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection connection = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_Branch_Search";
            command.Parameters.AddWithValue("@BranchName", MST_Branch.BranchName);
            command.Parameters.AddWithValue("@BranchCode", MST_Branch.BranchCode);
            SqlDataReader data_reader = command.ExecuteReader();
            dt.Load(data_reader);
            connection.Close();

            return View("MST_BranchList", dt);
        }
        #endregion
    }
}
