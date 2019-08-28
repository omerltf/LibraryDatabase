<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AuthorsList.aspx.cs" Inherits="Library.AuthorsList" %>

<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2>Authors</h2>

    <div>
        <asp:HyperLink runat="server" NavigateUrl="~/AuthorAdd.aspx">Add New Author</asp:HyperLink>
    </div>

    <asp:Repeater ID="Authors" runat="server" ItemType="DataRow">
        <HeaderTemplate>
            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>&nbsp;</th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Item.Field<string>("FirstName") %></td>
                <td><%# Item.Field<string>("LastName") %></td>
                <td>
                    <asp:HyperLink runat="server" NavigateUrl='<%# $"~/AuthorEdit.aspx?ID={Item.Field<int>("Id")}" %>' Text="Edit" /></td>
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
