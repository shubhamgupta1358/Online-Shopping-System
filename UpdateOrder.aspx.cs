using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KG
{
    public partial class UpdateOrder : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlDataAdapter adp;
        SqlCommandBuilder cb;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null || Session["Mobile"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                Bind();
            }
        }
        protected void Bind()
        {
            conn.Open();
            string query = "SELECT * FROM  Users where (Email='" + Session["Email"].ToString() + "') or (Mobile='" + Session["Mobile"].ToString() + "')";
            adp = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            cb = new SqlCommandBuilder(adp);
            foreach (DataRow dr in dt.Rows)
            {
                NameTextBox.Text = dr["Name"].ToString();
                AlternativeMobileTextBox.Text = dr["AlternativeMobile"].ToString();
                PincodeTextBox.Text = dr["Pincode"].ToString();
                StateTextBox.Text = dr["State"].ToString();
                CityTextBox.Text = dr["City"].ToString();
                AddressTextBox.Text = dr["Address"].ToString();
            }
            conn.Close();
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            conn.Open();
            string update = "update Users set Name='" + NameTextBox.Text + "',AlternativeMobile='" + AlternativeMobileTextBox.Text + "',Pincode='" + PincodeTextBox.Text + "',State='" + StateTextBox.Text + "',City='" + CityTextBox.Text + "',Address='" + AddressTextBox.Text + "' where (Email='" + Session["Email"].ToString() + "') or (Mobile='" + Session["Mobile"].ToString() + "')";
            SqlCommand cmd = new SqlCommand(update, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            Response.Redirect("PaymentGateway.aspx");
        }
    }
}