using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Microsoft.WindowsAzure.Storage.Table;


namespace WebRoleDemo.Models
{
    public class UserEntity: TableEntity
    {
        public UserEntity(string sKey, string sRow)
        {
            this.PartitionKey = sKey;
            this.RowKey = sRow;
        }

        public UserEntity() { }
        
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Range(0,120)]
        public int Age { get; set; }
        [RegularExpression(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$")]
        public string EmailID { get; set; }

    }
}