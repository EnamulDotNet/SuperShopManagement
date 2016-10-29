using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SuperShopManagement.DAL;
using SuperShopManagement.Models;

namespace SuperShopManagement.BLL
{
    public class CatagoryManager
    {
        CatagoryGateway catagoryGateway = new CatagoryGateway();
        public bool CatagorySave(Catagory catagory)
        {
            
            return catagoryGateway.CtrSave(catagory);
        }

        
    }
}