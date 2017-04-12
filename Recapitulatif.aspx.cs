using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Recapitulatif : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        StringBuilder html = new StringBuilder();
        DevisService devisService = new DevisService();
        Devis devis = (Devis)Session["currentDevis"];

        foreach (var produit in devis.Produits)
        {
            html.Append("<div class='row'>");
            html.Append("<div class='col-md-10'>");
            html.Append("<h4>Produit : " + produit.Nom + "</h4>");
            html.Append("<div class='row'><div class='col-md-10'><div class='col-md-offset-2'>");
            html.Append("<h4>Gamme : " + produit.Gamme.Nom + "</4>");
            html.Append("<div class='row'><div class='col-md-1O col-md-offset-2'>");
            html.Append("<h4>Modele de Gamme : " + produit.ModeleDeGamme.Nom + "</h4></div></div>");
            html.Append("<div class='row'><div class='col-md-10 col-md-offset-2'>");
            html.Append("<h4>Finitions : </h4>");
            foreach (var finition in produit.ModeleDeGamme.Finitions)
            {
                html.Append("<div class='row'><div class='col-md-12'>");
                html.Append(finition.TypeFinition.Nom + " : " + finition.Nom);
                html.Append("</div></div>");
            }
            html.Append("</div></div>");
            html.Append("<div class='row'><div class='col-md-10 col-md-offset-2'>");
            html.Append("<h4>Modules : </h4>");
            foreach (var module in produit.ModeleDeGamme.Modules)
            {
                html.Append("<div class='row'><div class='col-md-12'>");
                html.Append(module.Module.TypeModule.Nom + " : " + module.Module.Nom + "<br>");
                html.Append("Hauteur : " + module.Hauteur + "<br/>");
                html.Append("Longueur : " + module.Longueur + "<br/>");
                html.Append("Prix : " + devisService.GetPriceOfModule(module.Module) + " Euros<br/>");
                html.Append("Identification : " + module.Identification + "<br/><br/>");
            }
            html.Append("</div></div>");
            html.Append("</div></div>");
            html.Append("</div></div>");
            html.Append("</div></div>");
        }

        //TARIF

        double total = (double)devisService.CalculateEstimatedPrice(devis);
        decimal? prixFinal = devis.EstimationPrix;
        decimal? remise = ((decimal)total) - prixFinal;

        html.Append("<div class='col-md-2'>");
        html.Append("<h3>Total : " + total + " Euros</h3>");
        if (remise > 0)
        {
            html.Append("<h3> - " + remise + " Euros de remise</h3>");
            html.Append("<h3>Total avec remise: " + prixFinal + " Euros</h3>");
        }

        html.Append("</div>");
        PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
    }

    protected void btnPdf_Click(Object sender, EventArgs e)
    {
        try
        {
            DevisService devisService = new DevisService();
            Document pdfDoc = new Document(PageSize.A4, 25, 10, 25, 10);
            PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            Paragraph Text = new Paragraph("Récapitulatif du Devis");
            pdfDoc.Add(Text);

            Devis devis = (Devis)Session["currentDevis"];

            Paragraph client = new Paragraph("Client : " + devis.Client.Name + "(" + devis.Client.Reference + ")\n\n\n");
            pdfDoc.Add(client);
            pdfDoc.Add(new Paragraph("Prix total : " + devis.EstimationPrix + " Euros\n\n\n"));
            pdfDoc.Add(new Paragraph("Liste des produits : \n\n"));
            Paragraph produits = new Paragraph();
            foreach (var produit in devis.Produits)
            {
                Paragraph mainProduct = new Paragraph();
                mainProduct.Add("Produit : " + produit.Nom + "\n");
                mainProduct.Add("-    Gamme : " + produit.Gamme.Nom + "\n");
                mainProduct.Add("-        Modèle de Gamme : " + produit.ModeleDeGamme.Nom + "\n");
                mainProduct.Add("-        Finitions : " + "\n");
                List finitions = new List();
                foreach (var finition in produit.ModeleDeGamme.Finitions)
                {
                    finitions.Add("-            " + finition.TypeFinition.Nom + " : " + finition.Nom);
                }
                mainProduct.Add(finitions);
                mainProduct.Add("-        Modules : \n");
                List modules = new List();
                foreach (var module in produit.ModeleDeGamme.Modules)
                {
                    Paragraph modPar = new Paragraph();
                    modules.Add(module.Module.TypeModule.Nom + " : " + module.Module.Nom + "\n");
                    modules.Add("Hauteur : " + module.Hauteur + "\n");
                    modules.Add("Longueur : " + module.Longueur + "\n");
                    modules.Add("Prix : " + devisService.GetPriceOfModule(module.Module) + "\n");
                    modules.Add("Identification : " + module.Identification + "\n\n\n");

                }
                mainProduct.Add(modules);
                produits.Add(mainProduct);
            }
            pdfDoc.Add(produits);


            pdfWriter.CloseStream = false;
            pdfDoc.Close();
            Response.Buffer = true;
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Example.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Write(pdfDoc);
            Response.End();
        }
        catch (Exception ex)
        { Response.Write(ex.Message); }
    }
}