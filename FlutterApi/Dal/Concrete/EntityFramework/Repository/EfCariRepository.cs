﻿using Dal.AbstractInterfaces;
using Entities.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal.Concrete.EntityFramework.Repository
{
    public class EfCategoriesRepository : EfGenericRepository<Categories>, ICategoriesRepository
    {
        public EfCategoriesRepository():base()
        {
            
        }

        public List<Categories> GetCategories()
        {
            throw new NotImplementedException();
        }
    }
}
