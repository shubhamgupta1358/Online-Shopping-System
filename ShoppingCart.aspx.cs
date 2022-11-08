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
    public partial class ShoppingCart : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        string[] a = new string[7];
        Double TotalAmount = 0;
        int ItemCount = 0;
        Double TotalDiscount = 0;
        Double TotalPrice = 0;        
        DataTable dt = new DataTable();


        protected void Page_Load(object sender, EventArgs e)
        {            
                BindCartItem();            
        }
        protected void BindCartItem()
        {
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

                    TotalPrice = TotalPrice + (Convert.ToDouble(a[1].ToString()) * Convert.ToDouble(a[4].ToString()));

                TotalDiscount = TotalDiscount + ((Convert.ToDouble(a[1].ToString()) - Convert.ToDouble(a[2].ToString())) * Convert.ToDouble(a[4].ToString()));

                    TotalAmount = TotalAmount + (Convert.ToDouble(a[2].ToString()) * Convert.ToDouble(a[4].ToString()));

                    ItemCount = ItemCount + 1;
                    Label2.Text = ItemCount.ToString();
                    Label4.Text = ItemCount.ToString();
                }
            }
            DataList1.DataSource = dt;
            DataList1.DataBind();

            Label1.Text = TotalPrice.ToString();
            Label3.Text = TotalAmount.ToString();
            Label5.Text = TotalDiscount.ToString();

        }
        protected void PlaceOrderButton_Click(object sender, EventArgs e)
        {
            int i = Convert.ToInt32(dt.Rows.Count.ToString());
            if (i == 0)
            {
                Response.Write("<script>alert('Your cart is empty!')</script>");
            }
            else
            {
                Session["PlaceOrderButton"] = "yes";
                Response.Redirect("Checkout.aspx");
            }
        }
    }
}