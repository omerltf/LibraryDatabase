<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LibraryAdd.aspx.cs" Inherits="Library.LibraryAdd" %>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <h2>Add Library</h2>

    <fieldset>

        <div>
            <asp:label id="BranchNameLabel" runat="server" associatedcontrolid="BranchName" text="Branch Name: " />
            <asp:textbox id="BranchName" runat="server" />
        </div>

        <div>
            <asp:label id="StreetAddressLabel" runat="server" associatedcontrolid="StreetAddress" text="Street Address: " />
            <asp:textbox id="StreetAddress" runat="server" />
        </div>

        <div>
            <asp:label id="CityLabel" runat="server" associatedcontrolid="City" text="City: " />
            <asp:textbox id="City" runat="server" />
        </div>

        <div>
            <asp:label id="StateLabel" runat="server" associatedcontrolid="State" text="State: " />
            <asp:textbox id="State" runat="server" />
        </div>

        <div>
            <asp:label id="CountryLabel" runat="server" associatedcontrolid="Country" text="Country: " />
            <asp:textbox id="Country" runat="server" />
        </div>

        <div>
            <asp:label id="ZipCodeLabel" runat="server" associatedcontrolid="ZipCodeLabel" text="Zip Code: " />
            <asp:textbox id="ZipCode" runat="server" />
        </div>

    </fieldset>

    <div>
        <asp:button id="Save" runat="server" text="Save" onclick="Save_Click" />
    </div>

</asp:Content>
