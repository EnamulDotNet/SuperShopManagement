using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using SuperShopManagement.Models;

namespace SuperShopManagement.DAL
{
    public class ProductGateway:CommonGateway
    {
        public bool SaveProducts(Product product)
        {
            SqlCommand cmd = new SqlCommand("InsertProducts", connection) { CommandType = CommandType.StoredProcedure };
            cmd.Parameters.AddWithValue("@ProductName", product.ProductName);
            cmd.Parameters.AddWithValue("@ProductDescription", product.ProductDescription);
            cmd.Parameters.AddWithValue("@ProductQty", product.ProductQty);
            cmd.Parameters.AddWithValue("@ProductBuyPrice", product.ProductBuyPrice);
            cmd.Parameters.AddWithValue("@ProductSellPrice", product.ProductSalePrice);
            cmd.Parameters.AddWithValue("@CatagoryId", product.CatagoryId);
            connection.Open();
            int rowaffeted=cmd.ExecuteNonQuery();
            connection.Close();
            if (rowaffeted>0)
            {
                return true;
            }

            return false;
        }

        public object Show()
        {

          
            SqlCommand cmd = new SqlCommand("select * from Product", connection);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
            return ds;

        }
    }
}