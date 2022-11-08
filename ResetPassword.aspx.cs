using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace KG
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        DataTable dt = new DataTable();
        int U_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            string FP_id = Request.QueryString["FP_id"];
            if (FP_id != null)
            {
                string query = "select * from ForgotPassword where FP_id='" + FP_id + "'";
                SqlDataAdapter adp = new SqlDataAdapter(query, conn);
                adp.Fill(dt);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                if (dt.Rows.Count != 0)
                {
                    PasswordTextBox.Visible = true;
                    ConfirmPasswordTextBox.Visible = true;
                    ResetButton.Visible = true;
                }
                else
                {
                    Label1.Text = "Your password reset link is expired or invalid!";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
            }
            if (IsPostBack)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Password reset successfully done!');window.location.href='Login.aspx';", true);
            }
        }
        protected void ResetButton_Click(object sender, EventArgs e)
        {
            U_id = Convert.ToInt32(dt.Rows[0][1]);
            string query1 = "update Users set Password='" + PasswordTextBox.Text + "' where U_id='" + U_id + "'";
            conn.Open();
            SqlCommand cmd = new SqlCommand(query1, conn);
            cmd.ExecuteNonQuery();            
            conn.Close();

        }
    }
}