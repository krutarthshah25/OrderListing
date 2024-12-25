using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Order.Web.UI.Models
{
    public class Orders
    {
        public string OrderId { get; set; }
        public string CustomerId { get; set; }
        public string OrderDate { get; set; }
        public string TotalAmount { get; set; }
    }
}