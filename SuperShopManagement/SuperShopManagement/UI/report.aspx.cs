using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuperShopManagement.UI
{
    public partial class report : System.Web.UI.Page
    {
        string sqlconn = ConfigurationManager.ConnectionStrings["SuperShopDbConnection"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }



        }
        public void BindGrid()
        {
            string fmDate = fromDate.Value;
            string todate = toDate.Value;
            SqlConnection oconn = new SqlConnection(sqlconn);
            oconn.Open();
            SqlCommand ocmd = new SqlCommand("select P.ProductName, SUM(S.ProductSaleQty) AS SaleQuantity, SUM(P.ProductSellPrice * S.ProductSaleQty) AS TotalPrice from ProductSale S INNER JOIN Product P ON S.ProductId = P.ProductId WHERE ProductSaleDate BETWEEN '"+fmDate+"' AND '"+todate+"' GROUP BY P.ProductName", oconn);
            SqlDataAdapter oda = new SqlDataAdapter(ocmd);
            SqlCommandBuilder builder = new SqlCommandBuilder(oda);
            DataSet ds = new DataSet();
            oda.Fill(ds);
            reportGridview.DataSource = ds;
            reportGridview.DataBind();

        }

        protected void showReportButton_Click(object sender, EventArgs e)
        {
            BindGrid();

        }
    }
}