<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="ViewProduct.aspx.cs" Inherits="KG.ViewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="row g-3 align-items-center mb-3">
                <div class="col-auto">
                    <asp:Label ID="Label2" runat="server" Text="Quantity" class="col-form-label"></asp:Label>
                </div>
                <div class="col-auto">
                    <asp:TextBox ID="ItemQuantityTextBox" runat="server" class="form-control" value="1" aria-describedby="Label1"></asp:TextBox>
                </div>
                <div class="col-auto">
                    <asp:Button ID="AddToCartButton" runat="server" Text="Add to Cart " class="btn btn-info" OnClick="AddToCartButton_Click" />
                </div>
                <div class="col-auto">
                    <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red" class="form-text"></asp:Label>
                </div>
            </div>            

            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="col-md-6 mt-1">
                        <div class="thumbnail">
                            <asp:Image ID="Image1" runat="server" AlternateText="Image not available" ImageUrl='<%# "~/Product_Image/" + Eval("P_Image") %>' Width="70%" />
                        </div>
                    </div>
                    <div class="col-md-6 mt-1">
                        <div>
                            <p class="text-muted"><small><%#Eval("B_Name") %></small></p>
                            <p class="fw-bold fs-5 mb-4">
                                <span>
                                    <%#Eval("P_Name") %>
                                </span>
                                <span><%#Eval("Size") %></span>
                            </p>
                            <hr />
                            <p class="text-decoration-line-through text-muted mt-4">MRP: ₹ <%#Eval("Price") %></p>
                            <p class="fw-bold fs-5">
                                ₹ <%#Eval("SellingPrice") %>
                            </p>
                            <p class="text-success">
                                You Save: ₹ <%#Eval("Discount") %>
                            </p>
                            <p class="text-muted mb-4">
                                <small>(Inclusive of all taxes) </small>
                            </p>
                        </div>                                              
                        <hr />                        
                        <div class="mt-4">
                            <p><%#((int)Eval("FreeDelivery")==1)?"<i class=\"bi bi-truck\"></i> Free home delivery":"" %></p>
                            <p><%#((int)Eval("Cod")==1)?"<i class=\"bi bi-currency-rupee\"></i> Cash on delivery available":"" %></p>
                            <p><%#((int)Eval("Returns")==1)?"<i class=\"bi bi-arrow-left-right\"></i> Easy returns available":"" %></p>
                        </div>
                    </div>
                    <div class="col-md-12 mt-1" style="margin-bottom: 250px;">
                        <p class="fs-4"><%#Eval("P_Name") %></p>
                        <hr />
                        <p class="fw-bold">About the Product</p>
                        <p><%#Eval("Description") %></p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>            
        </div>
    </div>

</asp:Content>
