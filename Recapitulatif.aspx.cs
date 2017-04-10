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

        Devis devis = (Devis) Session["currentDevis"];
        devis = new Devis();
        devis.NomProjet = "nom";
        Produit prod1 = new Produit();
        prod1.Nom = "test";
        Gamme gamme = new Gamme();
        gamme.Nom = "gamme";
        prod1.Gamme = gamme;
        ModeleDeGamme modele = new ModeleDeGamme();
        modele.Nom = "modele";
        prod1.ModeleDeGamme = modele;
        Finition fin1 = new Finition();
        fin1.Nom = "fin";
        TypeFinition type1 = new TypeFinition();
        type1.Nom = "type 1";
        fin1.TypeFinition = type1;
        Finition fin2 = new Finition();
        TypeFinition type2 = new TypeFinition();
        type2.Nom = "type 2";
        fin2.TypeFinition = type2;
        prod1.ListeFinition.Add(fin1);
        prod1.ListeFinition.Add(fin2);
        devis.Produits.Add(prod1);


        foreach (var produit in devis.Produits)
        {
            html.Append("<div class='row'>");
              html.Append("<div class='col-md-9'>");
                html.Append("<h4>Produit : " + produit.Nom+"</h4>");
                html.Append("<div class='row'><div class='col-md-10'><div class='col-md-offset-2'>");
                  html.Append("<h4>Gamme : " + produit.Gamme.Nom+"</4>");
                  html.Append("<div class='row'><div class='col-md-1O col-md-offset-2'>");
                    html.Append("<h4>Modele de Gamme : " + produit.ModeleDeGamme.Nom + "</h4></div></div>");
                  html.Append("<div class='row'><div class='col-md-10 col-md-offset-2'>");
                    html.Append("<h4>Finitions : </h4>");
                    foreach (var finition in produit.ListeFinition)
                    {
                        html.Append("<div class='row'><div class='col-md-12'>");
                        html.Append(finition.TypeFinition.Nom + " : " + finition.Nom);
                        html.Append("</div></div>");
                    }
                  html.Append("</div></div>");
                html.Append("</div></div>");
              html.Append("</div></div>");
            html.Append("</div></div>");
        }

        //TARIF
        DevisService devisService = new DevisService();
        double total =(double) devisService.CalculateEstimatedPrice(devis);

        html.Append("<div class='col-md-3'>");
        html.Append("<h3>Total : " + total+"</h3>");
        html.Append("</div>");
        PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
    }

    protected void btnPdf_Click(object sender, EventArgs e)
    {

    }
}