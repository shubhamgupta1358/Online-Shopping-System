<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ViewOrder.aspx.cs" Inherits="KG.ViewOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="padding-top: 50px; padding-bottom: 205px;">
        <div class="row">
            <asp:GridView ID="GridView1" CssClass="table table-responsive table-bordered table-condensed table-hover" GridLines="None" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>                            
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/Product_Image/" + Eval("P_Image") %>' AlternateText="Image not available" Width="100px"  />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Product">
                        <ItemTemplate>
                            <asp:Label ID="l1" runat="server" Text='<%#Eval("P_Name")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Size">
                        <ItemTemplate>
                            <asp:Label ID="l2" runat="server" Text='<%#Eval("P_Size")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="l3" runat="server" Text='<%#Eval("P_Quantity")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="l4" runat="server" Text='<%#Eval("P_Price")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
