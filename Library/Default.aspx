<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Library.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1>SQL Library Application</h1>
    <div>
        <asp:hyperlink id="AuthorHyperLink" navigateurl="~/AuthorsList.aspx" text="Add/Edit Author" runat="server" />
        <br />
        <asp:hyperlink id="BookHyperLink" navigateurl="~/BooksList.aspx" text="Add/Edit Books" runat="server" />
    </div>
</asp:Content>
