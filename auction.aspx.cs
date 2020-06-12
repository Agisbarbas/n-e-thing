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
   

    public partial class auction : System.Web.UI.Page
    {
        string strConn;
        string usrName;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            strConn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            string calledID;
            calledID = Request.Params["pid"];

            AuctionList.ItemDataBound += new DataListItemEventHandler(this.AuctionList_ItemDataBound);

            prodgui.Value = calledID;
         
            Load_Product(calledID);

            usrName = User.Identity.Name;
            usrgui.Value = usrName;
            LogName.Value = usrName;



        }

        protected void Load_Product(string pguid)
        {

            SqlProduct.SelectCommand = "SELECT * FROM [dbo].[nthing_Store_Product] where ProductGuid = '" + pguid + "'";
            SqlProduct.DataBind();
            ProductView.DataSource = SqlProduct;
            ProductView.DataBind();

            if (!Page.IsPostBack)
            {
  SqlConnection cnn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("SELECT FORMAT ([AuctEndTime], 'MM dd yyyy HH:mm:ss') as AuctEnd FROM [dbo].[nthing_Store_Product] where ProductGuid = '" + pguid + "'", cnn);
            cnn.Open();
            string retval = cmd.ExecuteScalar().ToString();
            cnn.Close();

           HidendDateLab.Value = retval;

            }

          

        }

        protected void Load_Auction(string pguid)
        {

            SqlAuction.SelectCommand = "SELECT * FROM [dbo].[nthing_Auction_Trans] where productGuid = '" + pguid + "'";
            SqlAuction.DataBind();
         

        }

        protected void UpdateTimer_Tick(object sender, EventArgs e)
        {
            SqlAuction.DataBind();
            AuctionList.DataBind();
        }

        private void AuctionList_ItemDataBound(object sender, DataListItemEventArgs e) 
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = e.Item.DataItem as DataRowView;
                if (drv != null)
                {
                    string userid = drv.Row["usrid"].ToString();
                    Label ListLabel = (Label)e.Item.FindControl("listmess");

                    if (usrName == userid)
                    {
                        ListLabel.ForeColor = System.Drawing.Color.Red;
                      ListLabel.Text = "your bid";
                    }else
                    {
                        ListLabel.ForeColor = System.Drawing.Color.Black;
                        ListLabel.Text = "";
                    }
                }
            }
        }


        protected void btnInsert_Click(object sender, EventArgs e)
        {
            MessLabel.Text = "";
            SqlAuction.InsertCommandType = SqlDataSourceCommandType.Text;
            double bidamount;

            bidtxt.Value = bidtxt.Value.Replace(".", ",");
            bidamount = double.Parse (bidtxt.Value) *100 ;
            bidbid.Value = bidamount.ToString();


            if (bidamount > double.Parse (hgstBid.Value))
            {
             hgstBid.Value = bidamount.ToString();
             SqlAuction.Insert();
                MessLabel.Text = "Your bid is the highest for the moment...";
                hgstBider.Value = usrName;
                bidtxt.Value = "";
            }
            else
            {
                MessLabel.Text = "Please place a higher bid!";
            }


           
           

           
        }

    }
}