<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ConfigurerProduit.aspx.cs" Inherits="ConfigurerProduit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <asp:Label ID="LblNomProduit" runat="server" Text="Produit"></asp:Label>
                </div>
                <div class="panel-body">
                    <ul class="nav nav-pills">
                        <li><asp:Button ID="BtnGamme" runat="server" CssClass="btn btn-primary" Text="Gamme" OnClick="BtnGamme_Click" /></li>
                        <li><asp:Button ID="BtnModeleGamme" CssClass="btn btn-primary" runat="server" Text="Modèle de gamme" /></li>
                        <li><asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Finitions" /></li>
                        <li><asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="Modules" /></li>
                    </ul>
                    <asp:Panel ID="downPanel" ScrollBars = "Horizontal" style="overflow:scroll;display:flex" runat="server" Width="500px"></asp:Panel>
                </div>
            </div>
            
        </div>
    </div>
</asp:Content>