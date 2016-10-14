using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuperShopManagement.UI
{
    public partial class catagory : System.Web.UI.Page
    {
        static string sqlconn = ConfigurationManager.ConnectionStrings["SuperShopDbConnection"].ToString();
        SqlConnection conn = new SqlConnection(sqlconn);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Sid"] == null)
                {
                    Response.Redirect("index.aspx");
                }
                BindGrid();
            }
        }
        public void BindGrid()
        {
            
            conn.Open();
            SqlCommand ocmd = new SqlCommand("SELECT * FROM Catagory", conn);
            SqlDataAdapter oda = new SqlDataAdapter(ocmd);
            DataTable dt = new DataTable();
            oda.Fill(dt);
            catagoryGridView.DataSource = dt;
            catagoryGridView.DataBind();
            

        }

        protected void catagorySaveButton_Click(object sender, EventArgs e)
        {
            
            SqlCommand cmd = new SqlCommand("spInsertCatagory", conn) {CommandType = CommandType.StoredProcedure};
            cmd.Parameters.AddWithValue("@CatagoryName", catagoryNameTextBox.Text);
            cmd.Parameters.AddWithValue("@CatagoryDescription", catagorydescriptionTextBox.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            BindGrid();
        }

        protected void logoutButton_Click(object sender, EventArgs e)
        {
            Session.Remove("sid");
            Response.Redirect("index.aspx");
        }


    }
}