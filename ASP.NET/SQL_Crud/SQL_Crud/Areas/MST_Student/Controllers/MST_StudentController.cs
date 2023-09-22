using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using SQL_Crud.Areas.MST_Student.Models;
using Microsoft.CodeAnalysis.Operations;

namespace SQL_Crud.Areas.MST_Student.Controllers
{
    [Area("MST_Student")]
    public class MST_StudentController : Controller
    {
        #region Configuration...
        private IConfiguration Configuration;

        public MST_StudentController(IConfiguration configuration)
        {
            Configuration = configuration;
        }
        #endregion

        #region Student List...
        public IActionResult Index()
        {
            string connectionString = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand commnd = connection.CreateCommand();
            commnd.CommandType = CommandType.StoredProcedure;
            commnd.CommandText = "PR_Student_SelectAll";
            SqlDataReader data_reader = commnd.ExecuteReader();
            dt.Load(data_reader);
            connection.Close();

            return View("MST_StudentList", dt);
        }
        #endregion

        #region Student Delete...
        public IActionResult MST_StudentDelete(int StudentID)
        {
            try
            {
                string connectionString = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "PR_Student_DeleteByPK";
                command.Parameters.AddWithValue("@StudentID", StudentID);
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

        #region Student Add Edit...
        public IActionResult MST_StudentAddEdit(int? StudentID)
        {
            #region City & Branch Dropdowns...
            string connectionString = this.Configuration.GetConnectionString("myConnectionString");
            DataTable cityDataTable = new DataTable();
            DataTable branchDataTable = new DataTable();
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_City_Dropdown";
            SqlDataReader data_reader1 = command.ExecuteReader();
            cityDataTable.Load(data_reader1);
            command.CommandText = "PR_Branch_Dropdown";
            SqlDataReader data_reader2 = command.ExecuteReader();
            branchDataTable.Load(data_reader2);

            List<MST_CityDropdownModel> cityDropdownModelsList = new List<MST_CityDropdownModel>();
            foreach (DataRow data in cityDataTable.Rows)
            {
                MST_CityDropdownModel cityModel = new MST_CityDropdownModel
                {
                    CityID = Convert.ToInt32(data["CityID"]),
                    CityName = data["CityName"].ToString(),
                };
                cityDropdownModelsList.Add(cityModel);
            }


            List<MST_BranchDropdownModel> branchDropdownModelsList = new List<MST_BranchDropdownModel>();
            foreach (DataRow data in branchDataTable.Rows)
            {
                MST_BranchDropdownModel branchModel = new MST_BranchDropdownModel
                {
                    BranchID = Convert.ToInt32(data["BranchID"]),
                    BranchName = data["BranchName"].ToString(),
                };
                branchDropdownModelsList.Add(branchModel);
            }

            ViewBag.CityDropdownList = cityDropdownModelsList;
            ViewBag.BranchDropdownList = branchDropdownModelsList;
            #endregion          

            if (StudentID != null)
            {

                try
                {
                    string connection_string = this.Configuration.GetConnectionString("myConnectionString");
                    DataTable data_table = new DataTable();
                    SqlConnection sql_connection = new SqlConnection(connection_string);
                    sql_connection.Open();
                    SqlCommand sql_command = sql_connection.CreateCommand();
                    sql_command.CommandType = CommandType.StoredProcedure;
                    sql_command.CommandText = "PR_Student_SelectByPK";
                    sql_command.Parameters.AddWithValue("@StudentID", StudentID);
                    SqlDataReader sql_data_reader = sql_command.ExecuteReader();
                    data_table.Load(sql_data_reader);
                    sql_connection.Close();

                    MST_StudentModel model = new MST_StudentModel
                    {
                        StudentID = Convert.ToInt32(data_table.Rows[0]["StudentID"]),
                        CityID = Convert.ToInt32(data_table.Rows[0]["CityID"]),
                        BranchID = Convert.ToInt32(data_table.Rows[0]["BranchID"]),
                        StudentName = data_table.Rows[0]["StudentName"].ToString(),
                        BranchName = data_table.Rows[0]["BranchName"].ToString(),
                        MobileNoStudent = data_table.Rows[0]["MobileNoStudent"].ToString(),
                        Email = data_table.Rows[0]["Email"].ToString(),
                    };

                    return View(model);
                }
                catch (Exception e)
                {
                    return View();
                }
            }
            else
            {
                MST_StudentModel model = new MST_StudentModel
                {
                    StudentID = StudentID
                };
                return View(model);
            }
        }
        #endregion

        #region Save Record...
        public IActionResult Save(MST_StudentModel studentModel)
        {
            try
            {
                string connectionString = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                if (studentModel.StudentID == null)
                {
                    command.CommandText = "PR_Student_Insert_Record";
                }
                else
                {
                    command.CommandText = "PR_Student_UpdateByPK";
                    command.Parameters.AddWithValue("@StudentID", studentModel.StudentID);
                }
                command.Parameters.AddWithValue("@CityID", studentModel.CityID);
                command.Parameters.AddWithValue("@BranchID", studentModel.BranchID);
                command.Parameters.AddWithValue("@StudentName", studentModel.StudentName);
                command.Parameters.AddWithValue("@MobileNoStudent", studentModel.MobileNoStudent);
                command.Parameters.AddWithValue("@Email", studentModel.Email);
                
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
    }
}