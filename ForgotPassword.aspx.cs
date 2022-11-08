using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Web.Configuration;

namespace KG
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            string query = "select * from Users where Email='" + EmailTextBox.Text + "'";
            SqlDataAdapter adp = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                string FP_id = Guid.NewGuid().ToString();
                int U_id = Convert.ToInt32(dt.Rows[0][0]);
                string query1 = "insert into ForgotPassword(FP_id,U_id,RequestDateTime) values('" + FP_id + "','" + U_id + "',GETDATE())";
                conn.Open();
                SqlCommand cmd = new SqlCommand(query1, conn);
                cmd.ExecuteNonQuery();
                conn.Close();

                //Send reset link via email
                string to = dt.Rows[0][2].ToString(); //To address    
                string from = "kggrocerystore@gmail.com"; //From address    
                MailMessage message = new MailMessage(from, to);
                string username = dt.Rows[0][1].ToString();
                string mailbody = "Hi " + username + ",<br/><br/>Click the link below to reset your password:<br/>http://localhost:62781/ResetPassword.aspx?FP_id=" + FP_id;
                message.Subject = "Reset Password";
                message.Body = mailbody;
                message.BodyEncoding = Encoding.UTF8;
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
                System.Net.NetworkCredential basicCredential1 = new
                System.Net.NetworkCredential("kggrocerystore@gmail.com", "hvriurruqbhrbazp");
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = basicCredential1;
                try
                {
                    client.Send(message);
                }

                catch (Exception ex)
                {
                    throw ex;
                }
                //---

                Label1.Text = "Reset link send on your email!";
                Label1.ForeColor = System.Drawing.Color.Green;
                EmailTextBox.Text = string.Empty;
            }
            else
            {
                Label1.Text = "Email doesn't exist!";
                Label1.ForeColor = System.Drawing.Color.Red;
                EmailTextBox.Text = string.Empty;
                EmailTextBox.Focus();
            }
        }
    }
}