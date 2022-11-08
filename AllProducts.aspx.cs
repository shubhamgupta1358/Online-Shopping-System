using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.CompilerServices;

namespace KG
{
    public partial class AllProducts : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlDataAdapter adp;
        DataTable dt = new DataTable();
        SqlCommandBuilder cb;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bind();
            }
        }

        protected void Bind()
        {
            if (Request.QueryString["C_id"] == null)
            {
                cmd = new SqlCommand("Proc_AllProducts", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                adp = new SqlDataAdapter(cmd);
            }
            else
            {
                String query = "SELECT a.*, b.*, c.*,a.Price-a.SellingPrice as Discount FROM  Products a INNER JOIN Brands b ON b.B_id = a.B_id INNER JOIN Pack_Sizes c ON c.PS_id = a.PS_id where C_id='" + Request.QueryString["C_id"].ToString() + "'";
                adp = new SqlDataAdapter(query, conn);
            }
            if(Request.QueryString["C_id"] == null && Request.QueryString["Search"] != null)
            {
                String query = "SELECT a.*, b.*, c.*,a.Price-a.SellingPrice as Discount FROM  Products a INNER JOIN Brands b ON b.B_id = a.B_id INNER JOIN Pack_Sizes c ON c.PS_id = a.PS_id where P_Name like('%" + Request.QueryString["Search"].ToString() + "%')";
                adp = new SqlDataAdapter(query, conn);
            }
            adp.Fill(dt);
            cb = new SqlCommandBuilder(adp);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
        }
    }
}