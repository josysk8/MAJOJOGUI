<%@ Page Title="Nouveau Devis" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="NouveauDevis.aspx.cs" Inherits="NouveauDevis" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <asp:Label ID="lblNomProjet" runat="server" Text="Nom du projet"></asp:Label>
        <asp:TextBox ID="txtNomProjet" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblClient" runat="server" Text="Nom du client"></asp:Label>
        <asp:DropDownList ID="selectClient" runat="server">
        </asp:DropDownList>
        <br />
        <asp:HyperLink ID="lienNouveauClient" runat="server">Nouveau Client</asp:HyperLink>
        <br />
        <br />
        <asp:Button ID="btnRetour" runat="server" Text="Retour" OnClick="btnRetour_Click" />
        <asp:Button ID="btnConfirmer" runat="server" Text="Confirmer" OnClick="btnConfirmer_Click" />
    </div>
</asp:Content>
