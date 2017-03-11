using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConfigurerProduit : System.Web.UI.Page
{
    List<Gamme> listeGamme = new List<Gamme>();
    protected void Page_Load(object sender, EventArgs e)
    {
        for (int i =0; i < 10; i++)
        {
            Gamme addGamme = new Gamme();
            addGamme.Nom = "Gamme " + i;
            addGamme.Id = i;
            listeGamme.Add(addGamme);
        }

        if (null != Session["currentProduit"])
        {
            PRODUIT produitSelectionne = (PRODUIT)Session["currentProduit"];
            LblNomProduit.Text = produitSelectionne.PRODUIT_NOM;
        }
    }

    protected void BtnGamme_Click(object sender, EventArgs e)
    {
        Panel myPanelGamme = new Panel();
        foreach (Gamme gamme in listeGamme)
        {
            Button myButtonGamme = new Button();
            myButtonGamme.Text = gamme.Nom;
            myButtonGamme.ID = "" + gamme.Id;
            myButtonGamme.Click += new EventHandler(this.BtnSelectionGamme_Click);
            myPanelGamme.Controls.Add(myButtonGamme);
        }

        downPanel.Controls.Add(myPanelGamme);
    }

    protected void BtnSelectionGamme_Click(object sender, EventArgs e)
    {
        Button BtnSelectionGamme = (Button)sender;
        BtnSelectionGamme.Text = "cliquer";
    }
}