using System;
using System.Collections.Generic;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductManager productManager=new ProductManager();
            productGridView.DataSource= productManager.ShowProduct();
            //SqlConnection con=new SqlConnection("Server=PACERS-9; Database=SuperShopDb; Integrated Security=true");
            //SqlCommand cmd=new SqlCommand("select * from Product",con);
            //SqlDataAdapter da=new SqlDataAdapter(cmd);
            //DataSet ds=new DataSet();
            //da.Fill(ds);
            //con.Open();
            //cmd.ExecuteNonQuery();
            //con.Close();
            //productGridView.DataSource=ds;
            productGridView.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void productGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "Operation";
                e.Row.Cells[1].Text = "Sl.No.";
                e.Row.Cells[2].Text = "Name";
                e.Row.Cells[3].Text = "Description";
                e.Row.Cells[4].Text = "Catagory";
                e.Row.Cells[5].Text = "Quantity";
                e.Row.Cells[6].Text = "Buy Price";
                e.Row.Cells[7].Text = "Sell Price";
            }
        }


    }
}