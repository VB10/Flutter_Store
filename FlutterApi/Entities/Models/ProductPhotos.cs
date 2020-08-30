﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Entities.Models
{
    [Table("ProductPhotos")]
    public class ProductPhotos
    {
        public int Id { get; set; }
        public string photoUrl { get; set; }
        public int prdocutId { get; set; }
        [ForeignKey("prdocutId")]
        public virtual Products Products { get; set; }
    }
}