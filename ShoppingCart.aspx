<%@ Page Title="" Language="C#" MasterPageFile="~/UserMasterPage.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="KG.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="h-100 gradient-custom">
        <div class="container py-5">
            <div class="row d-flex justify-content-center my-4">
                <div class="col-md-8">
                    <div class="card mb-5">
                        <div class="card-header py-3">
                            <h5 class="mb-0">Shopping Cart (<asp:Label ID="Label2" runat="server" Text="0"></asp:Label>items)</h5>
                        </div>
                        <asp:DataList ID="DataList1" runat="server">
                            <ItemTemplate>
                                <div class="card-body">
                                    <!-- Single item -->
                                    <div class="row">
                                        <div class="col-lg-3 col-md-12 mb-1 mb-lg-0">
                                            <!-- Image -->
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Product_Image/" + Eval("P_Image") %>' AlternateText="Image not available" Width="100px" />
                                        </div>
                                        <!-- Image -->
                                        <!-- Data -->
                                        <div class="col-lg-5 col-md-6 mb-1 mb-lg-0">
                                            <div><strong><%#Eval("P_Name") %></strong></div>
                                            <p><%#Eval("Size") %></p>
                                            <!-- Delete Button -->
                                            <a href="DeleteCartItem.aspx?P_id=<%#Eval("P_id") %>">
                                                <button type="button" class="btn btn-primary btn-sm me-1 mb-2" data-mdb-toggle="tooltip" title="Remove item"><i class="bi bi-trash"></i></button>
                                            </a>
                                            <!-- Delete Button -->
                                        </div>
                                        <!-- Data -->
                                        <!-- Quantity -->
                                        <div class="col-lg-4 col-md-6 mb-1 mb-lg-0">
                                            <div style="text-align: center">Quantity : <%#Eval("ItemQuantity") %></div>
                                            <br />
                                            <!-- Price -->
                                            <p class="text-start text-md-center">
                                                <strong>₹ <%#Eval("SellingPrice") %></strong> <span class="text-decoration-line-through text-muted fs-6"><%#Eval("Price") %></span>
                                            </p>
                                            <!-- Price -->
                                        </div>
                                        <!-- Quantity -->
                                    </div>
                                </div>
                                <!-- Single item -->
                                <hr class="my-4" />
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card mb-5">
                        <div class="card-header py-3">
                            <h5 class="mb-0">Summary</h5>
                        </div>
                        <div class="card-body">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                    <div>Price (<asp:Label ID="Label4" runat="server" Text="0"></asp:Label>items)</div>
                                    <span>₹<asp:Label ID="Label1" runat="server" Text="0"></asp:Label></span></li>
                                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0">Discount<span class="text-success">-₹<asp:Label ID="Label5" runat="server" Text="0"></asp:Label></span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center  px-0">Delivery Charges<span class="text-success">Free</span></li>
                                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                    <div><strong class="mb-0">Total Amount</strong></div>
                                    <span><strong>₹<asp:Label ID="Label3" runat="server" Text="0"></asp:Label></strong></span></li>
                            </ul>
                            <asp:Button ID="PlaceOrderButton" runat="server" Text="Place Order" class="btn btn-primary btn-lg btn-block" OnClick="PlaceOrderButton_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
