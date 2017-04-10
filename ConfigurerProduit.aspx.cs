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
    FinitionRepository finitionRepository = new FinitionRepository();
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

            if (null != Session["selectedModeleGamme"])
            {
                produitSelectionne.ModeleDeGamme = (ModeleDeGamme)Session["selectedModeleGamme"];
            }

            if (null != Session["selectedFinition"])
            {
                Session["selectToitId"];
                Session["selectFinitionInterieureId"];
                Session["selectFinitionExterieureId"];
                Session["selectIsolationId"];
                Session["selectPlancherId"];
                Session["selectHuisseriesId"];
                //produitSelectionne.ListeFinition.Add()
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
                if ((String)Session["downPanelId"] == "panelFinition" && Session["selectedModeleGamme"] != null)
                {
                    refreshFinitionPanel(produitSelectionne.ModeleDeGamme);
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
        refreshFinitionPanel(foundModeleGamme);
    }

    private void BtnConfigurerProduit_Click(object sender, EventArgs e)
    {

        DropDownList selectToit = (DropDownList)downPanel.FindControl("selectToit");
        Session["selectToitId"] = selectToit.SelectedValue;

        DropDownList selectFinitionInterieure = (DropDownList)downPanel.FindControl("selectFinitionInterieure");
        Session["selectFinitionInterieureId"] = selectFinitionInterieure.SelectedValue;

        DropDownList selectFinitionExterieure = (DropDownList)downPanel.FindControl("selectFinitionExterieure");
        Session["selectFinitionExterieureId"] = selectFinitionExterieure.SelectedValue;

        DropDownList selectIsolation = (DropDownList)downPanel.FindControl("selectIsolation");
        Session["selectIsolationId"] = selectIsolation.SelectedValue;

        DropDownList selectPlancher = (DropDownList)downPanel.FindControl("selectPlancher");
        Session["selectPlancherId"] = selectPlancher.SelectedValue;

        DropDownList selectHuisseries = (DropDownList)downPanel.FindControl("selectHuisseries");
        Session["selectHuisseriesId"] = selectHuisseries.SelectedValue;

        Session["downPanelId"] = "panelModule";
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

    private void refreshFinitionPanel(ModeleDeGamme selectedModeleDeGamme)
    {
        downPanel.Controls.Clear();

        //Couverture
        Label labelToit = new Label();
        labelToit.Text = "Couverture";
        DropDownList selectToit = new DropDownList();
        selectToit.DataSource = finitionRepository.getByModeleDeGamme(selectedModeleDeGamme).FindAll(i => i.TypeFinition.Nom == "Couverture");
        selectToit.DataTextField = "Nom";
        selectToit.DataValueField = "Id";
        selectToit.DataBind();
        selectToit.ID = "selectToit";

        downPanel.Controls.Add(labelToit);
        downPanel.Controls.Add(selectToit);

        //Finition intérieure
        Label labelFinitionInterieure = new Label();
        labelFinitionInterieure.Text = "Finition Intérieure";
        DropDownList selectFinitionInterieure = new DropDownList();
        selectFinitionInterieure.DataSource = finitionRepository.getByModeleDeGamme(selectedModeleDeGamme).FindAll(i => i.TypeFinition.Nom == "Finition intérieure");
        selectFinitionInterieure.DataTextField = "Nom";
        selectFinitionInterieure.DataValueField = "Id";
        selectFinitionInterieure.DataBind();
        selectFinitionInterieure.ID = "selectFinitionInterieure";

        downPanel.Controls.Add(labelFinitionInterieure);
        downPanel.Controls.Add(selectFinitionInterieure);

        //Finition extérieure
        Label labelFinitionExterieure = new Label();
        labelFinitionExterieure.Text = "Finition extérieure";
        DropDownList selectFinitionExterieure = new DropDownList();
        selectFinitionExterieure.DataSource = finitionRepository.getByModeleDeGamme(selectedModeleDeGamme).FindAll(i => i.TypeFinition.Nom == "Finition extérieure");
        selectFinitionExterieure.DataTextField = "Nom";
        selectFinitionExterieure.DataValueField = "Id";
        selectFinitionExterieure.DataBind();
        selectFinitionExterieure.ID = "selectFinitionExterieure";

        downPanel.Controls.Add(labelFinitionExterieure);
        downPanel.Controls.Add(selectFinitionExterieure);

        //Isolation
        Label labelIsolation = new Label();
        labelIsolation.Text = "Finition extérieure";
        DropDownList selectIsolation = new DropDownList();
        selectIsolation.DataSource = finitionRepository.getByModeleDeGamme(selectedModeleDeGamme).FindAll(i => i.TypeFinition.Nom == "Isolation");
        selectIsolation.DataTextField = "Nom";
        selectIsolation.DataValueField = "Id";
        selectIsolation.DataBind();
        selectIsolation.ID = "selectIsolation";

        downPanel.Controls.Add(labelIsolation);
        downPanel.Controls.Add(selectIsolation);

        //Plancher
        Label labelPlancher = new Label();
        labelPlancher.Text = "Finition extérieure";
        DropDownList selectPlancher = new DropDownList();
        selectPlancher.DataSource = finitionRepository.getByModeleDeGamme(selectedModeleDeGamme).FindAll(i => i.TypeFinition.Nom == "Plancher");
        selectPlancher.DataTextField = "Nom";
        selectPlancher.DataValueField = "Id";
        selectPlancher.DataBind();
        selectPlancher.ID = "selectPlancher";

        downPanel.Controls.Add(labelPlancher);
        downPanel.Controls.Add(selectPlancher);

        //Qualité des huisseries
        Label labelHuisseries = new Label();
        labelHuisseries.Text = "Finition extérieure";
        DropDownList selectHuisseries = new DropDownList();
        selectHuisseries.DataSource = finitionRepository.getByModeleDeGamme(selectedModeleDeGamme).FindAll(i => i.TypeFinition.Nom == "Qualité des huisseries");
        selectHuisseries.DataTextField = "Nom";
        selectHuisseries.DataValueField = "Id";
        selectHuisseries.DataBind();
        selectHuisseries.ID = "selectHuisseries";

        downPanel.Controls.Add(labelHuisseries);
        downPanel.Controls.Add(selectHuisseries);

        Button validationFinitionButton = new Button();
        validationFinitionButton.Text = "Valider";
        validationFinitionButton.Click += new EventHandler(this.BtnConfigurerProduit_Click);

        downPanel.Controls.Add(validationFinitionButton);
    }
}