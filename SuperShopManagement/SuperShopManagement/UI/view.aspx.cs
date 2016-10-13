using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SuperShopManagement.BLL;

namespace SuperShopManagement.UI
{
    public partial class view : System.Web.UI.Page
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
            SqlConnection oconn = new SqlConnection(sqlconn);
            oconn.Open();
            SqlCommand ocmd = new SqlCommand("SELECT P.ProductId,P.ProductName,P.ProductDescription,C.CatagoryName,P.ProductQty,P.ProductBuyPrice,P.ProductSellPrice FROM Product P INNER JOIN Catagory C ON P.CatagoryId=C.CatagoryId", oconn);
            SqlDataAdapter oda = new SqlDataAdapter(ocmd);
            SqlCommandBuilder builder = new SqlCommandBuilder(oda);
            DataSet ds = new DataSet();
            oda.Fill(ds);
            gv1.DataSource = ds;
            gv1.DataBind();

        }

        protected void gv1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            SqlConnection oconn = new SqlConnection(sqlconn);
            oconn.Open();
            SqlCommand ocmd = new SqlCommand("SELECT* FROM Catagory", oconn);
            SqlDataAdapter oda = new SqlDataAdapter(ocmd);
            SqlCommandBuilder builder = new SqlCommandBuilder(oda);
            DataSet ds = new DataSet();
            oda.Fill(ds);
            DropDownList ddl = (DropDownList)e.Row.FindControl("ddlCatagory");
            if (ddl != null)
            {
                ddl.DataSource = ds;
                ddl.DataValueField = "CatagoryId";
                ddl.DataTextField = "CatagoryName";
                ddl.DataBind();
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                DropDownList ddldesig = (DropDownList)e.Row.FindControl("ddladdCatagory");
                ddldesig.DataSource = ds;
                ddldesig.DataValueField = "CatagoryId";
                ddldesig.DataTextField = "CatagoryName";
                ddldesig.DataBind();

            }
            oconn.Close();
        }

        protected void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ProductId = Convert.ToInt32(gv1.DataKeys[e.RowIndex].Value);
            SqlConnection oconn = new SqlConnection(sqlconn);
            oconn.Open();
            SqlCommand ocmd = new SqlCommand();
            ocmd.CommandText = "DELETE FROM Product WHERE ProductId=@ProductId";
            ocmd.Parameters.AddWithValue("@ProductId", ProductId);
            ocmd.Connection = oconn;
            ocmd.ExecuteNonQuery();
            oconn.Close();
            BindGrid();

        }

        protected void gv1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv1.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gv1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                TextBox txtnewname = (TextBox)gv1.FooterRow.FindControl("txtaddProductName");
                TextBox txtnewdescription = (TextBox)gv1.FooterRow.FindControl("txtaddProductDescription");

                DropDownList ddlnew = (DropDownList)gv1.FooterRow.FindControl("ddladdCatagory");
                TextBox txtnewqty = (TextBox)gv1.FooterRow.FindControl("txtaddProductQty");
                TextBox txtnewbuyprice = (TextBox)gv1.FooterRow.FindControl("txtaddProductBuyPrice");
                TextBox txtnewsellprice = (TextBox)gv1.FooterRow.FindControl("txtaddProductSellPrice");

                SqlConnection oconn = new SqlConnection(sqlconn);
                oconn.Open();
                SqlCommand ocmd = new SqlCommand();
                ocmd.CommandText = "INSERT INTO Product VALUES ('" + txtnewname.Text + "','" + txtnewdescription.Text + "','" + txtnewqty.Text + "','" + txtnewbuyprice.Text + "','" + txtnewsellprice.Text + "','" + ddlnew.SelectedValue + "')";
                ocmd.Connection = oconn;
                ocmd.ExecuteNonQuery();
                BindGrid();
            }

        }

        protected void gv1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int ProductId = int.Parse(((Label)(gv1.Rows[e.RowIndex].Cells[1].FindControl("lblProductId"))).Text);
            string ProductName = ((TextBox)(gv1.Rows[e.RowIndex].Cells[1].FindControl("txtProductName"))).Text;
            string ProductDescription = ((TextBox)(gv1.Rows[e.RowIndex].Cells[1].FindControl("txtProductDescription"))).Text;

            int CatagoryId = int.Parse(((DropDownList)(gv1.Rows[e.RowIndex].Cells[1].FindControl("ddlCatagory"))).SelectedValue);
            int ProductQty = int.Parse(((TextBox)(gv1.Rows[e.RowIndex].Cells[1].FindControl("txtProductQty"))).Text);
            decimal ProductBuyPrice = decimal.Parse(((TextBox)(gv1.Rows[e.RowIndex].Cells[1].FindControl("txtProductBuyPrice"))).Text);
            decimal ProductSellPrice = decimal.Parse(((TextBox)(gv1.Rows[e.RowIndex].Cells[1].FindControl("txtProductSellPrice"))).Text);

            SqlConnection oconn = new SqlConnection(sqlconn);
            oconn.Open();
            SqlCommand ocmd = new SqlCommand();
            ocmd.CommandText = "UPDATE Product SET ProductName=@ProductName ,ProductDescription=@ProductDescription,CatagoryId=@CatagoryId,ProductQty=@ProductQty,ProductBuyPrice=@ProductBuyPrice,ProductSellPrice=@ProductSellPrice WHERE ProductId=@ProductId ";
            ocmd.Parameters.AddWithValue("@ProductId", ProductId);
            ocmd.Parameters.AddWithValue("@ProductName", ProductName);
            ocmd.Parameters.AddWithValue("@ProductDescription", ProductDescription);
            ocmd.Parameters.AddWithValue("@CatagoryId", CatagoryId);
            ocmd.Parameters.AddWithValue("@ProductQty", ProductQty);
            ocmd.Parameters.AddWithValue("@ProductBuyPrice", ProductBuyPrice);
            ocmd.Parameters.AddWithValue("@ProductSellPrice", ProductSellPrice);
            ocmd.Connection = oconn;
            ocmd.ExecuteNonQuery();
            gv1.EditIndex = -1;
            BindGrid();


        }

        protected void gv1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv1.EditIndex = -1;
            BindGrid();
        }
    }
}