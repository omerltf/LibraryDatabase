<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LibraryList.aspx.cs" Inherits="Library.LibraryList" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2 class="py-3">Libraries</h2>

    <div class="p-4">
        <asp:HyperLink runat="server" NavigateUrl="~/LibraryAdd.aspx">Add New Library</asp:HyperLink>
    </div>

    <asp:Repeater ID="LibraryRepeater" runat="server" ItemType="DataRow">
        <HeaderTemplate>
            <table class="table table-sm table-striped table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>Branch Name</th>
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
                <td><%# Item.Field<string>("BranchName") %></td>
                <td><%# Item.Field<string>("StreetAddress") %></td>
                <td><%# Item.Field<string>("City") %></td>
                <td><%# Item.Field<string>("State") %></td>
                <td><%# Item.Field<string>("Country") %></td>
                <td><%# Item.Field<string>("ZipCode") %></td>

                <td class="text-right pr-4">
                    <asp:HyperLink runat="server" cssclass="btn btn-secondary btn-sm" NavigateUrl='<%# $"~/LibraryEdit.aspx?ID={Item.Field<int>("ID")}" %>' Text="Edit" /></td>
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
