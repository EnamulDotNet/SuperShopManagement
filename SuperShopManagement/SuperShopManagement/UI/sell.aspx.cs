using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Configuration;
using System.Data.SqlClient;
namespace SuperShopManagement.UI
{
    public partial class sell : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[2] { new DataColumn("ProductName"), new DataColumn("ProductQty") });
                ViewState["Products"] = dt;
                this.BindGrid();
            }
        }
        protected void BindGrid()
        {
            GridView1.DataSource = (DataTable)ViewState["Products"];
            GridView1.DataBind();
        }
       
        [WebMethod]
        public static string[] GetProductNames(string prefix)
        {
            List<string> products = new List<string>();
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["SuperShopDbConnection"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select ProductName, ProductId from Product where ProductName like @SearchText + '%'";
                    cmd.Parameters.AddWithValue("@SearchText", prefix);
                    cmd.Connection = conn;
                    conn.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            products.Add(string.Format("{0}-{1}", sdr["ProductName"], sdr["ProductId"]));
                        }
                    }
                    conn.Close();
                }
            }
            return products.ToArray();
        }
        protected void Submit(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)ViewState["Products"];
            dt.Rows.Add(txtSearch.Text.Trim(), qtyTextBox.Text.Trim());
            ViewState["Products"] = dt;
            this.BindGrid();
            txtSearch.Text = string.Empty;
            qtyTextBox.Text = string.Empty;
            string productName = Request.Form[txtSearch.UniqueID];
            string productId = Request.Form[ProductId.UniqueID];
           // ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Product Name: " + productName + "\\nProduct ID: " + productId + "');", true);
        }
    }
}