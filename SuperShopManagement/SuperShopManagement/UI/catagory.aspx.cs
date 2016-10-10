using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuperShopManagement.UI
{
    public partial class catagory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void catagorySaveButton_Click(object sender, EventArgs e)
        {
            string sqlconn = ConfigurationManager.ConnectionStrings["SuperShopDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(sqlconn);
            SqlCommand cmd = new SqlCommand("INSERT INTO Catagory VALUES('"+catagoryNameTextBox.Text+"','"+catagorydescriptionTextBox.Text+"')", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}