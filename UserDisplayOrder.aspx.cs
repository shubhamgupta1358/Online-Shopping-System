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
    public partial class UserDisplayOrder : System.Web.UI.Page
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
            String query = "select * from DeliveryDetails where (Email='" + Session["Email"].ToString() + "') or (Mobile='" + Session["Mobile"].ToString() + "')order by DA_id desc";
            adp = new SqlDataAdapter(query, conn);
            adp.Fill(dt);
            cb = new SqlCommandBuilder(adp);
            if (!IsPostBack)
            {
                Bind();
            }
        }

        void Bind()
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Bind();
        }
    }
}