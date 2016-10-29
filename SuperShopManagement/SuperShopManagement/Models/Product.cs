﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SuperShopManagement.Models
{
    public class Product
    {
        public int ProductId { get; set; }
        
        public string ProductName { get; set; }
        public int CatagoryId { get; set; }
        public string ProductDescription { get; set; }
        public int ProductQty { get; set; }
        public int SupplierId { get; set; }
        public double ProductBuyPrice { get; set; }
        public double ProductSalePrice { get; set; }
        public double ProductTax { get; set; }

        

    }
}