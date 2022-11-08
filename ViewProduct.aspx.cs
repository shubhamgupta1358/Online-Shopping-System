using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.EnterpriseServices;
using System.Reflection;
using System.Security.Cryptography;
using System.Data.SqlTypes;
using System.Xml.Linq;
using System.Diagnostics;
using System.Drawing;
using static System.Net.Mime.MediaTypeNames;
using System.Reflection.Emit;

namespace KG
{
    public partial class ViewProduct : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        SqlDataAdapter adp;
        SqlCommandBuilder cb;
        string P_Name, Size, Quantity, Price, SellingPrice, P_Image;
        int Qty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["P_id"] != null)
            {
                Bind();
            }
            else
            {
                Response.Redirect("AllProducts.aspx");
            }
            int P_id = Convert.ToInt32(Request.QueryString["P_id"]);
            Qty = GetQuantity(P_id);
            if (Qty == 0)
            {
                Label2.Visible = false;
                ItemQuantityTextBox.Visible = false;
                AddToCartButton.Visible = false;
                Label1.Text = "Out of Stock!";
            }
        }

        protected void Bind()
        {
            int P_id = Convert.ToInt32(Request.QueryString["P_id"]);
            conn.Open();
            String query = "SELECT a.*, b.*, c.*, a.Price-a.SellingPrice as Discount FROM  Products a INNER JOIN Brands b ON b.B_id = a.B_id INNER JOIN Pack_Sizes c ON c.PS_id = a.PS_id where P_id='" + P_id + "'";
            adp = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            cb = new SqlCommandBuilder(adp);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            conn.Close();
        }

        protected void AddToCartButton_Click(object sender, EventArgs e)
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            conn.Open();
            int P_id = Convert.ToInt32(Request.QueryString["P_id"]);
            String query = "SELECT a.*, b.*, c.*, a.Price-a.SellingPrice as Discount FROM  Products a INNER JOIN Brands b ON b.B_id = a.B_id INNER JOIN Pack_Sizes c ON c.PS_id = a.PS_id where P_id='" + P_id + "'";
            adp = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                P_Name = dr["P_Name"].ToString();
                Price = dr["Price"].ToString();
                SellingPrice = dr["SellingPrice"].ToString();
                Size = dr["Size"].ToString();
                Quantity = dr["Quantity"].ToString();
                P_Image = dr["P_Image"].ToString();

            }
            if (Convert.ToInt32(ItemQuantityTextBox.Text) > Convert.ToInt32(Quantity))
            {
                Label1.Text = "Only " + Quantity + " Quantity is available!";
            }
            else
            {
                Label1.Text = "";                
                if (Request.Cookies["CartItem"] == null)
                {
                    Response.Cookies["CartItem"].Value = P_Name.ToString() + "/" + Price.ToString() + "/" + SellingPrice.ToString() + "/" + Size.ToString() + "/" + ItemQuantityTextBox.Text + "/" + P_Image.ToString() + "/" + P_id.ToString();
                    Response.Cookies["CartItem"].Expires = DateTime.Now.AddDays(1);
                }
                else
                {
                    Response.Cookies["CartItem"].Value = Request.Cookies["CartItem"].Value + "|" + P_Name.ToString() + "/" + Price.ToString() + "/" + SellingPrice.ToString() + "/" + Size.ToString() + "/" + ItemQuantityTextBox.Text + "/" + P_Image.ToString() + "/" + P_id.ToString();
                    Response.Cookies["CartItem"].Expires = DateTime.Now.AddDays(1);
                }

                query = "update Products set Quantity=Quantity-" + ItemQuantityTextBox.Text + "where P_id=" + P_id;
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();
                Response.Redirect("ViewProduct.aspx?P_id="+P_id.ToString());
            }
        }
        public int GetQuantity(int P_id)
        {
            conn.Open();
            String query = "SELECT * FROM  Products where P_id='" + P_id + "'";
            adp = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                Qty = Convert.ToInt32(dr["Quantity"].ToString());
            }
            return Qty;
        }
    }
}