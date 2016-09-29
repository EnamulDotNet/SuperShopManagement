using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Web;

namespace SuperShopManagement.Models
{
    public class Report
    {
        public int ProductSaleId { get; set; }
        public int ProductSaleQty { get; set; }
        public  double ProductSalePrice { get; set; }
        public DateTime ProductSaleDate { get; set; }
        public int ProductId { get; set; }

         
    }
}