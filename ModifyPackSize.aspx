<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ModifyPackSize.aspx.cs" Inherits="KG.ModifyPackSize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- GridView -->
    <div class="container" style="margin-bottom: 400px; margin-top: 80px;">
        <div class="row">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" PageSize="10" CssClass="table table-responsive table-bordered table-condensed table-hover" GridLines="None">
                <Columns>
                    <asp:TemplateField ShowHeader="true" HeaderText="#">
                        <ItemTemplate>
                            <asp:Literal ID="Literal1" runat="server" Text='<%#Eval("PS_id")%>'></asp:Literal>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Literal ID="Literal1" runat="server" Text='<%#Eval("PS_id")%>'></asp:Literal>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Pack Sizes">
                        <ItemTemplate>
                            <asp:Literal ID="Literal2" runat="server" Text='<%#Eval("Size")%>'></asp:Literal>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%#Eval("Size")%>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Pack Size" ControlToValidate="TextBox1" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
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
        </div>
    </div>

</asp:Content>
