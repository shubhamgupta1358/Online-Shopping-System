<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="DisplayOrders.aspx.cs" Inherits="KG.DisplayOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="padding-top: 50px; padding-bottom: 205px;">
        <div class="row">
            <asp:GridView ID="GridView1" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="10" CssClass="table table-responsive table-bordered table-condensed table-hover" GridLines="None" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField ShowHeader="true" HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="l1" runat="server" Text='<%#Eval("Name")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="l2" runat="server" Text='<%#Eval("Email")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Mobile">
                        <ItemTemplate>
                            <asp:Label ID="l3" runat="server" Text='<%#Eval("AlternativeMobile")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Pincode">
                        <ItemTemplate>
                            <asp:Label ID="l4" runat="server" Text='<%#Eval("Pincode")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="City">
                        <ItemTemplate>
                            <asp:Label ID="l5" runat="server" Text='<%#Eval("City")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="State">
                        <ItemTemplate>
                            <asp:Label ID="l6" runat="server" Text='<%#Eval("State")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="true" HeaderText="Address">
                        <ItemTemplate>
                            <asp:Label ID="l7" runat="server" Text='<%#Eval("Address")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a href="ViewOrder.aspx?DA_id=<%#Eval("DA_id") %>">
                                <button type="button" class="btn btn-info">View Order</button></a>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
