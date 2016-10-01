using System;
using System.Collections.Generic;
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
            string query = "SELECT * FROM Admin WHERE AdminUserName='" + admin.AdminUserName + "' AND AdminPassword='" + admin.AdminPassword + "'";
            command=new SqlCommand(query,connection);
            connection.Open();
            SqlDataReader reader = command.ExecuteReader();
            bool loginsts = reader.HasRows;
            reader.Close();
            connection.Close();
            return loginsts;
        }
    }
}