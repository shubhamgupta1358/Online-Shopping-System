<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="KG.ManageUsers" %>

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
                <asp:GridView ID="GridView1" CssClass="table table-responsive table-bordered table-condensed table-hover" GridLines="None" runat="server" AutoGenerateColumns="false" OnRowDeleting="GridView1_RowDeleting" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" PageSize="5">
                    <Columns>
                        <asp:TemplateField ShowHeader="true" HeaderText="#">
                            <ItemTemplate>
                                <asp:Literal ID="Literal1" runat="server" Text='<%#Eval("U_id")%>'></asp:Literal>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Literal ID="Literal1" runat="server" Text='<%#Eval("U_id")%>'></asp:Literal>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="l2" runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="l3" runat="server" Text='<%#Eval("Email")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="Mobile">
                            <ItemTemplate>
                                <asp:Label ID="l4" runat="server" Text='<%#Eval("Mobile")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="UserType">
                            <ItemTemplate>
                                <asp:Label ID="l5" runat="server" Text='<%#Eval("UserType")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%#Eval("UserType")%>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter UserType" ControlToValidate="TextBox1" SetFocusOnError="True" ForeColor="Red" ValidationGroup="Update"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="Status">
                            <ItemTemplate>
                                <asp:Literal ID="l6" runat="server" Text='<%#Eval("Status")%>'></asp:Literal>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%#Eval("Status")%>' ToolTip="Enter 0 for deactivate or 1 for activate"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Status" ControlToValidate="TextBox2" SetFocusOnError="True" ForeColor="Red" Display="Dynamic" ValidationGroup="Update"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please enter valid data" Display="Dynamic" ControlToValidate="TextBox2" SetFocusOnError="True" ForeColor="Red" ValidationExpression="^[01]$" ValidationGroup="Update"></asp:RegularExpressionValidator>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="true" HeaderText="Modification">
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CommandName="Delete" Text="Delete" ValidationGroup="Modify" />
                                <asp:Button ID="Button4" runat="server" Text="Edit" CommandName="Edit" ValidationGroup="Modify" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button ID="Button2" runat="server" Text="Update" CommandName="Update" ValidationGroup="Update" />
                                <asp:Button ID="Button3" runat="server" Text="Cancel" CommandName="Cancel" ValidationGroup="Update" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="ManageUsers.aspx" ForeColor="Black" Font-Underline="False" CssClass="text-muted">Back</asp:HyperLink>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
