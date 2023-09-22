﻿using Microsoft.AspNetCore.Mvc;
using SQL_Crud.Areas.LOC_Country.Models;
using System.Data.SqlClient;
using System.Data;

namespace SQL_Crud.Areas.LOC_Country.Controllers
{
    [Area("LOC_Country")]
    public class LOC_CountryController : Controller
    {
        #region Configuation...
        private IConfiguration Configuration;
        public LOC_CountryController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }
        #endregion

        #region Country Display...
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
        #endregion

        #region Country Delete...
        public IActionResult LOC_CountryDelete(int CountryID)
        {
            try
            {
                string myConnectionStrings = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection connection = new SqlConnection(myConnectionStrings);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "PR_Country_DeleteByPK";
                command.Parameters.AddWithValue("@CountryID", CountryID);
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

        #region Country Add Edit...
        public IActionResult LOC_CountryAddEdit(int? ID)
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
                    command.CommandText = "PR_Country_SelectByPK";
                    command.Parameters.AddWithValue("@CountryID", ID);
                    SqlDataReader data_reader = command.ExecuteReader();
                    dt.Load(data_reader);
                    connection.Close();

                    LOC_CountryModel model = new LOC_CountryModel
                    {
                        CountryID = Convert.ToInt32(dt.Rows[0]["CountryID"]),
                        CountryName = Convert.ToString(dt.Rows[0]["CountryName"]),
                        CountryCode = Convert.ToString(dt.Rows[0]["CountryCode"]),
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
                LOC_CountryModel model = new LOC_CountryModel
                {
                    CountryID = ID,
                };

                return View(model);
            }
        }
        #endregion

        #region Country Save...
        public IActionResult Save(LOC_CountryModel countryModel)
        {
            try
            {
                string connectionString = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                if (countryModel.CountryID == null)
                {
                    command.CommandText = "PR_Country_Insert_Record";
                }
                else
                {
                    command.CommandText = "PR_Country_UpdateByPK";
                    command.Parameters.AddWithValue("@CountryID", countryModel.CountryID);
                }
                command.Parameters.AddWithValue("@CountryName", countryModel.CountryName);
                command.Parameters.AddWithValue("@CountryCode", countryModel.CountryCode);
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

        #region Search Contry...
        public IActionResult LOC_CountrySearch(LOC_CountryModel LOC_Country)
        {
            string connectionString = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection connection = new SqlConnection( connectionString);
            DataTable dt = new DataTable();
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_Country_Search";
            command.Parameters.AddWithValue("@CountryName", LOC_Country.CountryName);
            command.Parameters.AddWithValue("@CountryCode", LOC_Country.CountryCode);
            SqlDataReader data_reader = command.ExecuteReader();
            dt.Load(data_reader);
            connection.Close();

            return View("LOC_CountryList", dt);
        }
        #endregion
    }
}
