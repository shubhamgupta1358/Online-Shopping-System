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
    public partial class AddSubCategory : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query;
        SqlCommandBuilder cb;
        SqlCommand cmd;
        SqlDataAdapter adp;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null || Session["Mobile"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            SubCategoryTextBox.Focus();
            if (!IsPostBack)
            {
                Gridview();
                BindCategory();
            }
        }
        void BindCategory()
        {
            query = "select * from Category";
            adp = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                DropDownList2.DataSource = dt;
                DropDownList2.DataTextField = "C_Name";
                DropDownList2.DataValueField = "C_id";
                DropDownList2.DataBind();
                ListItem L = new ListItem("Select Category", "-1");
                L.Selected = true;
                DropDownList2.Items.Insert(0, L);
            }
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            try
            {
                query = "select * from Sub_Category where SC_Name='" + SubCategoryTextBox.Text + "'";
                adp = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script>alert('SubCategory is already exists!')</script>");
                }
                else
                {
                    query = "insert into Sub_Category(SC_Name,C_id) values('" + SubCategoryTextBox.Text + "','" + DropDownList2.SelectedItem.Value + "')";
                    cmd = new SqlCommand(query, conn);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('SubCategory is successfully added!')</script>");
                    SubCategoryTextBox.Text = String.Empty;
                    conn.Close();
                    DropDownList2.ClearSelection();
                    Response.AddHeader("refresh", "1");
                }
                SubCategoryTextBox.Focus();
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Invalid input!')</script>");
            }
        }

        void Gridview()
        {
            query = "select A.*,b.* from Category A inner join Sub_Category B on B.C_id=A.C_id";
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