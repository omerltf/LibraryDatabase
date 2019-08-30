<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatronsList.aspx.cs" Inherits="Library.PatronsList" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2>Patrons</h2>

    <div>
        <asp:HyperLink runat="server" NavigateUrl="~/PatronsAdd.aspx">Add New Patron</asp:HyperLink>
    </div>

    <asp:Repeater ID="PatronRepeater" runat="server" ItemType="DataRow">
        <HeaderTemplate>
            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email Address</th>
                    <th>Street Address</th>
                    <th>City</th>
                    <th>State</th>
                    <th>Country</th>
                    <th>ZipCode</th>
                    <th>&nbsp;</th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Item.Field<string>("FirstName") %></td>
                <td><%# Item.Field<string>("LastName") %></td>
                <td><%# Item.Field<string>("EmailAddress") %></td>
                <td><%# Item.Field<string>("StreetAddress") %></td>
                <td><%# Item.Field<string>("City") %></td>
                <td><%# Item.Field<string>("State") %></td>
                <td><%# Item.Field<string>("Country") %></td>
                <td><%# Item.Field<string>("ZipCode") %></td>

                <td>
                    <asp:HyperLink runat="server" NavigateUrl='<%# $"~/PatronsEdit.aspx?LibraryCardNumber={Item.Field<int>("LibraryCardNumber")}" %>' Text="Edit" /></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <div>
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx" Text="Home" />
    </div>

</asp:Content>
