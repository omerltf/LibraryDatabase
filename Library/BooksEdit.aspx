<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BooksEdit.aspx.cs" Inherits="Library.BooksEdit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h2>Edit Book</h2>

    <fieldset>

        <div>
            <asp:Label ID="TitleLabel" runat="server" AssociatedControlID="BookTitle" Text="Book Title: " />
            <asp:TextBox ID="BookTitle" runat="server" />
        </div>

        <div>
            <asp:Label ID="ISBNLabel" runat="server" AssociatedControlID="ISBN" Text="ISBN: " />
            <asp:TextBox ID="ISBN" runat="server" />
        </div>
        <div>
            <asp:DropDownList ID="AuthorDropDownList" AutoPostBack="false" runat="server">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>

        </div>
    </fieldset>

    <div>
        <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" />
        <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click" />
    </div>
</asp:Content>
