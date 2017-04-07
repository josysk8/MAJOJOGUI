<%@ Page Title="Nouveau Devis" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="NouveauDevis.aspx.cs" Inherits="NouveauDevis" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="form-group">
                <asp:Label ID="LblNomProjet" runat="server" CssClass="control-label col-sm-5" Text="Nom du projet"></asp:Label>
                <div class="col-sm-7">
                    <asp:TextBox ID="TxtNomProjet" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="LblClient" runat="server" CssClass="control-label col-sm-5" Text="Nom du client"></asp:Label>
                <div class="col-sm-7">
                    <asp:DropDownList ID="SelectClient" runat="server" CssClass="form-control" DataSourceID="SelectClientDataSource" DataTextField="Name" DataValueField="Id">
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="SelectClientDataSource" runat="server" SelectMethod="GetAll" TypeName="ClientRepository"></asp:ObjectDataSource>
                </div>
                <asp:HyperLink ID="LienNouveauClient" NavigateUrl="/nouveauClient" CssClass="btn btn-sm btn-primary" runat="server">Nouveau Client</asp:HyperLink>
            </div>
            <div class="form-group">
                <div class="col-sm-6 text-center">
                    <asp:Button ID="BtnRetour" CssClass="btn btn-error" runat="server" Text="Retour" OnClick="btnRetour_Click" />
                </div>
                <div class="col-sm-6 text-center">
                    <asp:Button ID="BtnConfirmer" CssClass="btn btn-success" runat="server" Text="Confirmer" OnClick="btnConfirmer_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
