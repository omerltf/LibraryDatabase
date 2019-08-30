<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="Library.BookDetails" %>
<%@ Import Namespace="System.Data" %>


<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2>Book Details</h2>

    <fieldset>
        <legend>Information</legend>
        <div>
            <asp:Label ID="TitleLabel" runat="server" AssociatedControlID="BookTitle" Text="Book Title: " />
            <asp:TextBox ID="BookTitle" runat="server" />
        </div>

        <div>
            <asp:Label ID="ISBNLabel" runat="server" AssociatedControlID="ISBN" Text="ISBN: " />
            <asp:TextBox ID="ISBN" runat="server" />
        </div>
        <div>
            <asp:Label ID="AuthorLabel" AutoPostBack="false" AssociatedControlID="AuthorTextBox" Text="Author Name: " runat="server">
            </asp:Label>
            <asp:TextBox ID="AuthorTextBox" runat="server" />

        </div>
    </fieldset>

    <div>
        <asp:Button ID="Edit" runat="server" Text="Edit" OnClick="Edit_Click" />
        <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" />
    </div>

    <br />
    <br />

    <div>
        <asp:Label ID="LibraryDropDownListLabel" runat="server" Text="Libraries: " AssociatedControlID="LibraryDropDownList" />
    <asp:DropDownList ID="LibraryDropDownList" runat="server" AutoPostBack="false">
        <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
    <asp:Button ID="AddBookButton" runat="server" Text="+" OnClick="AddBookButton_Click" />

    <asp:Repeater ID="BookCopyRepeater" runat="server" ItemType="DataRow">
        <HeaderTemplate>
            <table>
                <tr>
                    <th>Branch Name</th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Item.Field<string>("BranchName") %></td>
                <td><asp:Button ID="NotAvailabilityButton" CommandArgument='<%# Item.Field<int>("Id") %>' Text="Make Not Available" Visible='<%# Item.Field<bool>("Available") %>' OnClick="NotAvailabilityButton_Click" runat="server" /></td>
                <td><asp:Button ID="AvailabilityButton" CommandArgument='<%# Item.Field<int>("Id") %>' Text="Make Available" Visible='<%# !Item.Field<bool>("Available") %>' OnClick="AvailabilityButton_Click" runat="server" /></td>
                <td><asp:Button ID="DeleteButton" Text="Delete Record" OnClick="DeleteButton_Click" runat="server" /></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    </div>
</asp:Content>
