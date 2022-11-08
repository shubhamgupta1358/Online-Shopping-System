using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Collections;

namespace KG
{
    public partial class AddProduct : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);

        SqlCommand cmd;
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
                BindCategory();
                BindBrand();
                BindPackSize();
                Gridview();

            }
        }
        void BindCategory()
        {
            string query = "select * from Category";
            adp = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                DropDownList1.DataSource = dt;
                DropDownList1.DataTextField = "C_Name";
                DropDownList1.DataValueField = "C_id";
                DropDownList1.DataBind();
                ListItem L = new ListItem("Select Category", "-1");
                L.Selected = true;
                DropDownList1.Items.Insert(0, L);
            }
            else
            {
                Response.Write("<script>alert('Category is not available!')</script>");
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string query = "select * from Sub_Category where C_id='" + DropDownList1.SelectedItem.Value + "'";
            adp = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                DropDownList2.DataSource = dt;
                DropDownList2.DataTextField = "SC_Name";
                DropDownList2.DataValueField = "SC_id";
                DropDownList2.DataBind();
                ListItem L = new ListItem("Select SubCategory", "-1");
                L.Selected = true;
                DropDownList2.Items.Insert(0, L);
            }
            else
            {
                Response.Write("<script>alert('SubCategory is not available!')</script>");
                DropDownList2.Items.Clear();
            }
        }

        void BindBrand()
        {
            string query = "select * from Brands";
            adp = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                DropDownList3.DataSource = dt;
                DropDownList3.DataTextField = "B_Name";
                DropDownList3.DataValueField = "B_id";
                DropDownList3.DataBind();
                ListItem L = new ListItem("Select Brand", "-1");
                L.Selected = true;
                DropDownList3.Items.Insert(0, L);
            }
            else
            {
                Response.Write("<script>alert('Brand is not available!')</script>");
            }
        }

        void BindPackSize()
        {
            string query = "select * from Pack_Sizes";
            adp = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                DropDownList4.DataSource = dt;
                DropDownList4.DataTextField = "Size";
                DropDownList4.DataValueField = "PS_id";
                DropDownList4.DataBind();
                ListItem L = new ListItem("Select Pack Size", "-1");
                L.Selected = true;
                DropDownList4.Items.Insert(0, L);
            }
            else
            {
                Response.Write("<script>alert('Pack Size is not available!')</script>");
            }
        }



        protected void AddButton_Click(object sender, EventArgs e)
        {
            try
            {
                FileUpload1.SaveAs(Server.MapPath("/Product_Image/") + FileUpload1.FileName.ToString());
                conn.Open();
                cmd = new SqlCommand("Proc_Products", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@P_Name", ProductTextBox.Text);
                cmd.Parameters.AddWithValue("@Price", PriceTextBox.Text);
                cmd.Parameters.AddWithValue("@SellingPrice", SellingPriceTextBox.Text);
                cmd.Parameters.AddWithValue("@Description", DescriptionTextBox.Text);
                cmd.Parameters.AddWithValue("@Quantity", QuantityTextBox.Text);
                cmd.Parameters.AddWithValue("@P_Image", FileUpload1.FileName);
                cmd.Parameters.AddWithValue("@C_id", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@SC_id", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@B_id", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PS_id", DropDownList4.SelectedItem.Value);
                if (FreeDeliveryCheckBox.Checked)
                {
                    cmd.Parameters.AddWithValue("@FreeDelivery", 1.ToString());
                }
                else
                {
                    cmd.Parameters.AddWithValue("@FreeDelivery", 0.ToString());
                }
                if (ReturnsCheckBox.Checked)
                {
                    cmd.Parameters.AddWithValue("@Returns", 1.ToString());
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Returns", 0.ToString());
                }
                if (CodCheckBox.Checked)
                {
                    cmd.Parameters.AddWithValue("@Cod", 1.ToString());
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Cod", 0.ToString());
                }
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Inserted successfully!')</script>");
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Invalid data')</script>");
            }
            finally
            {
                conn.Close();
            }
        }

        void Gridview()
        {
            cmd = new SqlCommand("Proc_Products_Display", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            cb = new SqlCommandBuilder(adp);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Gridview();
        }
    }
}