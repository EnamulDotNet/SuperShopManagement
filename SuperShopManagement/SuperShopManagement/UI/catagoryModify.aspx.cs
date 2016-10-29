using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuperShopManagement.UI
{
    public partial class catagoryModify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Sid"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }
        private static string conn = WebConfigurationManager.ConnectionStrings["SuperShopDbConnection"].ConnectionString;
        public static SqlConnection connection =new SqlConnection(conn);
        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Catagory.CatagoryId, Catagory.CatagoryName, MeasurementUnit.MeasurementName,Catagory.CatagoryDescription,Catagory.CreateDate FROM Catagory INNER JOIN MeasurementUnit ON Catagory.MeasurementId=MeasurementUnit.MeasurementId"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            catGridView.DataSource = dt;
                            catGridView.DataBind();
                        }
                    }
                }
            }
        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            catGridView.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)catGridView.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblID");
            connection.Open();
            SqlCommand cmd = new SqlCommand("delete FROM Catagory where CatagoryId='" + Convert.ToInt32(catGridView.DataKeys[e.RowIndex].Value.ToString()) + "'", connection);
            int roweffect=cmd.ExecuteNonQuery();
            connection.Close();
            BindGrid();
            if (roweffect>0)
            {
                catagoryModifyStatusLabel.Text = "Delete successfull.";
                catagoryModifyStatusLabel.ForeColor = Color.MediumSeaGreen;
            }
            else
            {
                catagoryModifyStatusLabel.Text = "Delete fail.";
                catagoryModifyStatusLabel.ForeColor = Color.Red;
            }

        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            catGridView.EditIndex = e.NewEditIndex;
            BindGrid();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            catGridView.EditIndex = -1;
            BindGrid();
            catagoryModifyStatusLabel.Text = "Modify cancel.";
            catagoryModifyStatusLabel.ForeColor=Color.Red;
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int roweffect = 0;
            var dataKey = catGridView.DataKeys[e.RowIndex];
            if (dataKey != null)
            {
                int userid = Convert.ToInt32(dataKey.Value.ToString());
                GridViewRow row = (GridViewRow)catGridView.Rows[e.RowIndex];
                TextBox catName = (TextBox)row.Cells[1].Controls[0];
                int catMeaId = int.Parse(((DropDownList)(row.Cells[2].FindControl("ddlUnit"))).SelectedValue);
                TextBox catDes = (TextBox)row.Cells[3].Controls[0];
                TextBox catdate = (TextBox)row.Cells[4].Controls[0];

                catGridView.EditIndex = -1;
                connection.Open();
                SqlCommand cmd = new SqlCommand("update Catagory set CatagoryName='" + catName.Text + "',MeasurementId='" + catMeaId.ToString() + "',CatagoryDescription='"+catDes.Text+ "',CreateDate='"+catdate.Text+ "' where CatagoryId='" + userid + "'", connection);
                roweffect=cmd.ExecuteNonQuery();
            }
            connection.Close();
            BindGrid();
            if (roweffect>0)
            {
                catagoryModifyStatusLabel.Text = "Modify Successfull.";
                catagoryModifyStatusLabel.ForeColor = Color.MediumSeaGreen;
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var ddl = e.Row.FindControl("ddlUnit") as DropDownList;
                if (ddl != null)
                {
                    Label lblloc = (Label)e.Row.FindControl("lblloc");
                   // DropDownList ddl = (DropDownList)e.Row.FindControl("drploc");
                    string constr = ConfigurationManager.ConnectionStrings["SuperShopDbConnection"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constr))
                    {
                        using (SqlCommand cmd = new SqlCommand("uspPopulateUnit"))
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.Connection = con;
                            con.Open();
                            ddl.DataSource = cmd.ExecuteReader();
                            ddl.DataTextField = "MeasurementName";
                            ddl.DataValueField = "MeasurementId";
                            ddl.DataBind();
                            ddl.Items.FindByText(lblloc.Text).Selected = true;
                            con.Close();
                        }
                    }
                    ddl.Items.Insert(0, new ListItem("-----Select Unit-----", "0"));
                }
            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["SuperShopDbConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {

                    cmd.CommandText = "SELECT C.CatagoryId,C.CatagoryName,M.MeasurementName,C.CatagoryDescription,C.CreateDate FROM Catagory C INNER JOIN MeasurementUnit M ON C.MeasurementId=M.MeasurementId WHERE C.CatagoryName LIKE '%' + @searchText + '%'";
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@searchText", searchTextBox.Text.Trim());
                    DataTable dt = new DataTable();
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                        catGridView.DataSource = dt;
                        catGridView.DataBind();
                    }
                }
            }
        }
    }
}