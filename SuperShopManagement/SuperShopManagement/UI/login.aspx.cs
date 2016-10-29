using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SuperShopManagement.BLL;
using SuperShopManagement.Models;

namespace SuperShopManagement.UI
{
    public partial class login1 : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            Admin admin = new Admin();
            admin.AdminUserName = usernameTextBox.Text;
            admin.AdminPassword = passwordTextBox.Text;
            AdminManager manager = new AdminManager();
            bool loginStatus = manager.Check(admin);
            if (loginStatus)
            {
                Session["Sid"] = Session.SessionID;
                Response.Redirect("productEntry.aspx");
            }
            else
            {

                loginStatusLabel.Visible = true;
            }
        }
    }
}