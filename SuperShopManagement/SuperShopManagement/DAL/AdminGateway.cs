using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using SuperShopManagement.Models;

namespace SuperShopManagement.DAL
{
    public class AdminGateway:CommonGateway
    {
        public bool CheckLogin(Admin admin)
        {
            command = new SqlCommand("uspCheckAdmin", connection);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@AdminUserName", admin.AdminUserName);
            command.Parameters.AddWithValue("@AdminPassword", admin.AdminPassword);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            bool loginsts = reader.HasRows;
            reader.Close();
            connection.Close();
            if (loginsts==true)
            {
                return true;
            }
            return false;
        }
    }
}