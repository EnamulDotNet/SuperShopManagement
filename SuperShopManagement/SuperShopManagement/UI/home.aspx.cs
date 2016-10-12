using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuperShopManagement.UI
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Sid"] == null)
            {
                Response.Redirect("index.aspx");
            }

        }

        protected void logoutButton_Click(object sender, EventArgs e)
        {
            Session.Remove("Sid");
        }
    }
}