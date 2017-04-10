<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Recapitulatif.aspx.cs" Inherits="Recapitulatif" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            
            <asp:PlaceHolder ID = "PlaceHolder1" runat="server" />

            <div class="row">
                <div class="col-md-3 col-md-offset-9">
                    <asp:Button CssClass="btn-block btn btn-primary" ID="BtnPdf" runat="server" OnClick="btnPdf_Click" Text="Générer Devis" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

