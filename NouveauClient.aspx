<%@ Page Title="Nouveau Client" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="NouveauClient.aspx.cs" Inherits="NouveauClient" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <asp:Label ID="LblNomClient" runat="server" Text="Nom du Client"></asp:Label>
        <asp:TextBox ID="TxtNomCLient" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Situation Matrimoniale" runat="server" Text="Nom du Client"></asp:Label>
        <asp:TextBox ID="TxtMatrimoniale" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="LblTelephoneClient" runat="server" Text="Telephone : "></asp:Label>
        <asp:TextBox ID="TxtTelephoneClient" runat="server"></asp:TextBox>     
        <br />
        <asp:Label ID="LblEmailClient" runat="server" Text="Email : "></asp:Label>
        <asp:TextBox ID="TxtEmailClient" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="LblAdresseClient" runat="server" Text="Adresse : "></asp:Label>
        <asp:TextBox ID="TxtAdressseClient" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="LblAdresse2Client" runat="server" Text="Adresse 2 : "></asp:Label>
        <asp:TextBox ID="TxtAdresse2Client" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="LblCpClient" runat="server" Text="Code postal : "></asp:Label>
        <asp:TextBox ID="TxtCpClient" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="LblVilleClient" runat="server" Text="Ville : "></asp:Label>
        <asp:TextBox ID="TxtVilleClient" runat="server"></asp:TextBox>
        
        <br />
        <asp:Button ID="BtnRetour" runat="server" Text="Retour" OnClick="BtnRetour_Click" />
        <asp:Button ID="BtnConfirmer" runat="server" Text="Confirmer" OnClick="BtnConfirmer_Click"  />
    </div>
</asp:Content>
