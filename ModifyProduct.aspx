<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ModifyProduct.aspx.cs" Inherits="KG.ModifyProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="Panel1" runat="server" DefaultButton="SearchButton">

        <div class="d-inline-flex align-items-center" style="margin-left: 35%; margin-top: 45px;">
            <asp:TextBox ID="SearchTextBox" runat="server" class="form-control" placeholder="Search" ValidationGroup="Search"></asp:TextBox>
            <asp:LinkButton ID="SearchButton" runat="server" class="btn btn-primary" OnClick="SearchButton_Click" ValidationGroup="Search"><i class="bi bi-search"></i></asp:LinkButton>
        </div>

        <!-- GridView -->
        <div class="container" style="margin-bottom: 400px; margin-top: 30px;">
            <div class="row">
                <asp:GridView ID="GridView1" OnRowDeleting="GridView1_RowDeleting" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" PageSize="10" CssClass="table table-responsive table-bordered table-condensed table-hover" GridLines="None" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField ShowHeader="true" HeaderText="#">
                            <ItemTemplate>
                                <asp:Literal ID="Literal1" runat="server" Text='<%#Eval("P_id")%>'></asp:Literal>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Literal ID="Literal1" runat="server" Text='<%#Eval("P_id")%>'></asp:Literal>
                            </EditItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="Product Name">
                            <ItemTemplate>
                                <asp:Label ID="l2" runat="server" Text='<%#Eval("P_Name")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%#Eval("P_Name")%>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Brand" ControlToValidate="TextBox1" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="l3" runat="server" Text='<%#Eval("Price")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%#Eval("Price")%>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Price" ControlToValidate="TextBox2" SetFocusOnError="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter valid price" Display="Dynamic" ControlToValidate="TextBox2" SetFocusOnError="True" ForeColor="Red" ValidationExpression="^\d{0,8}(\.\d{1,4})?$"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="Selling Price">
                            <ItemTemplate>
                                <asp:Label ID="l4" runat="server" Text='<%#Eval("SellingPrice")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%#Eval("SellingPrice")%>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter SellingPrice" ControlToValidate="TextBox3" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter valid SellingPrice" Display="Dynamic" ControlToValidate="TextBox3" SetFocusOnError="True" ForeColor="Red" ValidationExpression="^\d{0,8}(\.\d{1,4})?$"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:Label ID="l5" runat="server" Text='<%#Eval("Quantity")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%#Eval("Quantity")%>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Quantity" ControlToValidate="TextBox4" SetFocusOnError="True" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter valid price" Display="Dynamic" ControlToValidate="TextBox4" SetFocusOnError="True" ForeColor="Red" ValidationExpression="^0$|^[1-9][0-9]*$"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField ShowHeader="true" HeaderText="Modification">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CommandName="Delete" Text="Delete" />
                                <asp:Button ID="Button4" runat="server" Text="Edit" CommandName="Edit" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button ID="Button2" runat="server" Text="Update" CommandName="Update" />
                                <asp:Button ID="Button3" runat="server" Text="Cancel" CommandName="Cancel" ValidationGroup="null" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="ModifyProduct.aspx" ForeColor="Black" Font-Underline="False" CssClass="text-muted">Back</asp:HyperLink>
            </div>
        </div>
    </asp:Panel>

</asp:Content>
