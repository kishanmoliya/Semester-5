using Microsoft.AspNetCore.Mvc;
using SQL_Crud.Areas.LOC_Country.Models;
using SQL_Crud.Areas.LOC_State.Models;
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

        #region State Delete...
        public IActionResult LOC_StateDelete(int StateID)
        {
            try
            {
                string connectionString = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "PR_State_DeleteByPK";
                command.Parameters.AddWithValue("@StateID", StateID);
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

        #region Add Edit...
        public IActionResult LOC_StateAddEdit(int? id)
        {
            #region Country List Dropdown...
            string connectionString = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dataTable = new DataTable();
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_Country_Dropdown";
            SqlDataReader data_reader = command.ExecuteReader();
            dataTable.Load(data_reader);
            connection.Close();

            List<LOC_CountryDropdownModel> countryDropdownModelsList = new List<LOC_CountryDropdownModel>();
            foreach (DataRow data in dataTable.Rows)
            {
                LOC_CountryDropdownModel countryModel = new LOC_CountryDropdownModel
                {
                    CountryID = Convert.ToInt32(data["CountryID"]),
                    CountryName = data["CountryName"].ToString(),
                };
                countryDropdownModelsList.Add(countryModel);
            }

            ViewBag.CountryDropdownList = countryDropdownModelsList;
            #endregion
            if (id != null)
            {
                try
                {
                    string connString = this.Configuration.GetConnectionString("myConnectionString");
                    DataTable data_table = new DataTable();
                    SqlConnection sql_connection = new SqlConnection(connString);
                    sql_connection.Open();
                    SqlCommand cmd = sql_connection.CreateCommand();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "PR_State_SelectByPK";
                    cmd.Parameters.AddWithValue("@StateID", id);
                    SqlDataReader sql_data_reader = cmd.ExecuteReader();
                    data_table.Load(sql_data_reader);
                    sql_connection.Close();

                    LOC_StateModel model = new LOC_StateModel {
                        StateID = Convert.ToInt32(data_table.Rows[0]["StateID"]),
                        CountryID = Convert.ToInt32(data_table.Rows[0]["CountryID"]),
                        StateName = data_table.Rows[0]["StateName"].ToString(),
                        StateCode = data_table.Rows[0]["StateCode"].ToString(),
                    }; 

                    return View(model);
                }catch (Exception ex)
                {
                    return View();
                }
            }
            else
            {
                LOC_StateModel model = new LOC_StateModel
                {
                    StateID = id,
                };
                return View(model); 
            }
        }
        #endregion

        #region Save new State...
        public IActionResult Save(LOC_StateModel stateModel) {
            try
            {
                string connString = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection connection = new SqlConnection(connString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                if (stateModel.StateID == null)
                {
                    command.CommandText = "PR_State_Insert_Record";
                }
                else
                {
                    command.CommandText = "PR_State_UpdateByPK";
                    command.Parameters.AddWithValue("@StateID", stateModel.StateID);
                }
                command.Parameters.AddWithValue("@CountryID", stateModel.CountryID);
                command.Parameters.AddWithValue("@StateName", stateModel.StateName);
                command.Parameters.AddWithValue("@StateCode", stateModel.StateCode);
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

        #region Search State...
        public IActionResult LOC_StateSearch(LOC_StateModel LOC_State)
        {
            string connectionString = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection connection = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_State_Search";
            command.Parameters.AddWithValue("@StateName", LOC_State.StateName);
            command.Parameters.AddWithValue("@StateCode", LOC_State.StateCode);
            SqlDataReader data_reader = command.ExecuteReader();
            dt.Load(data_reader);
            connection.Close();

            return View("LOC_StateList", dt);
        }
        #endregion
    }
}
