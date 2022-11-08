<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddSubCategory.aspx.cs" Inherits="KG.AddSubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="form-horizontal">
            <br />
            <br />
            <h2>Add SubCategory</h2>
            <hr />
            <br />

            <!-- Category -->
            <div class="mb-3">
                <div class="d-inline-flex align-items-center" style="margin-left: 74px;">
                    <asp:Label ID="Label5" runat="server" Text="Category" CssClass="form-label" Style="min-width: 65px;"></asp:Label>
                    <span>
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" Style="width: 91%; margin-left: 8px;"></asp:DropDownList>
                    </span>
                </div>
            </div>

            <!-- SubCategory Name -->
            <div class="d-inline-flex align-items-center mb-4">
                <asp:Label ID="Label1" runat="server" Text="SubCategory Name" CssClass="form-label" Style="min-width: 147px"></asp:Label>
                <asp:TextBox ID="SubCategoryTextBox" CssClass="form-control" runat="server" Style="width: 67%"></asp:TextBox>
            </div>
            <span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter SubCategory name" ControlToValidate="SubCategoryTextBox" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </span>

            <!-- Add Button -->
            <div class="text-center text-lg-start  mb-5" style="margin-left: 150px;">
                <asp:Button ID="AddButton" runat="server" Text="Add" Style="padding-left: 2.5rem; padding-right: 2.5rem;" CssClass="btn btn-primary btn-lg" OnClick="AddButton_Click" />
            </div>
        </div>
    </div>
    <hr />
    <br />

    <!-- GridView -->
    <div class="container" style="margin-bottom: 400px; margin-top: 10px;">
        <div class="row">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="5" CssClass="table table-responsive table-bordered table-condensed table-hover" GridLines="None">
                <Columns>
                    <asp:TemplateField ShowHeader="true" HeaderText="#">
                        <ItemTemplate>
                            <asp:Label ID="l1" runat="server" Text='<%#Eval("SC_id")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Category">
                        <ItemTemplate>
                            <asp:Label ID="l1" runat="server" Text='<%#Eval("C_Name")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="SubCategory">
                        <ItemTemplate>
                            <asp:Label ID="l2" runat="server" Text='<%#Eval("SC_Name")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Edit/Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" href="ModifySubCategory.aspx" Text="Modify" CssClass="btn btn-success"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
