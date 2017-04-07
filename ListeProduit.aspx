<%@ Page Title="Nouveau Devis" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ListeProduit.aspx.cs" Inherits="ListeProduit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="form-group">
                <asp:Label ID="LblNompProjetLabel" runat="server" CssClass="control-label col-sm-5" Text="Nom du projet"></asp:Label>
                <div class="col-sm-7">
                    <asp:Label ID="LblNomProjet" runat="server" CssClass="form-control" Text="Nom du projet"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblNomClientLabel" runat="server" CssClass="control-label col-sm-5" Text="Nom du client"></asp:Label>
                <div class="col-sm-7">
                    <asp:Label ID="LblNomClient" runat="server" CssClas="form-control" Text="Nom du client"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="LblPrixLabel" runat="server" CssClass="control-label col-sm-5" Text="Prix"></asp:Label>
                <div class="col-sm-7">
                    <asp:Label ID="LblPrix" runat="server" CssClass="form-control" Text="prix"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-6 text-center">
                    <asp:ImageButton ID="BtnClearProduit" CssClass="btn btn-error" runat="server" OnClick="BtnClearProduit_Click" ImageUrl="~/Images/cancel-icon.png" Height="10px" Width="10px" />
                </div>
                <div class="col-md-6 text-center">

                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="LblAjouterNouveauProduitLabel" CssClass="control-label col-sm-5" runat="server" Text="Ajouter un nouveau produit"></asp:Label>
                <div class="col-sm-7">
                    <asp:ImageButton ID="ImgBtnNouveauProduit" CssClass="btn btn-primary" runat="server" ImageUrl="~/Images/add-icon.png" Height="10px" Width="10px" OnClick="ImgBtnNouveauProduit_Click" />
                </div>
            </div>
        </div>
        
        
        
        
        
        
        
        <asp:Panel ID="PnlListeProduit" runat="server" Height="176px">
            <br />
        </asp:Panel>
            
            
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
