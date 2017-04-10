<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Accueil.aspx.cs" Inherits="Accueil" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="form-group">
                    <asp:Button CssClass="btn-block btn btn-primary" ID="BtnCreerDevis" runat="server" OnClick="btnCreerDevis_Click" Text="Créer un nouveau devis" />
                </div>
                <div class="form-group">
                    <asp:Button CssClass="btn-block btn btn-primary" ID="BtnBrouillonsDevis" runat="server" OnClick="btnBrouillonDevis_Click" Text="Mes brouillons" />
                </div>
                <div class="form-group">
                    <asp:Button CssClass="btn-block btn btn-primary" ID="BtnNouveauClientDevis" runat="server" OnClick="btnNouveauClientDevis_Click" Text="Nouveau Client" />
                </div>
                <div class="form-group">
                    <asp:Button CssClass="btn-block btn btn-primary" ID="BtnEditFicheClientDevis" runat="server" OnClick="btnEditFicheClientDevis_Click" Text="Editer une fiche client" />
                </div>    
            </div>
        </div>
</asp:Content>
