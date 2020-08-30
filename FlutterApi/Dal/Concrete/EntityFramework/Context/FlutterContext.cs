namespace SiparisTakip.Dal.Concrete.EntityFramework.Context
{
    using Entities.Models;
    using Microsoft.EntityFrameworkCore;
    using System;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class FlutterContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
           optionsBuilder.UseSqlServer("server=.;database=OnlineSaglikcim;trusted_connection=true;");
         }
        public FlutterContext()
        {
        }
        public FlutterContext(DbContextOptions options) : base(options)
        {
        }

        public virtual DbSet<Categories> Categories { get; set; }
        public virtual DbSet<Products> Products { get; set; }
        public virtual DbSet<ProductPhotos> ProductPhotos { get; set; }
        public virtual DbSet<PurchaseHistory> PurchaseHistory { get; set; }
        public virtual DbSet<SubCategories> SubCategories { get; set; }
        public virtual DbSet<UserFavorites> UserFavorites { get; set; }
        public virtual DbSet<Users> Users { get; set; }
        public virtual DbSet<UserStars> UserStars { get; set; }

    }
}
