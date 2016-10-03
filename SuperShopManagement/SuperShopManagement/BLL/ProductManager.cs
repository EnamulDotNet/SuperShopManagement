using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using SuperShopManagement.DAL;
using SuperShopManagement.Models;

namespace SuperShopManagement.BLL
{
    public class ProductManager
    {
        ProductGateway productGateway = new ProductGateway();
        public bool CheckSaveProducts(Product product)
        {
            
            return productGateway.SaveProducts(product);
        }

        public object ShowProduct()
        {
            
            return productGateway.Show();

        }
    }
}