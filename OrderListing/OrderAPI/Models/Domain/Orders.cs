namespace OrderAPI.Models.Domain
{
    public class Orders
    {
        public string OrderId { get; set; }
        public string CustomerId { get; set; }
        public string OrderDate { get; set; }
        public string TotalAmount { get; set; }
    }
}
