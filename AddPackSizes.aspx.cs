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
    public partial class AddPackSizes : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query;
        SqlCommand cmd;
        SqlDataAdapter adp;
        SqlCommandBuilder cb;

        protected void AddButton_Click(object sender, EventArgs e)
        {

            query = "select * from Pack_Sizes where Size='" + PackSizeTextBox.Text + "'";
            adp = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Response.Write("<script>alert('Pack Size is already exists!')</script>");

            }
            else
            {
                query = "insert into Pack_Sizes(Size) values('" + PackSizeTextBox.Text + "')";
                cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Pack Size is successfully added!')</script>");
                PackSizeTextBox.Text = String.Empty;
                conn.Close();
                Response.AddHeader("refresh", "0");
            }
            PackSizeTextBox.Focus();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null || Session["Mobile"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            PackSizeTextBox.Focus();
            if (!IsPostBack)
            {
                Gridview();               
            }
        }

        protected void Gridview()
        {
            String query = "select * from Pack_Sizes";
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