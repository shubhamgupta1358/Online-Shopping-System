using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Security.Cryptography;

namespace KG
{
    public partial class PaymentSuccess : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlCommandBuilder cb;
        string[] a = new string[7];
        string OD_id;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null || Session["Mobile"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            Bind();
            if (!IsPostBack)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Your order has been successfully placed!');window.location.href='Default.aspx';", true);
            }
        }
        protected void Bind()
        {
            conn.Open();
            string query = "SELECT * FROM  Users where (Email='" + Session["Email"].ToString() + "') or (Mobile='" + Session["Mobile"].ToString() + "')";
            SqlDataAdapter adp = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            cb = new SqlCommandBuilder(adp);
            foreach (DataRow dr in dt.Rows)
            {
                string insert = "insert into DeliveryDetails values('" + dr["Name"].ToString() + "','" + dr["Email"].ToString() + "','" + dr["Mobile"].ToString() + "','" + dr["AlternativeMobile"].ToString() + "','" + dr["Pincode"].ToString() + "','" + dr["City"].ToString() + "','" + dr["State"].ToString() + "','" + dr["Address"].ToString() + "')";
                SqlCommand cmd = new SqlCommand(insert, conn);
                cmd.ExecuteNonQuery();
            }

            string query1 = "SELECT top 1 * FROM  DeliveryDetails where ((Email='" + Session["Email"].ToString() + "') or (Mobile='" + Session["Mobile"].ToString() + "')) order by DA_id desc";
            SqlDataAdapter adp1 = new SqlDataAdapter(query1, conn);
            DataTable dt1 = new DataTable();
            adp1.Fill(dt1);
            cb = new SqlCommandBuilder(adp1);
            foreach (DataRow dr1 in dt1.Rows)
            {
                OD_id = dr1["DA_id"].ToString();
            }

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
                        a[j] = ItemPropertyArray[j].ToString();
                    }
                    string insert1 = "insert into OrderDetails values('" + OD_id.ToString() + "','" + a[0].ToString() + "','" + a[2].ToString() + "','" + a[4].ToString() + "','" + a[5].ToString() + "','" + a[3].ToString() + "')";
                    SqlCommand cmd1 = new SqlCommand(insert1, conn);
                    cmd1.ExecuteNonQuery();                   
                }
            }
            conn.Close();

            
            Response.Cookies["CartItem"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["CartItem"].Expires = DateTime.Now.AddDays(-1);           
        }
    }
}