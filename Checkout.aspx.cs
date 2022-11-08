using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KG
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] != null || Session["Mobile"] != null)
            {
                Response.Redirect("UpdateOrder.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}