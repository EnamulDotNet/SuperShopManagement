using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SuperShopManagement.DAL;
using SuperShopManagement.Models;

namespace SuperShopManagement.BLL
{
    public class ProductManager
    {
        public bool CheckSaveProducts(Product product)
        {
            ProductGateway productGateway=new ProductGateway();
            return productGateway.SaveProducts(product);
        }
    }
}