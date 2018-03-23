using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebRoleDemo.Models;
using WebRoleDemo.Data_Access;

namespace WebRoleDemo.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    public class UserController : ApiController
    {
        /// <summary>
        /// Returns a list of all users 
        /// </summary>
        /// <returns>UserEntity type</returns>
        [HttpGet]
        [Route("api/user/list")]
        [ResponseType(typeof(List<UserEntity>))]
        public List<UserEntity> Get()
        {
            UserEntityContext uContext = new UserEntityContext();
            List<UserEntity> users =  uContext.GetUser("User");
            return users;
        }


        /// <summary>
        /// Adds new user 
        /// </summary>
        /// <param name="user">UserEntity type</param>
        /// <returns>Success/Failure Message</returns>
        [HttpPost]
        [Route("api/user/create")]
        [ResponseType(typeof(string))]
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
                string[] str = ModelState.Keys.SelectMany(k => ModelState[k].Errors)
                              .Select(m => m.ErrorMessage).ToArray();
                return BadRequest(string.Join(" | ",str));
            }
        }

       
    }
}