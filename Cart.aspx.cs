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
        decimal TotalAmount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            userName = User.Identity.Name;
            usrname.Value = userName;
            strConn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
             CartItems.ItemDataBound += new DataListItemEventHandler(this.CartItems_ItemDataBound);

            if (!IsPostBack)
            {
                Load_Cart(userName);

            }




        }

        protected void Load_Cart(string usrName)
        {

            SqlCart.SelectCommand = "SELECT * FROM [dbo].[vw_nthing_CartProducts] where UserName = '" + usrName + "'";
            SqlCart.DataBind();
            CartItems.DataSource = SqlCart;
            CartItems.DataBind();


        }

        private void CartItems_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = e.Item.DataItem as DataRowView;
                if (drv != null)
                {
                    TotalAmount += Convert.ToDecimal(DataBinder.Eval(e.Item.DataItem, "ProductAmount"));
                }
                TotalLabel.Text ="Your cart total amount is : € " + TotalAmount.ToString("##,###0.00");
            }
        }

        protected void EmptyCartBtn_ServerClick(object sender, EventArgs e)
        {
            
            SqlConnection cnn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("Delete from  [dbo].[nthing_Store_Order]  where [UserName] = '" + userName + "'", cnn);
            cnn.Open();
            string retval = cmd.ExecuteScalar().ToString();
            cnn.Close();

            Load_Cart(userName);
        }
    }
}