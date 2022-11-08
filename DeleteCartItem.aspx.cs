using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace KG
{
    public partial class DeleteCartItem : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string P_Name, Size, ItemQuantity, Price, SellingPrice, P_Image;
        string[] a = new string[7];
        int count = 0;
        int id;
        int ItemQty;

        protected void Page_Load(object sender, EventArgs e)
        {
            Bind();
        }

        protected void Bind()
        {
            int P_id = Convert.ToInt32(Request.QueryString["P_id"].ToString());
            DataTable dt = new DataTable();
            dt.Rows.Clear();
            dt.Columns.AddRange(new DataColumn[8] { new DataColumn("P_Name"), new DataColumn("Price"), new DataColumn("SellingPrice"), new DataColumn("Size"), new DataColumn("ItemQuantity"), new DataColumn("P_Image"), new DataColumn("P_id"), new DataColumn("id")});
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
                    dt.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), a[3].ToString(), a[4].ToString(), a[5].ToString(), a[6].ToString(), i.ToString());
                }
            }
            count = 0;
            foreach (DataRow dr in dt.Rows)
            {
                if (count == id)
                {
                    P_id = Convert.ToInt32(dr["P_id"].ToString());
                    ItemQty = Convert.ToInt32(dr["ItemQuantity"].ToString());
                }
                count = count + 1;
            }
            count = 0;
            conn.Open();
            string query = "update Products set Quantity=Quantity+" + ItemQty + "where P_id=" + P_id;
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();
            conn.Close();

            dt.Rows.RemoveAt(id);

            Response.Cookies["CartItem"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["CartItem"].Expires = DateTime.Now.AddDays(-1);

            foreach (DataRow dr in dt.Rows)
            {
                P_Name = dr["P_Name"].ToString();
                Price = dr["Price"].ToString();
                SellingPrice = dr["SellingPrice"].ToString();
                Size = dr["Size"].ToString();
                ItemQuantity = dr["ItemQuantity"].ToString();
                P_Image = dr["P_Image"].ToString();
                P_id = Convert.ToInt32(dr["P_id"].ToString());

                count = count + 1;                
                if (count == 1)
                {
                    Response.Cookies["CartItem"].Value = P_Name.ToString() + "/" + Price.ToString() + "/" + SellingPrice.ToString() + "/" + Size.ToString() + "/" + ItemQuantity.ToString() + "/" + P_Image.ToString() + "/" + P_id.ToString();
                    Response.Cookies["CartItem"].Expires = DateTime.Now.AddDays(1);
                }
                else
                {
                    Response.Cookies["CartItem"].Value = Request.Cookies["CartItem"].Value + "|" + P_Name.ToString() + "/" + Price.ToString() + "/" + SellingPrice.ToString() + "/" + Size.ToString() + "/" + ItemQuantity.ToString() + "/" + P_Image.ToString() + "/" + P_id.ToString();
                    Response.Cookies["CartItem"].Expires = DateTime.Now.AddDays(1);
                }
            }
            Response.Redirect("ShoppingCart.aspx");
        }
    }
}