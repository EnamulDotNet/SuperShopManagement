using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SuperShopManagement.DAL;
using SuperShopManagement.Models;

namespace SuperShopManagement.BLL
{
    public class AdminManager
    {
        public bool Check(Admin admin)
        {
            AdminGateway adminGateway=new AdminGateway();
            return adminGateway.CheckLogin(admin);
        }
    }
}