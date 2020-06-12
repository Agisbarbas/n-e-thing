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
    public partial class product : System.Web.UI.Page
    {

        string strConn;
        string userName;

        protected void Page_Load(object sender, EventArgs e)
        {
            string calledID;
            calledID = Request.Params["pid"];
            Load_Product(calledID);

            prodgui.Value = calledID;
            userName = User.Identity.Name;
            usrname.Value = userName;
             Load_Cart(userName);

            strConn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            if (!Page.IsPostBack)
            {
                SqlConnection cnn = new SqlConnection(strConn);
                SqlCommand cmd = new SqlCommand("SELECT Price FROM [dbo].[nthing_Store_Product] where ProductGuid = '" + calledID + "'", cnn);
                cnn.Open();
                string retval = cmd.ExecuteScalar().ToString();
                cnn.Close();

                prodPrice.Value = retval;

            }


        }

        protected void Load_Product(string pguid)
        {

            SqlProduct.SelectCommand = "SELECT * FROM [dbo].[nthing_Store_Product] where ProductGuid = '" + pguid + "'";
            SqlProduct.DataBind();
            ProductView.DataSource = SqlProduct;
            ProductView.DataBind();

        }
        protected void Load_Cart(string usrName)
        {

            SqlCart.SelectCommand = "SELECT * FROM [dbo].[vw_nthing_CartProducts] where UserName = '" + usrName + "'";
            SqlCart.DataBind();
            CartItems.DataSource = SqlCart;
            CartItems.DataBind();

        }

        protected void UpdateTimer_Tick(object sender, EventArgs e)
        {
            SqlCart.DataBind();
            CartItems.DataBind();
        }

      

        protected void addcartBtn_ServerClick(object sender, EventArgs e)
        {
                    

            double pramount;
            pramount = double.Parse(prodPrice.Value) * 100;
            prodAmnt.Value = pramount.ToString();

            MessLabel.Text = "";
            SqlCart.InsertCommandType = SqlDataSourceCommandType.Text;
           SqlCart.Insert();
            MessLabel.Text = "Product added to your cart!";

         

            SqlConnection cnn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("SELECT ProductId FROM [dbo].[nthing_Store_Product] where ProductGuid = '" + prodgui.Value + "'", cnn);
            cnn.Open();
            string retval = cmd.ExecuteScalar().ToString();
            cnn.Close();
            prodId.Value = retval;

   prodgui.Value = "";
            usrname.Value = "";
            prodAmnt.Value = "";

            SqlRelated.SelectCommand = "SELECT * FROM [dbo].[vw_nthing_Crossell] where ProductId = " + int.Parse (prodId.Value) ;
            SqlRelated.DataBind();
            RelatedList.DataSource = SqlRelated;
            RelatedList.DataBind();


        }
    }
}