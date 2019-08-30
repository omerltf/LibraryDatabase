<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatronsList.aspx.cs" Inherits="Library.PatronsList" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2 class="py-3">Patrons</h2>

    <div class="p-4">
        <asp:HyperLink runat="server" NavigateUrl="~/PatronsAdd.aspx">Add New Patron</asp:HyperLink>
    </div>

    <asp:Repeater ID="PatronRepeater" runat="server" ItemType="DataRow">
        <HeaderTemplate>
            <table class="table table-sm table-striped table-hover">
            <thead class="thead-dark">
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
                </thead>
                <tbody>
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

                <td class="text-right pr-4">
                    <asp:HyperLink runat="server" cssclass="btn btn-secondary btn-sm" NavigateUrl='<%# $"~/PatronsEdit.aspx?LibraryCardNumber={Item.Field<int>("LibraryCardNumber")}" %>' Text="Edit" /></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <div>
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx" Text="Home" />
    </div>

</asp:Content>
