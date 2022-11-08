<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="AllProducts.aspx.cs" Inherits="KG.AllProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="padding-top: 50px; padding-bottom: 205px;">
        <div class="row">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="col-sm-3 col-md-3">
                        <a href="ViewProduct.aspx?P_id=<%#Eval("P_id") %>" style="text-decoration: none;">
                            <div class="thumbnail">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "Product_Image/" + Eval("P_Image") %>' AlternateText="Image not available" Width="100px" />
                            </div>
                            <div class="caption">
                                <div class="text-muted"><small><%#Eval("B_Name") %></small></div>
                                <div class="fw-bold text-dark">
                                    <%#Eval("P_Name") %>
                                </div>
                                <div class="fw-bold text-dark"><%#Eval("Size") %></div>
                                <div class="fw-bold text-dark">
                                    ₹ <%#Eval("SellingPrice") %>
                                </div>
                                <div class="text-decoration-line-through text-muted fs-6">MRP: ₹ <%#Eval("Price") %></div>
                                <div class="text-success mb-5">
                                    Save ₹ <%#Eval("Discount") %>
                                </div>
                            </div>
                        </a>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
