using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KG
{
    public partial class AdminMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            if (Session["Email"] != null || Session["Mobile"] != null)
            {
                Session["Email"] = null;
                Session["Mobile"] = null;
                Response.Redirect("Login.aspx");
            }
        }
    }
}