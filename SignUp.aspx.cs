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
    public partial class SignUp : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string query;
        SqlCommand cmd;
        SqlDataAdapter adp;
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            NameTextBox.Focus();
            if (IsPostBack)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Your account is created!');window.location.href='Login.aspx';", true);
            }
        }
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            query = "select * from Users where Email='" + EmailTextBox.Text + "'or Mobile='" + MobileTextBox.Text + "'";
            adp = new SqlDataAdapter(query, conn);
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Response.Write("<script>alert('Email or Mobile Number is already exists!')</script>");
            }
            else
            {
                query = "insert into Users(Name,Email,Mobile,AlternativeMobile,Password,Pincode,City,State,Address,UserType) values('" + NameTextBox.Text + "','" + EmailTextBox.Text + "','" + MobileTextBox.Text + "','" + AlternativeMobileTextBox.Text + "','" + PasswordTextBox.Text + "','" + PincodeTextBox.Text + "','" + CityTextBox.Text + "','" + StateTextBox.Text + "','" + AddressTextBox.Text + "','User')";
                cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            NameTextBox.Focus();
        }
    }
}