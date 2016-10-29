using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SuperShopManagement.Models
{
    public class Catagory
    {
        public int CatagoryId { get; set; }
        public string CatagoryName { get; set; }
        public int MeasurementId { get; set; }
        public string CatagoryDescription { get; set; }
        public DateTime CreateDate { get; set; }

    }
}