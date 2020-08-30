using Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interfaces
{
    public interface IStokService:IGenericService<Products>
    {
        Products GetProduct(int userId,int productId);

        bool BuyProduct(int userId,int productId,int count);

    }
}
