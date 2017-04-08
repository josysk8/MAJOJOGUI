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
                    <asp:ImageButton ID="BtnClearProduit" CssClass="btn btn-danger" runat="server" OnClick="BtnClearProduit_Click" Text="Annuler" />
                </div>
                <div class="col-md-6 text-center">

                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-12 text-center">
                    <asp:Button ID="ImgBtnNouveauProduit" CssClass="btn btn-primary" data-toggle="modal" data-target="#myModal" runat="server" Text="Ajouter un nouveau produit" />
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Liste des produits
                </div>
                <div class="panel-body">
                    <asp:Panel ID="PnlListeProduit" runat="server" >
                    <br />
                    </asp:Panel>
                </div>
            </div>
        </div>       
    </div>


    <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Nouveau produit</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:Label ID="LblModalNomProduitLabel" CssClass="control-label col-sm-5" runat="server" Text="Nom du produit"></asp:Label>
                        <div class="col-sm-7" >
                            <asp:TextBox ID="TxtModalNomProduit" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-6 text-center"> <asp:Button ID="BtnModalAnnuler" CssClass="btn btn-error" runat="server" Text="Annuler" /> </div>
                        <div class="col-sm-6 text-center"> <asp:Button ID="BtnModalConfirmer" CssClass="btn btn-success" runat="server" Text="Confirmer" OnClick="BtnModalConfirmer_Click" /></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    

    <ajaxToolkit:ModalPopupExtender ID="mpe" runat="server"
        TargetControlID="ImgBtnNouveauProduit" PopupControlID="ModalPanel"
        OkControlID="OKButton" />
</asp:Content>
