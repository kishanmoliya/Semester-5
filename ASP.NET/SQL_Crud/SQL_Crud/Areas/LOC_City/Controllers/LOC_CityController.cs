using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using SQL_Crud.Areas.LOC_City.Models;
using SQL_Crud.Areas.LOC_Country.Models;
using SQL_Crud.Areas.LOC_State.Models;

namespace SQL_Crud.Areas.LOC_City.Controllers
{
    /*[dbo].[PR_GetStateFromCountry] @CountryID = 1*/
    [Area("LOC_City")]
    public class LOC_CityController : Controller
    {
        #region Configuration...
        private IConfiguration Configuration;

        public LOC_CityController(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        #endregion

        #region City List...
        public IActionResult Index()
        {
            string connectionString = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand commnd = connection.CreateCommand();
            commnd.CommandType = CommandType.StoredProcedure;
            commnd.CommandText = "PR_City_SelectAll";
            SqlDataReader data_reader = commnd.ExecuteReader();
            dt.Load(data_reader);
            connection.Close();

            return View("LOC_CityList", dt);
        }
        #endregion

        #region City Delete...
        public IActionResult LOC_CityDelete(int CityID)
        {
            try
            {
                string connectionString = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "PR_City_DeleteByPK";
                command.Parameters.AddWithValue("@CityID", CityID);
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

        #region City Add Edit...
        public IActionResult LOC_CityAddEdit(int? CityID)
        {
            LOC_CityModel cityModel = new LOC_CityModel();

            #region Country & State Dropdowns...
            string connectionString = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_Country_Dropdown";
            SqlDataReader reader = command.ExecuteReader();
            dt.Load(reader);

            List<LOC_CountryDropdownModel> countryDropdownModels = new List<LOC_CountryDropdownModel>();
            foreach (DataRow data in dt.Rows)
            {
                LOC_CountryDropdownModel countryModel = new LOC_CountryDropdownModel
                {
                    CountryID = Convert.ToInt32(data["CountryID"]),
                    CountryName = data["CountryName"].ToString(),
                };
                countryDropdownModels.Add(countryModel);
            }

            cityModel.CountryDropdownList = countryDropdownModels;
            #endregion

            if (CityID != null)
            {
                try
                {
                    string connection_string = this.Configuration.GetConnectionString("myConnectionString");
                    DataTable data_table = new DataTable();
                    SqlConnection sql_connection = new SqlConnection(connection_string);
                    sql_connection.Open();
                    SqlCommand sql_command = sql_connection.CreateCommand();
                    sql_command.CommandType = CommandType.StoredProcedure;
                    sql_command.CommandText = "PR_City_SelectByPK";
                    sql_command.Parameters.AddWithValue("@CityID", CityID);
                    SqlDataReader sql_data_reader = sql_command.ExecuteReader();
                    data_table.Load(sql_data_reader);
                    sql_connection.Close();

                    cityModel.CityID = Convert.ToInt32(data_table.Rows[0]["CityID"]);
                    cityModel.StateID = Convert.ToInt32(data_table.Rows[0]["StateID"]);
                    cityModel.CountryID = Convert.ToInt32(data_table.Rows[0]["CountryID"]);
                    cityModel.CityName = data_table.Rows[0]["CityName"].ToString();
                    cityModel.CityCode = data_table.Rows[0]["CityCode"].ToString();
                    cityModel.StateName = data_table.Rows[0]["StateName"].ToString();
                    cityModel.CountryName = data_table.Rows[0]["CountryName"].ToString();
                    

                    return View(cityModel);
                }
                catch (Exception ex)
                {
                    return View();
                }
            }
            else
            {
                cityModel.CityID = CityID;

                return View(cityModel);
            }
        }
        #endregion

        #region Save Record...
        public IActionResult Save(LOC_CityModel cityModel)
        {
            try
            {
                string connectionString = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                if (cityModel.CityID == null)
                {
                    command.CommandText = "PR_City_Insert_Record";
                }
                else
                {
                    command.CommandText = "PR_City_UpdateByPK";
                    command.Parameters.AddWithValue("@CityID", cityModel.CityID);
                }
                command.Parameters.AddWithValue("@StateID", cityModel.StateID);
                command.Parameters.AddWithValue("@CountryID", cityModel.CountryID);
                command.Parameters.AddWithValue("@CityName", cityModel.CityName);
                command.Parameters.AddWithValue("@CityCode", cityModel.CityCode);
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

        #region Search City...
        public IActionResult LOC_CitySearch(LOC_CityModel LOC_City)
        {
            string connectionString = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection connection = new SqlConnection(connectionString);
            DataTable dt = new DataTable();
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_City_Search";
            command.Parameters.AddWithValue("@CityName", LOC_City.CityName);
            command.Parameters.AddWithValue("@CityCode", LOC_City.CityCode);
            SqlDataReader data_reader = command.ExecuteReader();
            dt.Load(data_reader);
            connection.Close();

            return View("LOC_CityList", dt);
        }
        #endregion
    }
}
