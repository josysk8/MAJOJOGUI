using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConfigurerProduit : System.Web.UI.Page
{
    GammeRepository gammeRepository = new GammeRepository();
    ModeleGammeRepository modelGammeRepository = new ModeleGammeRepository();
    Devis recordedDevis;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (null != Session["currentProduit"])
        {
            recordedDevis = (Devis)Session["currentDevis"];
            int idProduit = (int)Session["currentProduit"];
            Produit produitSelectionne = recordedDevis.Produits.Find(i => i.Id == idProduit);
            LblNomProduit.Text = produitSelectionne.Nom;
            if (null != Session["selectedGamme"])
            {
                produitSelectionne.Gamme = (Gamme)Session["selectedGamme"];
            }

            if (!IsPostBack)
            {
                Session["downPanelId"] = null;
            }

            if (null != Session["downPanelId"])
            {
                if ((String)Session["downPanelId"] == "panelGamme")
                {
                    refreshGammePanel();
                }

                if ((String)Session["downPanelId"] == "panelModelDeGamme" && Session["selectedGamme"] != null)
                {
                    refreshModelGammePanel(produitSelectionne.Gamme);
                }
            }
        }
    }

    protected void BtnGamme_Click(object sender, EventArgs e)
    {
        Session["downPanelId"] = "panelGamme";
        Session["selectedGamme"] = null;
        refreshGammePanel();
    }

    protected void BtnSelectionGamme_Click(object sender, EventArgs e)
    {
        Button BtnSelectionGamme = (Button)sender;
        Gamme foundGamme = gammeRepository.GetOne(int.Parse(BtnSelectionGamme.ID));
        Session["selectedGamme"] = foundGamme;
        Session["downPanelId"] = "panelModelDeGamme";
        refreshModelGammePanel(foundGamme);
    }

    protected void BtnSelectionModeleGamme_Click(object sender, EventArgs e)
    {
        Button BtnSelectionModeleGamme = (Button)sender;
        ModeleDeGamme foundModeleGamme = modelGammeRepository.GetOne(int.Parse(BtnSelectionModeleGamme.ID));
        Session["selectedModeleGamme"] = foundModeleGamme;
        Session["downPanelId"] = "panelFinition";
    }

    private void refreshGammePanel()
    {
        downPanel.Controls.Clear();
        foreach (Gamme gamme in gammeRepository.getAll())
        {
            Button myButtonGamme = new Button();
            myButtonGamme.Text = gamme.Nom;
            myButtonGamme.ID = "" + gamme.Id;
            myButtonGamme.Click += new EventHandler(this.BtnSelectionGamme_Click);
            downPanel.Controls.Add(myButtonGamme);
        }
    }

    private void refreshModelGammePanel(Gamme selectedGamme)
    {
        downPanel.Controls.Clear();
        foreach (ModeleDeGamme modeleDeGamme in modelGammeRepository.GetByGamme(selectedGamme))
        {
            Button myButtonModelGamme = new Button();
            myButtonModelGamme.Text = modeleDeGamme.Nom;
            myButtonModelGamme.ID = "" + modeleDeGamme.Id;
            myButtonModelGamme.Click += new EventHandler(this.BtnSelectionModeleGamme_Click);
            downPanel.Controls.Add(myButtonModelGamme);
        }
    }
}