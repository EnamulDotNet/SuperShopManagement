using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using SuperShopManagement.Models;

namespace SuperShopManagement.DAL
{
    public class CatagoryGateway:CommonGateway
    {
        public bool CtrSave(Catagory catagory)
        {
            SqlCommand cmd=new SqlCommand("uspInsertCatagory", connection);
            cmd.CommandType=CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CatagoryName", catagory.CatagoryName);
            cmd.Parameters.AddWithValue("@MeasurementId", catagory.MeasurementId);
            cmd.Parameters.AddWithValue("@CatagoryDescription", catagory.CatagoryDescription);

            connection.Open();
            int rowAffected = cmd.ExecuteNonQuery();
            connection.Close();
            if (rowAffected>0)
            {
                return true;
            }
            return false;
        }


       
    }
}