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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            EmailTextBox.Focus();
            if (!IsPostBack)
            {
                if (Request.Cookies["U_Email"] != null && Request.Cookies["U_Mobile"] != null && Request.Cookies["U_Password"] != null)
                {
                    EmailTextBox.Text = Request.Cookies["U_Email"].Value;
                    MobileTextBox.Attributes["value"] = Request.Cookies["U_Mobile"].Value;
                    PasswordTextBox.Attributes["value"] = Request.Cookies["U_Password"].Value;
                    CheckBox2.Checked = true;
                }
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {

            string query = "select * from Users where (Email='" + EmailTextBox.Text + "'or Mobile='" + MobileTextBox.Text + "')and Password='" + PasswordTextBox.Text + "'and Status='1'";
            SqlDataAdapter adp = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                if (CheckBox2.Checked)
                {
                    Response.Cookies["U_Email"].Value = EmailTextBox.Text;
                    Response.Cookies["U_Mobile"].Value = MobileTextBox.Text;
                    Response.Cookies["U_Password"].Value = PasswordTextBox.Text;
                    Response.Cookies["U_Email"].Expires = DateTime.Now.AddDays(30);
                    Response.Cookies["U_Mobile"].Expires = DateTime.Now.AddDays(30);
                    Response.Cookies["U_Password"].Expires = DateTime.Now.AddDays(30);
                }
                else
                {
                    Response.Cookies["U_Email"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["U_Mobile"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["U_Password"].Expires = DateTime.Now.AddDays(-1);

                }
                string Utype;
                Utype = dt.Rows[0][10].ToString();
                if (Utype == "User")
                {
                    if (Session["PlaceOrderButton"] == null)
                    {
                        Session["Email"] = EmailTextBox.Text;
                        Session["Mobile"] = MobileTextBox.Text;
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        Session["Email"] = EmailTextBox.Text;
                        Session["Mobile"] = MobileTextBox.Text;
                        Response.Redirect("UpdateOrder.aspx");
                    }

                }
                if (Utype == "Admin")
                {
                    Session["Email"] = EmailTextBox.Text;
                    Session["Mobile"] = MobileTextBox.Text;
                    Response.Redirect("AdminHome.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Data not matched!')</script>");
            }
            conn.Close();
        }
    }
}