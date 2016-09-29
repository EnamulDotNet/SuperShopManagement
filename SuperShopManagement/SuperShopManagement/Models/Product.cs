﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SuperShopManagement.Models
{
    public class Product
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public int ProductQty { get; set; }
        public double ProductBuyPrice { get; set; }
        public double ProductSalePrice { get; set; }
        public int CatagoryId { get; set; }

    }
}