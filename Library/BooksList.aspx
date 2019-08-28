<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BooksList.aspx.cs" Inherits="Library.BooksList" %>

<%@ Import Namespace="System.Data" %>


<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h2>Books</h2>

    <div>
        <asp:HyperLink runat="server" NavigateUrl="~/BooksAdd.aspx">Add New Book</asp:HyperLink>
    </div>

    <asp:Repeater ID="BooksRepeater" runat="server" ItemType="DataRow">
        <HeaderTemplate>
            <table>
                <tr>
                    <th>Title</th>
                    <th>ISBN</th>
                    <th>Author Name</th>
                    <th>&nbsp;</th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Item.Field<string>("Title") %></td>
                <td><%# Item.Field<string>("ISBN") %></td>
                <td><%# Item.Field<string>("AuthorName") %></td>
                <td>
                    <asp:HyperLink runat="server" NavigateUrl='<%# $"~/BooksEdit.aspx?ID={Item.Field<int>("id")}" %>' Text="Edit" /></td>
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
