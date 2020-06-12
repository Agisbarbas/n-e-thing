using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using nthing.Models;
using System.Data;
using System.Configuration;
using System.Globalization;

namespace nthing
{
    public partial class Cart : System.Web.UI.Page
    {
        string strConn;
        string userName;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            userName = User.Identity.Name;
            usrname.Value = userName;
            Load_Cart(userName);

          

        }

        protected void Load_Cart(string usrName)
        {

            SqlCart.SelectCommand = "SELECT * FROM [dbo].[vw_nthing_CartProducts] where UserName = '" + usrName + "'";
            SqlCart.DataBind();
            CartItems.DataSource = SqlCart;
            CartItems.DataBind();

        }


    }
}