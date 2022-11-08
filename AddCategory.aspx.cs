using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KG
{
    public partial class AddCategory : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query;
        SqlCommand cmd;
        SqlDataAdapter adp;
        SqlCommandBuilder cb;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null || Session["Mobile"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            CategoryTextBox.Focus();
            if (!IsPostBack)
            {
                Gridview();
            }
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            query = "select * from Category where C_Name='" + CategoryTextBox.Text + "'";
            adp = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Response.Write("<script>alert('Category name is already exists!')</script>");
            }
            else
            {
                query = "insert into Category(C_Name) values('" + CategoryTextBox.Text + "')";
                conn.Open();
                cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();
                CategoryTextBox.Text = String.Empty;
                conn.Close();
                Response.Write("<script>alert('Category name is successfully added!')</script>");
                Response.AddHeader("refresh", "0");
            }
            CategoryTextBox.Focus();
        }

        protected void Gridview()
        {
            String query = "select * from Category";
            adp = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            cb = new SqlCommandBuilder(adp);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Gridview();
        }
    }
}