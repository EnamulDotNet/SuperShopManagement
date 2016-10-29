using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuperShopManagement.UI
{
    public partial class productSell : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Sid"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (!this.IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[6]
                {
                    new DataColumn("ProductId"), new DataColumn("ProductName"), new DataColumn("ProductPrice"),
                    new DataColumn("ProductQty"), new DataColumn("ProductTotalPrice"), new DataColumn("ProductStockQty")
                });
                ViewState["Products"] = dt;
                this.BindGrid();



            }

        }

        protected void BindGrid()
        {
            GridView1.Columns[5].Visible = true;
            GridView1.DataSource = (DataTable) ViewState["Products"];
            GridView1.DataBind();
            GridView1.Columns[5].Visible = false;
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {

            try
            {
                DataTable dt = (DataTable) ViewState["Products"];
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    string id = GridView1.Rows[i].Cells[0].Text;
                    if (id == productIdTextBox.Text.Trim())
                    {
                        dt.Rows[i].Delete();
                        break;
                    }
                }
                double totalPrice = Convert.ToInt32(productSellQtyTextBox.Text)*
                                    Convert.ToDouble(productPriceTextBox.Text);
                int stockremain = Convert.ToInt32(productQtyTextBox.Text) - Convert.ToInt32(productSellQtyTextBox.Text);
                if (stockremain >= 0)
                {
                    maxSellLabel.Visible = false;
                    dt.Rows.Add(productIdTextBox.Text.Trim(), searchTextBox.Text.Trim(), productPriceTextBox.Text.Trim(),
                        productSellQtyTextBox.Text.Trim(), totalPrice.ToString(), stockremain.ToString());
                    ViewState["Products"] = dt;
                    this.BindGrid();


                }
                else
                {
                    maxSellLabel.Visible = true;
                    maxSellLabel.Text = "Sell quantity can not be more than product quantity";
                    ViewState["Products"] = dt;
                    this.BindGrid();
                }
            }
            catch (Exception)
            {

                ;
            }

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
                    cmd.CommandText =
                        "select ProductName, ProductId from Product where ProductName like @SearchText + '%'";
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

        protected void sellButton_Click(object sender, EventArgs e)
        {
            try
            {
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {

                    int productSellqty = int.Parse(GridView1.Rows[i].Cells[3].Text);
                    int productRemainQty = int.Parse(GridView1.Rows[i].Cells[5].Text);
                    DateTime sellDate = DateTime.Now;
                    int productId = int.Parse(GridView1.Rows[i].Cells[0].Text);
                    string sqlconn = ConfigurationManager.ConnectionStrings["SuperShopDbConnection"].ToString();
                    SqlConnection conn = new SqlConnection(sqlconn);
                    SqlCommand cmd =
                        new SqlCommand(
                            "INSERT INTO ProductSale VALUES('" + productSellqty + "','" + sellDate + "','" + productId +
                            "')", conn);
                    SqlCommand cmdupdate =
                        new SqlCommand(
                            "UPDATE Product SET ProductQty='" + productRemainQty + "' WHERE ProductId='" + productId +
                            "' ", conn);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    cmdupdate.ExecuteNonQuery();
                    conn.Close();
                    sellStatus.ForeColor = Color.Green;
                    sellStatus.Text = "Sell successfully.";

                    searchTextBox.Text = "";
                    productIdTextBox.Text = "";
                    productPriceTextBox.Text = "";
                    productQtyTextBox.Text = "";
                    productSellQtyTextBox.Text = "";
                }

                Response.Redirect("productsell.aspx");
            }
            catch (Exception)
            {

                sellStatus.ForeColor = Color.Red;
                sellStatus.Text = "Sell Fail.";
            }



        }

        string productSellPrice = "";

        protected void searchButton_Click(object sender, EventArgs e)
        {
            //searchTextBox.Text = string.Empty;
            //string productName = Request.Form[searchTextBox.UniqueID];
            string productId = Request.Form[ProductId.UniqueID];
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Product Name: " + productName + "\\nProduct ID: " + productId + "');", true);
            string sqlconn = ConfigurationManager.ConnectionStrings["SuperShopDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(sqlconn);
            SqlCommand cmd =
                new SqlCommand("SELECT ProductQty,ProductSellPrice FROM Product where ProductId='" + productId + "'",
                    conn);
            SqlDataReader reader = null;
            conn.Open();
            reader = cmd.ExecuteReader();
            string productQty = "";

            while (reader.Read())
            {
                productQty = reader["ProductQty"].ToString();
                productSellPrice = reader["ProductSellPrice"].ToString();
            }
            conn.Close();
            productIdTextBox.Text = productId;
            productQtyTextBox.Text = productQty;
            productPriceTextBox.Text = productSellPrice;
        }

        decimal tot = 0;

        protected void GridView1_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                tot += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "ProductTotalPrice"));
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = "Grand Total";
                e.Row.Cells[3].Font.Bold = true;

                e.Row.Cells[4].Text = tot.ToString();
                e.Row.Cells[4].Font.Bold = true;
                e.Row.Cells[4].ForeColor = Color.DeepPink;
            }
           ViewState["totamut"]=tot;

        }

        protected void returnButton_Click(object sender, EventArgs e)
        {
            decimal retk = Convert.ToDecimal(givenAmountTextBox.Text) - Convert.ToDecimal(ViewState["totamut"]);


            returnTextBox.Text = retk.ToString();
            if (retk<0)
            {
                moremoneyLabel.Text = "Need more " + (Convert.ToDecimal(ViewState["totamut"])- Convert.ToDecimal(givenAmountTextBox.Text)).ToString();
            }

        }
    }
}