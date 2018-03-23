using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Azure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Table;
using WebRoleDemo.Models;

namespace WebRoleDemo.Data_Access
{
    /// <summary>
    /// User Entity Context to create and list users
    /// </summary>
    public class UserEntityContext
    {
        /// <summary>
        /// Create a new user
        /// </summary>
        /// <param name="userinfo"></param>
        /// <returns></returns>                 
        public string CreateUser(UserEntity userinfo)
        {
            string str = string.Empty;
            try
            {
                //Set Partition and Row Key
                userinfo.PartitionKey = "User";
                userinfo.RowKey = userinfo.lname;

                //Create a storage account object, table client and retrieve the reference to "user" table
                CloudStorageAccount storageAccount = CloudStorageAccount.Parse(CloudConfigurationManager.GetSetting("AzureConnection"));
                //CloudStorageAccount storageAccount = CloudStorageAccount.Parse("DefaultEndpointsProtocol=https;AccountName=sktblstorage;AccountKey=qsPycDrcqwkzAbHst5uiibGhF/AEpgqFuAV7LUl2nvE8q8ROEiruzf7pVPPzEPWaeOPjhBNB3AaHiNwJ9HQ76A==;EndpointSuffix=core.windows.net");
                CloudTableClient tableClient = storageAccount.CreateCloudTableClient();
                CloudTable table = tableClient.GetTableReference("user");
                table.CreateIfNotExists();

                //Query to insert new user data
                TableQuery<UserEntity> query = new TableQuery<UserEntity>().Where(TableQuery.GenerateFilterCondition("PartitionKey", QueryComparisons.Equal, "User"));
                TableOperation insertOperation = TableOperation.Insert(userinfo);
                table.Execute(insertOperation);
            }
            catch (StorageException ex)
            {
                str = ex.RequestInformation.ExtendedErrorInformation.ErrorMessage;
            }
            return str;
        }

        /// <summary>
        /// List all users
        /// </summary>
        /// <param name="sUser"></param>
        /// <returns></returns>
        public List<UserEntity> GetUser(string sUser)
        {
            List<UserEntity> users = new List<UserEntity>();

            //Create a storage account object, table client and retrieve the reference to "user" table
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(CloudConfigurationManager.GetSetting("AzureConnection"));
            //CloudStorageAccount storageAccount = CloudStorageAccount.Parse("DefaultEndpointsProtocol=https;AccountName=sktblstorage;AccountKey=qsPycDrcqwkzAbHst5uiibGhF/AEpgqFuAV7LUl2nvE8q8ROEiruzf7pVPPzEPWaeOPjhBNB3AaHiNwJ9HQ76A==;EndpointSuffix=core.windows.net");

            CloudTableClient tableClient = storageAccount.CreateCloudTableClient();            
            CloudTable table = tableClient.GetTableReference("user");

            if (table.Exists())
            {

                // Query to get all users in "User" partition
                TableQuery<UserEntity> query = new TableQuery<UserEntity>().Where(TableQuery.GenerateFilterCondition("PartitionKey", QueryComparisons.Equal, "User"));

                foreach (UserEntity entity in table.ExecuteQuery(query))
                {
                    users.Add(entity);
                }
            }
            return users;
        }
    }
}