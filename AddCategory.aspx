<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="KG.AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="form-horizontal">
            <br />
            <br />
            <h2>Add Category</h2>
            <hr />
            <br />

            <!-- Category Name -->
            <div class="d-inline-flex align-items-center mb-4 mt-4">
                <asp:Label ID="Label1" runat="server" Text="Category Name" CssClass="form-label" Style="min-width: 120px"></asp:Label>
                <asp:TextBox ID="CategoryTextBox" CssClass="form-control" runat="server" Style="width: 67%"></asp:TextBox>
            </div>
            <span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter Category name" ControlToValidate="CategoryTextBox" ForeColor="Red" SetFocusOnError="True" ValidationGroup="Add"></asp:RequiredFieldValidator>
            </span>

            <!-- Add Button -->
            <div class="text-center text-lg-start mt-3 pt-2 mb-5" style="margin-left: 122px;">
                <asp:Button ID="AddButton" runat="server" Text="Add" Style="padding-left: 2.5rem; padding-right: 2.5rem;" CssClass="btn btn-primary btn-lg" OnClick="AddButton_Click" ValidationGroup="Add" />
            </div>
        </div>
    </div>
    <hr />
    <br />

    <!-- GridView -->
    <div class="container" style="margin-bottom: 400px; margin-top: 15px;">
        <div class="row">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5" CssClass="table table-responsive table-bordered table-condensed table-hover" GridLines="None">
                <Columns>
                    <asp:TemplateField ShowHeader="true" HeaderText="#">
                        <ItemTemplate>
                            <asp:Label ID="l1" runat="server" Text='<%#Eval("C_id")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Category">
                        <ItemTemplate>
                            <asp:Label ID="l2" runat="server" Text='<%#Eval("C_Name")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Edit/Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" href="ModifyCategory.aspx" Text="Modify" CssClass="btn btn-success"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
