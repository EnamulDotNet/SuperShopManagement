﻿using System;
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
    public partial class entry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Sid"] == null)
            {
                Response.Redirect("index.aspx");
            }
            if (!IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["SuperShopDbConnection"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT CatagoryId, CatagoryName FROM Catagory"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        catagoryDropdown.DataSource = cmd.ExecuteReader();
                        catagoryDropdown.DataTextField = "CatagoryName";
                        catagoryDropdown.DataValueField = "CatagoryId";
                        catagoryDropdown.DataBind();
                        con.Close();
                    }
                }
                catagoryDropdown.Items.Insert(0, new ListItem("--Select Catagory--", "0"));
            }

        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            
            Product product=new Product();
            product.ProductName = productNameTextBox.Text;
            product.ProductDescription = productDescriptionTextBox.Text;
            product.ProductQty =Convert.ToInt32(productQtyTextBox.Text);
            product.ProductBuyPrice = Convert.ToDouble(productBuyPriceTextBox.Text);
            product.ProductSalePrice = Convert.ToDouble(productSellPriceTextBox.Text);
            product.CatagoryId = Convert.ToInt32(catagoryDropdown.SelectedValue);

            ProductManager productManager=new ProductManager();
            bool saveProduct = productManager.CheckSaveProducts(product);
            if (saveProduct)
            {
                saveProductLabel.ForeColor=Color.Green;
                saveProductLabel.Text = "Save Successfully";
            }
            else
            {
                saveProductLabel.ForeColor = Color.Red;
                saveProductLabel.Text = "Save Fail";
            }

        }
    }
}