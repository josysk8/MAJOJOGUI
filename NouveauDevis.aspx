<%@ Page Title="Nouveau Devis" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="NouveauDevis.aspx.cs" Inherits="NouveauDevis" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <asp:Label ID="LblNomProjet" runat="server" Text="Nom du projet"></asp:Label>
        <asp:TextBox ID="TxtNomProjet" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="LblClient" runat="server" Text="Nom du client"></asp:Label>
        <asp:DropDownList ID="SelectClient" runat="server" DataSourceID="SelectClientDataSource" DataTextField="Name" DataValueField="Id">
        </asp:DropDownList>
        <asp:ObjectDataSource ID="SelectClientDataSource" runat="server" SelectMethod="GetAll" TypeName="ClientRepository"></asp:ObjectDataSource>
        <br />
        <asp:HyperLink ID="LienNouveauClient" NavigateUrl="/nouveauClient" runat="server">Nouveau Client</asp:HyperLink>
        <br />
        <br />
        <asp:Button ID="BtnRetour" runat="server" Text="Retour" OnClick="btnRetour_Click" />
        <asp:Button ID="BtnConfirmer" runat="server" Text="Confirmer" OnClick="btnConfirmer_Click" />
    </div>
</asp:Content>
