using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Entities.Models;
using Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace FlutterApi.Controllers
{
    [Route("api/[controller]/[Action]")]
    [ApiController]
    public class ProductController : Controller
    {
        IProductService products;
        public ProductController(IProductService product)
        {
            this.products = product;
        }
        [HttpGet("{userId}/{productId}")]
        public IActionResult GetProduct(int userId,int productId)
        {
            Products product = products.GetProduct(userId, productId);
            return Ok(product);
        }
    }
}