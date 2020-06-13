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
    public partial class AccInfo : System.Web.UI.Page
    {
        string strConn;
        string usrName;
        protected void Page_Load(object sender, EventArgs e)
        {
            strConn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            usrName = User.Identity.Name.ToString();
            if (!IsPostBack)
            {
            usrLabel.Text = usrName.ToString();
            Load_Rating(usrName);
            Load_Category(usrName);
            }
                         
        }

        protected void Load_Rating(string usr)
        {

            SqlRate.SelectCommand = "SELECT * FROM [dbo].[nthing_Store_userRating] where UserName = '" + usr + "'";
            SqlRate.DataBind();
            ReviewsList.DataSource = SqlRate;
            ReviewsList.DataBind();

        }

        protected void Load_Category(string usr)
        {
            SqlProduct.SelectCommand = "SELECT * FROM [dbo].[vw_nthing_UsrProducts] where UserName = '" + usr + "'";
            SqlProduct.DataBind();
            CategoryItems.DataSource = SqlProduct;
            CategoryItems.DataBind();

        }
    }
}
