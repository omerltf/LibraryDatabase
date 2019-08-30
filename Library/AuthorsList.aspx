<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AuthorsList.aspx.cs" Inherits="Library.AuthorsList" %>

<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2 class="py-3">Authors</h2>

    <div class="p-4">
        <asp:HyperLink runat="server" NavigateUrl="~/AuthorAdd.aspx">Add New Author</asp:HyperLink>
    </div>

    <asp:Repeater ID="Authors" runat="server" ItemType="DataRow">
        <HeaderTemplate>
            <table class="table table-sm table-striped table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>&nbsp;</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Item.Field<string>("FirstName") %></td>
                <td><%# Item.Field<string>("LastName") %></td>
                <td class="text-right pr-4">
                    <asp:HyperLink runat="server" cssclass="btn btn-secondary btn-sm" NavigateUrl='<%# $"~/AuthorEdit.aspx?ID={Item.Field<int>("Id")}" %>' Text="Edit" /></td>
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
