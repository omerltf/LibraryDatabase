<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BooksAdd.aspx.cs" Inherits="Library.BooksAdd" %>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div>
        <h2 class="py-3">Add Book</h2>

        <fieldset>

            <div>
                <asp:Label ID="BookTitle" runat="server" AssociatedControlID="BookTitle" Text="Book Title: " />
                <asp:TextBox ID="BookTitleTextBox" runat="server" />
            </div>

            <div>
                <asp:Label ID="ISBNNumber" runat="server" AssociatedControlID="ISBNNumber" Text="ISBN: " />
                <asp:TextBox ID="ISBNNumberTextBox" runat="server" />
            </div>

            <div>
                <asp:DropDownList ID="AuthorDropDownList" AutoPostBack="false" runat="server">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>

            </div>
        </fieldset>

        <div>
            <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_Click" />
        </div>
    </div>
</asp:Content>
