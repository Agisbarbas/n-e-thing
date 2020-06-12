using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace nthing
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Load_Latest();
            }

                
        }

        protected void Load_Latest()
        {

            SqlLatest.SelectCommand = "SELECT TOP (5) * FROM [dbo].[nthing_Store_Product] order by [CreatedOn] desc";
            SqlLatest.DataBind();
            LatestListedItems.DataSource = SqlLatest;
            LatestListedItems.DataBind();

        }


    }
}