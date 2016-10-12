using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using SuperShopManagement.BLL;
using SuperShopManagement.Models;

namespace SuperShopManagement.UI
{
    public partial class index : Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Admin admin=new Admin();
            admin.AdminUserName = userNameTextBox.Text;
            admin.AdminPassword = passwordTextBox.Text;
            AdminManager manager=new AdminManager();
            bool loginStatus = manager.Check(admin);
            if (loginStatus)
            {
                Session["Sid"] = Session.SessionID;
                Response.Redirect("home.aspx");
            }
            else
            {
                
                loginStatusLabel.Text = "Invalid username or password";
            }


        }
        protected void LoginButton_Click1(object sender, EventArgs e)
        {
            Admin admin = new Admin();
            admin.AdminUserName = userNameTextBox.Text;
            admin.AdminPassword = passwordTextBox.Text;
            AdminManager manager = new AdminManager();
            bool loginStatus = manager.Check(admin);
            if (loginStatus)
            {
                Session["Sid"] = Session.SessionID;
                Response.Redirect("home.aspx");
            }
            else
            {

                loginStatusLabel.Text = "Invalid username or password";
            }
        }
}
}