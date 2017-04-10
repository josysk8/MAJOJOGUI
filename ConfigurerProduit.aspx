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
                    <asp:Panel ID="downPanel" ScrollBars = "Horizontal" style="overflow:scroll;" runat="server" Width="500px"></asp:Panel>
                </div>
            </div>
            
        </div>
    </div>


    <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Nouveau module</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:Label ID="LblModalNomModuleLabel" CssClass="control-label col-sm-5" runat="server" Text="Nom du module"></asp:Label>
                        <div class="col-sm-7" >
                            <asp:TextBox ID="TxtModalNomModule" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                       <asp:Label ID="LblModalTypeModuleLabel" CssClass="control-label col-sm-5" runat="server" Text="Type du module"></asp:Label>
                        <div class="col-sm-7" >
                            <asp:DropDownList ID="ModalTypeModuleDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-6 text-center"> <asp:Button ID="BtnModalAnnuler" CssClass="btn btn-error" runat="server" Text="Annuler" /> </div>
                        <div class="col-sm-6 text-center"> <asp:Button ID="BtnModalConfirmer" CssClass="btn btn-success" runat="server" Text="Confirmer" OnClick="BtnModalModule_Click" /></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>