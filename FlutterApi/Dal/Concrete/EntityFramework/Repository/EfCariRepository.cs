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
    public class EfCariRepository : EfGenericRepository<Cari>, ICariRepository
    {
        public EfCariRepository():base()
        {
            
        }
        public List<Cari> CariHesapEktresi(int cariId)
        {
            return context.Cari.Where(x => x.CariID == cariId).ToList();
        }
    }
}
