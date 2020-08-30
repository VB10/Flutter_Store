using Dal.Abstract;
using Entities.Models;
using SiparisTakip.Dal.Abstract;
using SiparisTakip.Dal.Concrete.EntityFramework.Context;
using SiparisTakip.Entittes.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SiparisTakip.Dal.Concrete.EntityFramework.Repository
{
    public class EfUserRepository : EfGenericRepository<Users>, IUserRepository
    {
        public EfUserRepository():base()
        {
            
        }
      

        public List<Products> FavoriteProducts(int userId)
        {
            throw new NotImplementedException();
        }

        public List<Products> PurchasedProducts(int userId)
        {
            throw new NotImplementedException();
        }

        public List<Products> StarsProducts(int userId)
        {
            throw new NotImplementedException();
        }
    }
}
