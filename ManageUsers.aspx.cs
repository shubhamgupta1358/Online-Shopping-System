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
    public partial class ManageUsers : System.Web.UI.Page
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
            String query = "select * from Users";
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

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataRow[] dr = dt.Select("U_id=" + Convert.ToInt32(((Literal)GridView1.Rows[e.RowIndex].FindControl("Literal1")).Text));
            dr[0].Delete();
            adp.Update(dt);
            Response.Write("<script>alert('User data is deleted Successfully')</script>");
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
                DataRow[] dr = dt.Select("U_id=" + Convert.ToInt32(((Literal)GridView1.Rows[e.RowIndex].FindControl("Literal1")).Text));
                dr[0][10] = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1")).Text;
                dr[0][11] = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2")).Text;
                adp.Update(dt);
                GridView1.EditIndex = -1;
                Bind();           
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Bind();
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            if (SearchTextBox.Text != "")
            {
                String query = "select * from Users where Name LIKE'%" + SearchTextBox.Text + "%' or Email LIKE'%" + SearchTextBox.Text + "%' or Mobile LIKE'%" + SearchTextBox.Text + "%'or UserType LIKE'%" + SearchTextBox.Text + "%'or Status LIKE'%" + SearchTextBox.Text + "%'";
                adp = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                cb = new SqlCommandBuilder(adp);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Please Enter Data')</script>");
            }

        }
    }
}