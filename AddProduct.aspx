<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="KG.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="form-horizontal">
            <br />
            <br />
            <h2>Add Product</h2>
            <hr />
            <br />

            <!-- Product Name -->
            <div class="mb-4 mt-3">
                <div class="d-inline-flex align-items-center">
                    <asp:Label ID="Label1" runat="server" Text="Product Name" CssClass="form-label" Style="min-width: 120px"></asp:Label>
                    <asp:TextBox ID="ProductTextBox" CssClass="form-control" runat="server" Style="width: 67%"></asp:TextBox>
                </div>
                <span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter Product name" ControlToValidate="ProductTextBox" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </span>
            </div>

            <!-- Price -->
            <div class="mb-4">
                <div class="d-inline-flex align-items-center">
                    <asp:Label ID="Label2" runat="server" Text="Price" CssClass="form-label" Style="min-width: 120px"></asp:Label>
                    <asp:TextBox ID="PriceTextBox" CssClass="form-control" runat="server" Style="width: 67%"></asp:TextBox>
                </div>
                <span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter Price" ControlToValidate="PriceTextBox" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter valid price" Display="Dynamic" ControlToValidate="PriceTextBox" SetFocusOnError="True" ForeColor="Red" ValidationExpression="^\d{0,8}(\.\d{1,4})?$"></asp:RegularExpressionValidator>
                </span>
            </div>

            <!-- Selling Price -->
            <div class="mb-4">
                <div class="d-inline-flex align-items-center">
                    <asp:Label ID="Label3" runat="server" Text="Selling Price" CssClass="form-label" Style="min-width: 120px"></asp:Label>
                    <asp:TextBox ID="SellingPriceTextBox" CssClass="form-control" runat="server" Style="width: 67%"></asp:TextBox>
                </div>
                <span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter Selling Price" ControlToValidate="SellingPriceTextBox" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter valid price" Display="Dynamic" ControlToValidate="SellingPriceTextBox" SetFocusOnError="True" ForeColor="Red" ValidationExpression="^\d{0,8}(\.\d{1,4})?$"></asp:RegularExpressionValidator>
                </span>
            </div>

            <!-- Category -->
            <div class="mb-4">
                <div class="d-inline-flex align-items-center">
                    <asp:Label ID="Label5" runat="server" Text="Category" CssClass="form-label" Style="min-width: 120px;"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" Style="width: 63%" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>
                <span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter Category" ControlToValidate="DropDownList1" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </span>
            </div>

            <!-- SubCategory -->
            <div class="mb-4">
                <div class="d-inline-flex align-items-center" style="min-width: 31%;">
                    <asp:Label ID="Label6" runat="server" Text="SubCategory" CssClass="form-label" Style="min-width: 120px;"></asp:Label>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" Style="width: 66%"></asp:DropDownList>
                </div>
                <span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter SubCategory" ControlToValidate="DropDownList2" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </span>
            </div>

            <!-- Brand -->
            <div class="mb-4">
                <div class="d-inline-flex align-items-center" style="min-width: 23%;">
                    <asp:Label ID="Label4" runat="server" Text="Brand" CssClass="form-label" Style="min-width: 120px;"></asp:Label>
                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" Style="min-width: 87%"></asp:DropDownList>
                </div>
                <span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please enter Brand" ControlToValidate="DropDownList3" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </span>
            </div>

            <!-- PackSize -->
            <div class="mb-4">
                <div class="d-inline-flex align-items-center" style="min-width: 25%;">
                    <asp:Label ID="Label12" runat="server" Text="Pack Size" CssClass="form-label" Style="min-width: 120px;"></asp:Label>
                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control" Style="min-width: 80%"></asp:DropDownList>
                </div>
                <span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please enter PackSize" ControlToValidate="DropDownList4" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </span>
            </div>

            <!-- Product_Size_Quantity -->
            <div class="mb-4">
                <div class="d-inline-flex align-items-center">
                    <asp:Label ID="Label13" runat="server" Text="Quantity" CssClass="form-label" Style="min-width: 120px"></asp:Label>
                    <asp:TextBox ID="QuantityTextBox" CssClass="form-control" runat="server" Style="width: 67%"></asp:TextBox>
                </div>
                <span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please enter Quantity" ControlToValidate="QuantityTextBox" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter valid price" Display="Dynamic" ControlToValidate="QuantityTextBox" SetFocusOnError="True" ForeColor="Red" ValidationExpression="^0$|^[1-9][0-9]*$"></asp:RegularExpressionValidator>
                </span>
            </div>

            <!-- Description -->
            <div class="mb-4">
                <div class="d-inline-flex align-items-center">
                    <asp:Label ID="Label7" runat="server" Text="Description" CssClass="form-label" Style="min-width: 120px"></asp:Label>
                    <asp:TextBox ID="DescriptionTextBox" CssClass="form-control" runat="server" Style="width: 67%" TextMode="MultiLine" Rows="2"></asp:TextBox>
                </div>
                <span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please enter Description" ControlToValidate="DescriptionTextBox" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </span>
            </div>

            <!-- Upload Image -->
            <div class="mb-4">
                <div class="d-inline-flex align-items-center">
                    <asp:Label ID="Label8" runat="server" Text="Upload Image" CssClass="form-label" Style="min-width: 120px"></asp:Label>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" Style="width: 53%" />
                </div>
                <span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please upload image" ControlToValidate="FileUpload1" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </span>
            </div>

            <!-- Free Delivery -->
            <div class="mb-4">
                <div class="d-inline-flex align-items-center">
                    <asp:Label ID="Label9" runat="server" Text="Free Delivery" CssClass="form-label" Style="min-width: 120px"></asp:Label>
                    <asp:CheckBox ID="FreeDeliveryCheckBox" runat="server" />
                </div>
            </div>

            <!-- Returns -->
            <div class="mb-4">
                <div class="d-inline-flex align-items-center">
                    <asp:Label ID="Label10" runat="server" Text="Return" CssClass="form-label" Style="min-width: 120px"></asp:Label>
                    <asp:CheckBox ID="ReturnsCheckBox" runat="server" />
                </div>
            </div>

            <!-- Cod -->
            <div class="mb-5">
                <div class="d-inline-flex align-items-center">
                    <asp:Label ID="Label11" runat="server" Text="COD" CssClass="form-label" Style="min-width: 120px"></asp:Label>
                    <asp:CheckBox ID="CodCheckBox" runat="server" />
                </div>
            </div>

            <!-- Add Button -->
            <div class="text-center text-lg-start mt-3 pt-2 mb-5" style="margin-left: 122px;">
                <asp:Button ID="AddButton" runat="server" Text="Add" Style="padding-left: 2.5rem; padding-right: 2.5rem;" CssClass="btn btn-primary btn-lg" OnClick="AddButton_Click" />
            </div>
        </div>
    </div>
    <hr />
    <br />

    <!-- GridView -->
    <div class="container" style="margin-bottom: 400px; margin-top: 10px;">
        <div class="row">
            <asp:GridView ID="GridView1" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5" CssClass="table table-responsive table-bordered table-condensed table-hover" GridLines="None" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField ShowHeader="true" HeaderText="#">
                        <ItemTemplate>
                            <asp:Label ID="l1" runat="server" Text='<%#Eval("P_id")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Product Name">
                        <ItemTemplate>
                            <asp:Label ID="l2" runat="server" Text='<%#Eval("P_Name")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="l3" runat="server" Text='<%#Eval("Price")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Selling Price">
                        <ItemTemplate>
                            <asp:Label ID="l4" runat="server" Text='<%#Eval("SellingPrice")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="l5" runat="server" Text='<%#Eval("Quantity")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Free Delivery">
                        <ItemTemplate>
                            <asp:Label ID="l6" runat="server" Text='<%#Eval("FreeDelivery")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Returns">
                        <ItemTemplate>
                            <asp:Label ID="l7" runat="server" Text='<%#Eval("Returns")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="COD">
                        <ItemTemplate>
                            <asp:Label ID="l7" runat="server" Text='<%#Eval("Cod")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Pack Size">
                        <ItemTemplate>
                            <asp:Label ID="l7" runat="server" Text='<%#Eval("Size")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Brand">
                        <ItemTemplate>
                            <asp:Label ID="l7" runat="server" Text='<%#Eval("B_Name")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Category">
                        <ItemTemplate>
                            <asp:Label ID="l7" runat="server" Text='<%#Eval("C_Name")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="SubCategory">
                        <ItemTemplate>
                            <asp:Label ID="l7" runat="server" Text='<%#Eval("SC_Name")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Edit/Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" href="ModifyProduct.aspx" Text="Modify" CssClass="btn btn-success"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
