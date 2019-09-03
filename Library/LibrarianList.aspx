<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LibrarianList.aspx.cs" Inherits="Library.LibrarianList" %>
<%@ Import Namespace="System.Data" %>


<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h2 class="py-3">Librarians</h2>
    <div class="p-4">
        <asp:Label ID="PatronDropDownListLabel" runat="server" Text="Patrons: " AssociatedControlID="PatronDropDownList" />
        <asp:DropDownList ID="PatronDropDownList" AutoPostBack="false" runat="server">
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
    </div>

    <div>
        <asp:Label ID="LibraryDropDownListLabel" runat="server" Text="Libraries: " AssociatedControlID="LibraryDropDownList" />
        <asp:DropDownList ID="LibraryDropDownList" runat="server" AutoPostBack="false">
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
    </div>

    <div class="p-4">
        <asp:Label ID="PasswordLabel" runat="server" Text="Password: " AssociatedControlID="PasswordTextBox" />
        <asp:TextBox ID="PasswordTextBox" TextMode="Password" runat="server" />
    </div>

    <div>
        <asp:Button ID="AddLibrarianButton" runat="server" Text="Add Librarian" OnClick="AddLibrarianButton_Click" />
    </div>

    <div>
        <asp:Repeater ID="LibrarianRepeater" runat="server" ItemType="DataRow">
            <HeaderTemplate>
                <table class="table table-sm table-striped table-hover">
            <thead class="thead-dark">
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Branch Name</th>
                        <th>Library Card Number</th>
                        <th>Employee Number</th>
                    </tr>
                </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td> <%# Item.Field<string>("FirstName") %>  </td>
                    <td> <%# Item.Field<string>("LastName") %>  </td>
                    <td> <%# Item.Field<string>("BranchName") %>  </td>
                    <td> <%# Item.Field<int>("LibraryCardNumber") %>  </td>
                    <td> <%# Item.Field<int>("EmployeeNumber") %>  </td>
                    <td class="text-right pr-4"> <asp:HyperLink runat="server" cssclass="btn btn-secondary btn-sm" NavigateUrl='<%# $"~/LibrarianEdit.aspx?EmployeeNumber={Item.Field<int>("EmployeeNumber")}" %>' Text="Edit" /></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>

</asp:Content>