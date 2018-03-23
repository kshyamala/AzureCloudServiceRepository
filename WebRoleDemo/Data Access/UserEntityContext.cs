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
    public class UserEntityContext
    {
       
      
        public string CreateUser(UserEntity userinfo)
        {
            string str = string.Empty;
            bool bSuccess = false;
            try
            {
                UserEntity user = new UserEntity("User", userinfo.lname);
                user.fname = userinfo.fname;
                user.lname = userinfo.lname;
                user.age = userinfo.age;
                user.emailID = userinfo.emailID;

                CloudStorageAccount storageAccount = CloudStorageAccount.Parse(CloudConfigurationManager.GetSetting("AzureConnection"));
                //CloudStorageAccount storageAccount = CloudStorageAccount.Parse("DefaultEndpointsProtocol=https;AccountName=sktblstorage;AccountKey=qsPycDrcqwkzAbHst5uiibGhF/AEpgqFuAV7LUl2nvE8q8ROEiruzf7pVPPzEPWaeOPjhBNB3AaHiNwJ9HQ76A==;EndpointSuffix=core.windows.net");
                CloudTableClient tableClient = storageAccount.CreateCloudTableClient();
                CloudTable table = tableClient.GetTableReference("user");
                table.CreateIfNotExists();
                TableQuery<UserEntity> query = new TableQuery<UserEntity>().Where(TableQuery.GenerateFilterCondition("PartitionKey", QueryComparisons.Equal, "User"));

                TableOperation insertOperation = TableOperation.Insert(user);


                table.Execute(insertOperation);
                bSuccess = true;
            }
            catch (StorageException ex)
            {
                bSuccess = false;
                str = ex.RequestInformation.ExtendedErrorInformation.ErrorMessage;
            }
            return str;
        }

        public List<UserEntity> GetUser(string sUser)
        {
            List<UserEntity> users = new List<UserEntity>();

            //Create a storage account object.
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(CloudConfigurationManager.GetSetting("AzureConnection"));
            //CloudStorageAccount storageAccount = CloudStorageAccount.Parse("DefaultEndpointsProtocol=https;AccountName=sktblstorage;AccountKey=qsPycDrcqwkzAbHst5uiibGhF/AEpgqFuAV7LUl2nvE8q8ROEiruzf7pVPPzEPWaeOPjhBNB3AaHiNwJ9HQ76A==;EndpointSuffix=core.windows.net");
            // Create the table client.
            CloudTableClient tableClient = storageAccount.CreateCloudTableClient();

            // Retrieve a reference to the table.
            CloudTable table = tableClient.GetTableReference("user");

            if (table.Exists())
            {

                // Get All Users
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