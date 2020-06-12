using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace nthing
{
    public partial class categories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string callName;
            callName = Request.Params["cname"];
            catLabel .Text = callName;

            string callcat;
            callcat = Request.Params["cid"];

            int catid;
            catid = int.Parse(callcat);
            Load_Category(catid);
        }

        protected void Load_Category(int catid)
        {

             SqlProduct.SelectCommand = "SELECT * FROM [dbo].[vw_nthing_CatProducts] where CategoryId = " + catid;
             SqlProduct.DataBind();
             CategoryItems.DataSource = SqlProduct;
             CategoryItems.DataBind();

        }

    }
}