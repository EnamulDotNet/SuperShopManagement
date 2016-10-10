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
            SqlCommand ocmd = new SqlCommand("select P.ProductName, SUM(S.ProductSaleQty) AS SaleQuantity, SUM(P.ProductSellPrice * S.ProductSaleQty) AS TotalPrice from ProductSale S INNER JOIN Product P ON S.ProductId = P.ProductId WHERE ProductSaleDate BETWEEN Convert(date, '" + fmDate+ "', 105) AND Convert(date, '" + todate+ "', 105) GROUP BY P.ProductName", oconn);
            SqlDataAdapter oda = new SqlDataAdapter(ocmd);
            SqlCommandBuilder builder = new SqlCommandBuilder(oda);
            DataTable dt = new DataTable();
            oda.Fill(dt);
            reportGridview.DataSource = dt;
            reportGridview.DataBind();
            try
            {
                decimal total = dt.AsEnumerable().Sum(row => row.Field<decimal>("TotalPrice"));
                reportGridview.FooterRow.Cells[1].Text = "Total";
                reportGridview.FooterRow.Cells[1].HorizontalAlign = HorizontalAlign.Right;
                reportGridview.FooterRow.Cells[2].Text = total.ToString("N2");
                reportGridview.FooterRow.Cells[2].HorizontalAlign = HorizontalAlign.Right;
            }
            catch (Exception)
            {

                ;
            }
            
        }

        protected void showReportButton_Click(object sender, EventArgs e)
        {
            BindGrid();

        }
    }
}