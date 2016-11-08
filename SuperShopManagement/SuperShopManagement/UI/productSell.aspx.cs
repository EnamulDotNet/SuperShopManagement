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
                Session["Products"] = dt;
                this.BindGrid();

                

            }
           
        }

        protected void BindGrid()
        {
            GridView1.Columns[5].Visible = true;
            GridView1.DataSource = (DataTable)Session["Products"];
            GridView1.DataBind();
            GridView1.Columns[5].Visible = false;
        }



        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = (DataTable) Session["Products"];
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

                    Session["Products"] = dt;
                    this.BindGrid();
                    productSellQtyTextBox.Text = String.Empty;
                    productSellQtyTextBox.Focus();
                }
                else
                {
                    sellqtyLabel.Visible = false;
                   
                    dt.Rows.Add(productIdTextBox.Text.Trim(), searchTextBox.Text.Trim(), productPriceTextBox.Text.Trim(),
                       sellqty.ToString("N3") , totalPrice.ToString("N2"), stockremain.ToString("N3"));
                    Session["Products"] = dt;
                    this.BindGrid();
                    searchTextBox.Text = String.Empty;
                    productIdTextBox.Text = String.Empty;
                    productQtyTextBox.Text = String.Empty;
                    productPriceTextBox.Text = String.Empty;
                    productSellQtyTextBox.Text = String.Empty;
                    lblSellUnit.Text=String.Empty;
                    searchTextBox.Focus();
                    

                }
                 
               
            }
            catch (Exception)
            {

                ;
            }
            
        }

        [WebMethod]

        public static List<string> GetProductNames(string prefix)
        {
            List<string> products = new List<string>();
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["SuperShopDbConnection"].ConnectionString;
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText =
                        "select ProductName from Product where ProductName like @SearchText + '%'";
                    cmd.Parameters.AddWithValue("@SearchText", prefix);
                    cmd.Connection = conn;
                    conn.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            products.Add(sdr["ProductName"].ToString());
                        }
                    }
                    conn.Close();
                }
            }
            return products;
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
                
                Session.Clear();
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
            string sqlconn = ConfigurationManager.ConnectionStrings["SuperShopDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(sqlconn);
            string proName = searchTextBox.Text;

            SqlCommand cmd = new SqlCommand("select p.ProductId, p.ProductQty,p.ProductSellPrice, m.MeasurementName from Product p inner join Catagory c on p.CatagoryId = c.CatagoryId inner join MeasurementUnit m on c.MeasurementId = m.MeasurementId where p.ProductName = '"+proName+"'", conn);

            conn.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            
            while (reader.Read())
            {

                productIdTextBox.Text = reader["ProductId"].ToString();
                productQtyTextBox.Text = reader["ProductQty"].ToString();
                productPriceTextBox.Text = reader["ProductSellPrice"].ToString();
                lblSellUnit.Text = reader["MeasurementName"].ToString();
            }
            reader.Close();
            conn.Close();
            if (productIdTextBox.Text != string.Empty) return;
            
            productIdTextBox.Text = "No product found!";



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

                e.Row.Cells[4].Text = tot.ToString("N2");
                e.Row.Cells[4].Font.Bold = true;
                e.Row.Cells[4].ForeColor = Color.DeepPink;
            }
           Session["totamut"]=tot;

        }

        protected void returnButton_Click(object sender, EventArgs e)
        {
            decimal retk = Convert.ToDecimal(givenAmountTextBox.Text) - Convert.ToDecimal(Session["totamut"]);


            returnTextBox.Text = retk.ToString("N2");
            if (retk < 0)
            {
                
                moremoneyLabel.Text = "Need more " + (Convert.ToDecimal(Session["totamut"])- Convert.ToDecimal(givenAmountTextBox.Text)).ToString("N2")+" TK.";
            }

        }


        protected void productSellQtyTextBox_TextChanged(object sender, EventArgs e)
        {
            btnAdd.Focus();
        }
    }
}