<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Accueil.aspx.cs" Inherits="Accueil" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <asp:Button CssClass="btn-block" ID="btnCreerDevis" runat="server" OnClick="btnCreerDevis_Click" Text="Créer un nouveau devis" />
        <br/>
        <asp:Button CssClass="btn-block" ID="btnBrouillonsDevis" runat="server" OnClick="btnBrouillonDevis_Click" Text="Mes brouillons" />
        <br/>
        <asp:Button CssClass="btn-block" ID="btnNouveauClientDevis" runat="server" OnClick="btnNouveauClientDevis_Click" Text="Nouveau Client" />
        <br/>
        <asp:Button CssClass="btn-block" ID="btnEditFicheClientDevis" runat="server" OnClick="btnEditFicheClientDevis_Click" Text="Editer une fiche client" />
    </div>
</asp:Content>
