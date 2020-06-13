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
         

            strConn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            Load_Product(calledID);
            prodgui.Value = calledID;
            userName = User.Identity.Name;
            usrname.Value = userName;

            Load_Cart(userName);

            if (!IsPostBack)
            {
                
                SqlConnection cnn = new SqlConnection(strConn);
                SqlCommand cmd = new SqlCommand("SELECT Price FROM [dbo].[nthing_Store_Product] where ProductGuid = '" + calledID + "'", cnn);
                SqlCommand cmd2 = new SqlCommand("SELECT UserName FROM [dbo].[vw_nthing_UsrProducts] where ProductGuid = '" + calledID + "'", cnn);

                cnn.Open();
                string retval = cmd.ExecuteScalar().ToString();
                string produsr = cmd2.ExecuteScalar().ToString();

                cnn.Close();

               prodPrice.Value = retval;
               Produsrname.Value = produsr;
            }


        }

        protected void Load_Product(string pguid)
        {

            SqlProduct.SelectCommand = "SELECT * FROM [dbo].[vw_nthing_UsrProducts] where ProductGuid = '" + pguid + "'";
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

            Load_Cart(userName);

            SqlConnection cnn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("SELECT ProductId FROM [dbo].[nthing_Store_Product] where ProductGuid = '" + prodgui.Value + "'", cnn);
            cnn.Open();
            string retval = cmd.ExecuteScalar().ToString();
            cnn.Close();
            prodId.Value = retval;

          

            SqlRelated.SelectCommand = "SELECT * FROM [dbo].[vw_nthing_Crossell] where ProductId = " + int.Parse (prodId.Value) ;
            SqlRelated.DataBind();
            RelatedList.DataSource = SqlRelated;
            RelatedList.DataBind();

                prodgui.Value = "";
                usrname.Value = "";
                prodAmnt.Value = "";
        }

       

        protected void ReviewBtn_ServerClick(object sender, EventArgs e)
        {
            string prodUsrName;
            prodUsrName = Produsrname.Value;

            string rev;
            rev = reviewTxt.Value.Replace("'", "");

            if (string.IsNullOrEmpty(rev)){
                rev = "No comment";
            }


            int star=1;
            star =int.Parse(UsrStar.Value);



            SqlConnection cnn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("INSERT INTO [dbo].[nthing_Store_userRating]([UserName],[Rating],[UserReview]) values('" + prodUsrName + "'," + star + ",'" + rev + "')", cnn);
            SqlCommand cmd2 = new SqlCommand("SELECT abs(AVG([Rating])) as rating FROM [datanthing].[dbo].[nthing_Store_userRating] where [UserName] = '" + prodUsrName + "'", cnn);
            SqlCommand cmd22 = new SqlCommand("SELECT count([Rating]) as reviews FROM [datanthing].[dbo].[nthing_Store_userRating] where [UserName] = '" + prodUsrName + "'", cnn);


            cnn.Open();
            cmd.ExecuteNonQuery();

            int avgRate;
            avgRate = int.Parse(cmd2.ExecuteScalar().ToString());
            int reviews;
            reviews = int.Parse(cmd22.ExecuteScalar().ToString());
            SqlCommand cmd3 = new SqlCommand("Update [dbo].[AspNetUsers] Set [UserRating] = " + avgRate  + ",[UserReviews] =" + reviews  + " where [UserName] = '" + prodUsrName + "'", cnn);
            cmd3.ExecuteNonQuery();

           cnn.Close();

        }
    }
}