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
        /// <summary>
        /// 
        /// </summary>
        public UserEntity() { }

        /// <summary>
        /// Constructor for UserEntity
        /// </summary>
        /// <param name="sKey"></param>
        /// <param name="sRow"></param>
        public UserEntity(string sKey, string sRow)
        {
            this.PartitionKey = sKey;
            this.RowKey = sRow;
        }

        /// <summary>
        /// Firstname of the user
        /// </summary>
        [Required(ErrorMessage = "Firstname cannot be empty")]
        public string fname { get; set; }

        /// <summary>
        /// Lastname of the user
        /// </summary>
        [Required(ErrorMessage = "Lastname cannot be empty")]
        public string lname { get; set; }

        /// <summary>
        /// User's age
        /// </summary>
        [Range(18,65, ErrorMessage = "Age has to be between 18 and 65")]
        public int age { get; set; }

        /// <summary>
        /// Email ID of the user
        /// </summary>
        [RegularExpression(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$", ErrorMessage = "Email Id is invalid")]
        public string emailID { get; set; }

    }
}