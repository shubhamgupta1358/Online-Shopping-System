using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KG
{
    public partial class UserMasterPage : System.Web.UI.MasterPage
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlDataAdapter adp;
        SqlCommandBuilder cb;
        SqlCommand cmd;
        string query;
        int ItemCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            BindCartCount();
            BindCategory();
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
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

        protected void BindCartCount()
        {
            if (Request.Cookies["CartItem"] != null)
            {
                String Items = Convert.ToString(Request.Cookies["CartItem"].Value);
                string[] ItemsArray = Items.Split('|');
                for (int i = 0; i < ItemsArray.Length; i++)
                {
                    string ItemProperty = Convert.ToString(ItemsArray[i].ToString());
                    string[] ItemPropertyArray = ItemProperty.Split('/');
                    for (int j = 0; j < ItemPropertyArray.Length; j++)
                    {
                    }
                    ItemCount = ItemCount + 1;
                    Label1.Text = ItemCount.ToString();
                }

            }
        }
        protected void BindCategory()
        {
            string query = "select * from Category";
            adp = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            cb = new SqlCommandBuilder(adp);
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        protected void SubscribeButton_Click(object sender, EventArgs e)
        {
            query = "select * from Subscribers where S_Email='" + EmailTextBox.Text + "'";
            adp = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Response.Write("<script>alert('Email is already exists!')</script>");
            }
            else
            {
                query = "insert into Subscribers(S_Email) values('" + EmailTextBox.Text + "')";
                cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Thank you for subscribe!')</script>");
                conn.Close();
            }
        }

    }
}