using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebRoleDemo.Models;
using WebRoleDemo.Data_Access;

namespace WebRoleDemo.Controllers
{
    public class UserController : ApiController
    {
        
        [Route("api/User/GetUser")]
        public List<UserEntity> Get()
        {
            UserEntityContext uContext = new UserEntityContext();
            List<UserEntity> users =  uContext.GetUser("User");
            return users;
        }


       
        [Route("api/User/CreateUser")]
        public IHttpActionResult Post([FromBody]UserEntity user)
        {
            if (ModelState.IsValid)
            {
                UserEntityContext uContext = new UserEntityContext();
                string bResult = uContext.CreateUser(user);
                if (bResult.Length == 0)
                {
                    return Ok();
                }
                else
                {
                    return BadRequest(bResult);
                }
            }
            else
            {
                return BadRequest(ModelState);
            }
        }

       
    }
}