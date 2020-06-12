using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace nthing
{
    public partial class product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string calledID;
            calledID = Request.Params["pid"];
            Load_Product(calledID);
        }

        protected void Load_Product(string pguid)
        {

            SqlProduct.SelectCommand = "SELECT * FROM [dbo].[nthing_Store_Product] where ProductGuid = '" + pguid + "'";
            SqlProduct.DataBind();
            ProductView.DataSource = SqlProduct;
            ProductView.DataBind();

        }

    }
}