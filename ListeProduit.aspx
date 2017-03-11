<%@ Page Title="Nouveau Devis" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ListeProduit.aspx.cs" Inherits="ListeProduit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <asp:Label ID="LblNompProjetLabel" runat="server" Text="Nom du projet : "></asp:Label>
        <asp:Label ID="LblNomProjet" runat="server" Text="Nom du projet"></asp:Label>
        <asp:Label ID="lblNomClientLabel" runat="server" Text="Nom du client : "></asp:Label>
        <asp:Label ID="LblNomClient" runat="server" Text="Nom du client"></asp:Label>
        <asp:Label ID="LblPrixLabel" runat="server" Text="Prix : "></asp:Label>
        <asp:Label ID="LblPrix" runat="server" Text="prix"></asp:Label>
        <asp:ImageButton ID="BtnClearProduit" runat="server" OnClick="BtnClearProduit_Click" ImageUrl="~/Images/cancel-icon.png" Height="10px" Width="10px" />
        <asp:Panel ID="PnlListeProduit" runat="server" Height="176px">
            <br />
        </asp:Panel>
            <asp:ImageButton ID="ImgBtnNouveauProduit" runat="server" ImageUrl="~/Images/add-icon.png" Height="10px" Width="10px" OnClick="ImgBtnNouveauProduit_Click" />
            <asp:Label ID="LblAjouterNouveauProduitLabel" runat="server" Text="Ajouter un nouveau produit"></asp:Label>
    </div>

    <asp:Panel ID="ModalPanel" runat="server" Width="500px">
        <asp:Panel runat="server" ID="ModalContent" CssClass="Modal">
            &nbsp;<asp:Label ID="LblModalNouveauProduitTitre" runat="server" Text="Nouveau Produit"></asp:Label>
            <br />
            <asp:Label ID="LblModalNomProduitLabel" runat="server" Text="Nom du produit"></asp:Label>
            <asp:TextBox ID="TxtModalNomProduit" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="BtnModalAnnuler" runat="server" Text="Annuler" />
            <asp:Button ID="BtnModalConfirmer" runat="server" Text="Confirmer" OnClick="BtnModalConfirmer_Click" />
        </asp:Panel>
    </asp:Panel>

    <ajaxToolkit:ModalPopupExtender ID="mpe" runat="server"
        TargetControlID="ImgBtnNouveauProduit" PopupControlID="ModalPanel"
        OkControlID="OKButton" />
</asp:Content>
