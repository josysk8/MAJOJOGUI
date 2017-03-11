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
            //myButtonGamme.Text = gamme.
        }

        downPanel.Controls.Add(myPanelGamme);
    }
}