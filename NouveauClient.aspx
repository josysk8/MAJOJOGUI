<%@ Page Title="Nouveau Client" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="NouveauClient.aspx.cs" Inherits="NouveauClient" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
                <div class="form-group">
                    <asp:Label ID="LblNomClient" CssClass="control-label col-sm-5" runat="server" Text="Nom du Client"></asp:Label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="TxtNomCLient" Css Class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="LblSituationMat" CssClass="control-label col-sm-5" runat="server" Text="Situation Matrimoniale"></asp:Label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="TxtMatrimoniale" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="LblTelephoneClient" CssClass="control-label col-sm-5" runat="server" Text="Telephone"></asp:Label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="TxtTelephoneClient" type="tel" CssClass="form-control" runat="server"></asp:TextBox>
                    </div> 
                </div>
                <div class="form-group">
                    <asp:Label ID="LblEmailClient" CssClass="control-label col-sm-5" runat="server" Text="Email"></asp:Label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="TxtEmailClient" type="email" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="LblAdresseClient" CssClass="control-label col-sm-5" runat="server" Text="Adresse"></asp:Label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="TxtAdressseClient" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="LblAdresse2Client" CssClass="control-label col-sm-5" runat="server" Text="Adresse 2"></asp:Label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="TxtAdresse2Client" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="LblCpClient" CssClass="control-label col-sm-5" runat="server" Text="Code postal"></asp:Label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="TxtCpClient" ValidationExpression="^[0-9]{5}$" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="for-group">
                    <asp:Label ID="LblVilleClient" CssClass="control-label col-sm-5" runat="server" Text="Ville"></asp:Label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="TxtVilleClient" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-6 text-center">
                        <asp:Button ID="BtnRetour" CssClass="btn btn-error" runat="server" Text="Retour" OnClick="BtnRetour_Click" />
                    </div>
                    <div class="col-sm-6 text-center">
                        <asp:Button ID="BtnConfirmer" CssClass="btn btn-success" runat="server" Text="Confirmer" OnClick="BtnConfirmer_Click"  />
                    </div>
                </div>
        </div>        
    </div>
</asp:Content>
