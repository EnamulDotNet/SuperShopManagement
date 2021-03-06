﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SuperShopManagement.BLL;
using SuperShopManagement.Models;

namespace SuperShopManagement.UI
{
    public partial class productEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["Sid"] == null)
            //{
            //    Response.Redirect("login.aspx");
            //}
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
                catagoryDropdown.Items.Insert(0, new ListItem("---Select Catagory---", "0"));
                catagoryDropdown.Items[0].Selected = true;
                catagoryDropdown.Items[0].Attributes["disabled"] = "disabled";
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT SupplierId, SupplierName FROM Supplier"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        supplierDropdown.DataSource = cmd.ExecuteReader();
                        supplierDropdown.DataTextField = "SupplierName";
                        supplierDropdown.DataValueField = "SupplierId";
                        supplierDropdown.DataBind();
                        con.Close();
                    }
                }
                supplierDropdown.Items.Insert(0, new ListItem("---Select Supplier---", "0"));
                supplierDropdown.Items[0].Selected = true;
                supplierDropdown.Items[0].Attributes["disabled"] = "disabled";
            }

        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            double productsellprice = Convert.ToDouble(productSellPriceTextBox.Text);
            double productax = 0;
            if (taxTextBox.Text.Trim() != String.Empty)
            {
                 productax = Convert.ToDouble(taxTextBox.Text);
            }
            double totalsellprice = productsellprice + (productax/100)*productsellprice;
            Product product = new Product();
            product.ProductName = productNameTextBox.Text;
            product.ProductDescription = productDescriptionTextBox.Text;
            product.SupplierId = Convert.ToInt32(supplierDropdown.SelectedValue);
            product.ProductQty = Convert.ToInt32(productQtyTextBox.Text);
            product.ProductBuyPrice = Convert.ToDouble(productBuyPriceTextBox.Text);
            product.ProductSalePrice = totalsellprice;
            if (taxTextBox.Text.Trim() != String.Empty)
            {
                product.ProductTax = Convert.ToDouble(taxTextBox.Text);
            }
            else
            {
                product.ProductTax = 0;
            }
            
            product.CatagoryId = Convert.ToInt32(catagoryDropdown.SelectedValue);
          
            ProductManager productManager = new ProductManager();
            bool saveProduct = productManager.CheckSaveProducts(product);
            if (saveProduct)
            {
                ClearInputs(Page.Controls);
                saveProductLabel.ForeColor = Color.Green;
                saveProductLabel.Text = "Save Successfully";
            }
            else
            {
                saveProductLabel.ForeColor = Color.Red;
                saveProductLabel.Text = "Save Fail";
            }
           

        }

        protected void resetButton_Click(object sender, EventArgs e)
        {
            ClearInputs(Page.Controls);
        }
        
        void ClearInputs(ControlCollection ctrls)
        {
            foreach (Control ctrl in ctrls)
            {
                if (ctrl.GetType() == typeof(TextBox))
                {
                    ((TextBox)ctrl).Text = String.Empty;
                }

                else if (ctrl.GetType() == typeof(Label))
                {
                    ((Label)(ctrl)).Text = string.Empty;
                }
                else if (ctrl.GetType() == typeof(DropDownList))
                {
                    ((DropDownList)(ctrl)).SelectedIndex = 0;
                }
                else if (ctrl.GetType() == typeof(CheckBox))
                {
                    ((CheckBox)(ctrl)).Checked = false;
                }
                else if (ctrl.GetType() == typeof(CheckBoxList))
                {
                    ((CheckBoxList)(ctrl)).ClearSelection();
                }
                else if (ctrl.GetType() == typeof(RadioButton))
                {
                    ((RadioButton)(ctrl)).Checked = false;
                }
                else if (ctrl.GetType() == typeof(RadioButtonList))
                {
                    ((RadioButtonList)(ctrl)).ClearSelection();
                }
               
                 ClearInputs(ctrl.Controls);
              
            }
        }
        

        protected void OnChangeItem(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["SuperShopDbConnection"].ConnectionString;
            SqlConnection conn = new SqlConnection(constr);
            int meaId = Convert.ToInt32(catagoryDropdown.SelectedValue);
            
            SqlCommand cmd = new SqlCommand("SELECT M.MeasurementName FROM MeasurementUnit M INNER JOIN Catagory C ON M.MeasurementId=C.MeasurementId WHERE C.CatagoryId='"+meaId+"' ", conn);

            conn.Open();
            
            SqlDataReader rdr = cmd.ExecuteReader();
            string unitName = "";
            while (rdr.Read())
            {
                unitName = rdr["MeasurementName"].ToString();
            }
            rdr.Close();
            conn.Close();
            lblQtyUnit.Text = unitName;
        }
    }
}