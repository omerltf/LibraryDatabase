<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BooksList.aspx.cs" Inherits="Library.BooksList" %>

<%@ Import Namespace="System.Data" %>


<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h2 class="py-3">Books</h2>

    <div class="p-4">
        <asp:HyperLink runat="server" NavigateUrl="~/BooksAdd.aspx">Add New Book</asp:HyperLink>
    </div>

    <asp:Repeater ID="BooksRepeater" runat="server" ItemType="DataRow">
        <HeaderTemplate>
            <table class="table table-sm table-striped table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>Title</th>
                    <th>ISBN</th>
                    <th>Author Name</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Item.Field<string>("Title") %></td>
                <td><%# Item.Field<string>("ISBN") %></td>
                <td><%# Item.Field<string>("AuthorName") %></td>
                <td>
                    <asp:HyperLink runat="server" cssclass="btn btn-secondary btn-sm" NavigateUrl='<%# $"~/BookDetails.aspx?ID={Item.Field<int>("ID")}" %>' Text="Details" /></td>
                <td class="text-right pr-4">
                    <asp:HyperLink runat="server" cssclass="btn btn-secondary btn-sm" NavigateUrl='<%# $"~/Checkout.aspx?ID={Item.Field<int>("ID")}" %>' Text="Checkout" /></td>
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
