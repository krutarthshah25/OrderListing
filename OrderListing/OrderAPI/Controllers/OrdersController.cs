using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using OrderAPI.Data;
using OrderAPI.Models.FilterHelper;

namespace OrderAPI.Controllers
{
    //[Route("api/[controller]")]
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        [HttpGet]
        public IActionResult GetOrders()
        {
            clsOrders orders = new clsOrders();
            var orderList = orders.fnGetOrders().ToList();
            return Ok(JsonConvert.SerializeObject(orderList));
        }

        [HttpGet]
        public IActionResult GetOrdersFitered(int CustomerId,DateTime FromDate,DateTime ToDate)
        {
            clsOrders orders = new clsOrders();
            var orderList = orders.fnGetOrders(CustomerId, FromDate, ToDate).ToList();
            return Ok(JsonConvert.SerializeObject(orderList));
        }
    }
}
