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
                decimal totalPrice = Convert.ToDecimal(productSellQtyTextBox.Text)*Convert.ToDecimal(productPriceTextBox.Text);
                decimal sellqty = Convert.ToDecimal(productSellQtyTextBox.Text.Trim());
                decimal stockremain = Convert.ToDecimal(productQtyTextBox.Text) - Convert.ToDecimal(productSellQtyTextBox.Text);

                if (sellqty.ToString("N3") == "0.000" || stockremain < 0)
                {
                    sellqtyLabel.Visible = true;
                    sellqtyLabel.Text = "Sell quantity error!";

                    ViewState["Products"] = dt;
                    this.BindGrid();
                    productSellQtyTextBox.Text = String.Empty;
                    productSellQtyTextBox.Focus();
                }
                else
                {
                    sellqtyLabel.Visible = false;
                   
                    dt.Rows.Add(productIdTextBox.Text.Trim(), searchTextBox.Text.Trim(), productPriceTextBox.Text.Trim(),
                       sellqty.ToString("N3") , totalPrice.ToString("N2"), stockremain.ToString("N3"));
                    ViewState["Products"] = dt;
                    this.BindGrid();
                    searchTextBox.Text = String.Empty;
                    productIdTextBox.Text = String.Empty;
                    productQtyTextBox.Text = String.Empty;
                    productPriceTextBox.Text = String.Empty;
                    productSellQtyTextBox.Text = String.Empty;
                    searchTextBox.Focus();
                    

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

                    decimal productSellqty = decimal.Parse(GridView1.Rows[i].Cells[3].Text);
                    decimal productRemainQty = decimal.Parse(GridView1.Rows[i].Cells[5].Text);
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
                
                ViewState.Clear();
                Response.Redirect("productSell.aspx");
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
            productSellQtyTextBox.Focus();
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
            if (retk < 0)
            {
                
                moremoneyLabel.Text = "Need more " + (Convert.ToDecimal(ViewState["totamut"])- Convert.ToDecimal(givenAmountTextBox.Text)).ToString()+" TK.";
            }

        }

        protected void searchTextBox_TextChanged(object sender, EventArgs e)
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
            productSellQtyTextBox.Focus();
            //searchButton.Focus();
        }

        protected void productSellQtyTextBox_TextChanged(object sender, EventArgs e)
        {
            btnAdd.Focus();
        }
    }
}