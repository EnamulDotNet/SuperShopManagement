using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SuperShopManagement.BLL;
using SuperShopManagement.Models;

namespace SuperShopManagement.UI
{
    public partial class catagory1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Sid"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (!IsPostBack)
            {

                PopulateCatagoryDrodown();
            }


        }

        public void PopulateCatagoryDrodown()
        {

            string constr = ConfigurationManager.ConnectionStrings["SuperShopDbConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("uspPopulateUnit"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    catagoryMeasurementDropdownList.DataSource = cmd.ExecuteReader();
                    catagoryMeasurementDropdownList.DataTextField = "MeasurementName";
                    catagoryMeasurementDropdownList.DataValueField = "MeasurementId";
                    catagoryMeasurementDropdownList.DataBind();
                    con.Close();
                }
            }
            catagoryMeasurementDropdownList.Items.Insert(0, new ListItem("---Select Unit---", "0"));
            catagoryMeasurementDropdownList.Items[0].Selected = true;
            catagoryMeasurementDropdownList.Items[0].Attributes["disabled"] = "disabled";

        }

        protected void catagorySaveButton_Click(object sender, EventArgs e)
        {
            Catagory catagory=new Catagory();

            catagory.CatagoryName = catagoryNameTextBox.Text;
            catagory.MeasurementId = Convert.ToInt32(catagoryMeasurementDropdownList.SelectedValue);
            catagory.CatagoryDescription = catagorydescriptionTextBox.Text;

            CatagoryManager catagoryManager=new CatagoryManager();
            bool catagorySaveStatus = catagoryManager.CatagorySave(catagory);
            if (catagorySaveStatus)
            {
                catagorySaveStatusLabel.Text = "Save successful.";
                catagorySaveStatusLabel.ForeColor=Color.MediumSeaGreen;
                catagoryNameTextBox.Text = String.Empty;
                catagoryMeasurementDropdownList.SelectedValue = "0";
                catagorydescriptionTextBox.Text=String.Empty;
            }
            else
            {
                catagorySaveStatusLabel.Text = "Save fail.";
                catagorySaveStatusLabel.ForeColor = Color.Red;
            }

        }
    }
}