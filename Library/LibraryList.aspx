<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LibraryList.aspx.cs" Inherits="Library.LibraryList" %>
<%@ Import Namespace="System.Data" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2>Libraries</h2>

    <div>
        <asp:HyperLink runat="server" NavigateUrl="~/LibraryAdd.aspx">Add New Library</asp:HyperLink>
    </div>

    <asp:Repeater ID="LibraryRepeater" runat="server" ItemType="DataRow">
        <HeaderTemplate>
            <table>
                <tr>
                    <th>Branch Name</th>
                    <th>Street Address</th>
                    <th>City</th>
                    <th>State</th>
                    <th>COuntry</th>
                    <th>ZipCode</th>
                    <th>&nbsp;</th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Item.Field<string>("BranchName") %></td>
                <td><%# Item.Field<string>("StreetAddress") %></td>
                <td><%# Item.Field<string>("City") %></td>
                <td><%# Item.Field<string>("State") %></td>
                <td><%# Item.Field<string>("Country") %></td>
                <td><%# Item.Field<string>("ZipCode") %></td>

                <td>
                    <asp:HyperLink runat="server" NavigateUrl='<%# $"~/LibraryEdit.aspx?ID={Item.Field<int>("ID")}" %>' Text="Edit" /></td>
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
