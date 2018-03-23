using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using Microsoft.WindowsAzure.Storage.Table;


namespace WebRoleDemo.Models
{
    /// <summary>
    /// UserEntity contains user information such as firstname, lastname, age and emailId.
    /// </summary>
    public class UserEntity: TableEntity
    {

        public UserEntity() { }

        public UserEntity(string sKey, string sRow)
        {
            this.PartitionKey = sKey;
            this.RowKey = sRow;
        }
        
        /// <summary>
        /// Firstname of the user
        /// </summary>
        [Required]
        public string fname { get; set; }

        /// <summary>
        /// Lastname of the user
        /// </summary>
        [Required]
        public string lname { get; set; }

        /// <summary>
        /// User's age
        /// </summary>
        [Range(18,65)]
        public int age { get; set; }

        /// <summary>
        /// Email ID of the user
        /// </summary>
        [RegularExpression(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$")]
        public string emailID { get; set; }

    }
}