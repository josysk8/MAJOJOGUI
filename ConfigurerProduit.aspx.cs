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
        for (int i = 0; i < 10; i++)
        {
            Gamme addGamme = new Gamme();
            addGamme.Nom = "Gamme " + i;
            addGamme.Id = i;
            listeGamme.Add(addGamme);
        }

        if (null != Session["currentProduit"])
        {
            Produit produitSelectionne = (Produit)Session["currentProduit"];
            LblNomProduit.Text = produitSelectionne.Nom;
            if (null != Session["selectedGamme"])
            {
                produitSelectionne.Gamme = (Gamme)Session["selectedGamme"];
            }
        }

    }

    protected void BtnGamme_Click(object sender, EventArgs e)
    {
        Panel myPanelGamme = new Panel();
        myPanelGamme.ID = "panelGamme";
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
        Gamme foundGamme = listeGamme.Find(i => i.Id == int.Parse(BtnSelectionGamme.ID));
        Session["selectedGamme"] = foundGamme;
        System.Diagnostics.Debug.WriteLine("Nom de la gamme : ");
        System.Diagnostics.Debug.WriteLine(foundGamme.Nom);
    }
}