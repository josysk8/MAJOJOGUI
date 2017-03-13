<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ConfigurerProduit.aspx.cs" Inherits="ConfigurerProduit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel ID="Panel" runat="server">

        <asp:Label ID="LblNomProduit" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Button ID="BtnGamme" runat="server" Text="Gamme" OnClick="BtnGamme_Click" />
        <asp:Button ID="BtnModeleGamme" runat="server" Text="Modèle de gamme" />
        <asp:Button ID="BtnCoupePrincipe" runat="server" Text="Coupe de principe" />
        <asp:Button ID="BtnModule" runat="server" Text="Modules" />
        <asp:Button ID="BtnFinition" runat="server" Text="Finitions" />
    </asp:Panel>
    <asp:Panel ID="downPanel" ScrollBars = "Horizontal" style="overflow:scroll;display:flex" runat="server" Width="500px"></asp:Panel>
</asp:Content>