using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Entities.Models
{

    [Table("Users")]
    public partial class Users
    {
        public Users()
        {
            UserFavorites = new HashSet<UserFavorites>();
            UserStars = new HashSet<UserStars>();
        }
        public int Id { get; set; }
        public string Name { get; set; }
        public int uniqueId { get; set; }

        public virtual ICollection<UserFavorites> UserFavorites { get; set; }
        public virtual ICollection<UserStars> UserStars { get; set; }

    }
}
