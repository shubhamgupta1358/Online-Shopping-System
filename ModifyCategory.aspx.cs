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
    public partial class ModifyCategory : System.Web.UI.Page
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
            String query = "select * from Category";
            adp = new SqlDataAdapter(query, conn);
            adp.Fill(dt);
            cb = new SqlCommandBuilder(adp);
            if (!IsPostBack)
            {
                Bind();
            }
        }

        protected void Bind()
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataRow[] dr = dt.Select("C_id=" + Convert.ToInt32(((Literal)GridView1.Rows[e.RowIndex].FindControl("Literal1")).Text));
            dr[0].Delete();
            adp.Update(dt);
            Response.Write("<script>alert('Category name is deleted Successfully')</script>");
            Bind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            Bind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            Bind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                DataRow[] dr = dt.Select("C_id=" + Convert.ToInt32(((Literal)GridView1.Rows[e.RowIndex].FindControl("Literal1")).Text));
                dr[0][1] = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
                adp.Update(dt);
                GridView1.EditIndex = -1;
                Bind();
            }
            catch (Exception)
            {
                Response.Write("Please Enter Valid Data");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Bind();
        }
    }
}