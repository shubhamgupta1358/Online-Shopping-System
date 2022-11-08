using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KG
{
    public partial class UserViewOrder : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlDataAdapter adp;
        DataTable dt = new DataTable();
        SqlCommandBuilder cb;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null || Session["Mobile"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            int DA_id = Convert.ToInt32(Request.QueryString["DA_id"]);
            String query = "select * from OrderDetails where OD_id='" + DA_id + "'";
            adp = new SqlDataAdapter(query, conn);
            adp.Fill(dt);
            cb = new SqlCommandBuilder(adp);
            if (!IsPostBack)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}