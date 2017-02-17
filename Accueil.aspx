<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Accueil.aspx.cs" Inherits="Accueil" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <asp:Button CssClass="btn-block" ID="BtnCreerDevis" runat="server" OnClick="btnCreerDevis_Click" Text="Créer un nouveau devis" />
        <br/>
        <asp:Button CssClass="btn-block" ID="BtnBrouillonsDevis" runat="server" OnClick="btnBrouillonDevis_Click" Text="Mes brouillons" />
        <br/>
        <asp:Button CssClass="btn-block" ID="BtnNouveauClientDevis" runat="server" OnClick="btnNouveauClientDevis_Click" Text="Nouveau Client" />
        <br/>
        <asp:Button CssClass="btn-block" ID="BtnEditFicheClientDevis" runat="server" OnClick="btnEditFicheClientDevis_Click" Text="Editer une fiche client" />
    </div>
</asp:Content>
