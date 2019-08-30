<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Library.Checkout" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h2 class="py-3">Checkout</h2>


    <div class="p-4">
        <asp:Label ID="LibrarianDropDownListLabel" runat="server" Text="Librarian: " AssociatedControlID="LibrarianDropDownList" />
        <asp:DropDownList ID="LibrarianDropDownList" AutoPostBack="false" runat="server" >
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
    </div>

    <div class="p-4">
        <asp:Label ID="PatronDropDownListLabel" runat="server" Text="Patrons: " AssociatedControlID="PatronDropDownList" />
        <asp:DropDownList ID="PatronDropDownList" AutoPostBack="false" runat="server">
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
    </div>

    <div class="p-4"> 
        <asp:Label ID="AvailableLibrariesDropDownListLabel" runat="server" Text="Available Libraries: " AssociatedControlID="AvailableLibrariesDropDownList" />
        <asp:DropDownList ID="AvailableLibrariesDropDownList" AutoPostBack="false" runat="server">
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
    </div>

    <asp:Button ID="CheckoutButton" Text="Checkout" OnClick="CheckoutButton_Click" runat="server" />

    <div>
        <asp:HyperLink runat="server" NavigateUrl="~/Default.aspx" Text="Home" />
    </div>
</asp:Content>
