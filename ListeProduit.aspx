<%@ Page Title="Nouveau Devis" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ListeProduit.aspx.cs" Inherits="ListeProduit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <asp:Label ID="LblNompProjetLabel" runat="server" Text="Nom du projet : "></asp:Label>
        <asp:Label ID="LblNomProjet" runat="server" Text="Nom du projet"></asp:Label>
        <asp:Label ID="lblNomClientLabel" runat="server" Text="Nom du client : "></asp:Label>
        <asp:Label ID="LblNomClient" runat="server" Text="Nom du client"></asp:Label>
         <asp:Label ID="LblPrixLabel" runat="server" Text="Prix : "></asp:Label>
        <asp:Label ID="LblPrix" runat="server" Text="prix"></asp:Label>
        <asp:Panel ID="PnlListeProduit" runat="server" Height="176px">
            <br />
            <asp:ImageButton ID="ImgBtnNouveauProduit" runat="server" ImageUrl="~/Images/add-icon.png" Height="10px" Width="10px" OnClick="ImgBtnNouveauProduit_Click" />
            <asp:Label ID="LblAjouterNouveauProduitLabel" runat="server" Text="Ajouter un nouveau produit"></asp:Label>
        </asp:Panel>
    </div>


</asp:Content>
