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
            if (!IsPostBack)
            {
                Session["downPanelId"] = null;
                Session["selectedGamme"] = null;
                Session["selectedModeleGamme"] = null;
                Session["selectedFinition"] = null;
            }

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
                int idFinitionToit = (int)Session["selectToitId"];
                Finition fintionToit = finitionRepository.getOne(idFinitionToit);
                produitSelectionne.ListeFinition.Add(fintionToit);

                int idFinitionIntérieure = (int)Session["selectFinitionInterieureId"];
                Finition finitionIntérieure = finitionRepository.getOne(idFinitionIntérieure);
                produitSelectionne.ListeFinition.Add(finitionIntérieure);

                int idFinitionExterieur = (int)Session["selectFinitionExterieureId"];
                Finition finitionExterieur = finitionRepository.getOne(idFinitionExterieur);
                produitSelectionne.ListeFinition.Add(finitionExterieur);

                int idFinitionIsolation = (int)Session["selectIsolationId"];
                Finition finitionIsolation = finitionRepository.getOne(idFinitionIsolation);
                produitSelectionne.ListeFinition.Add(finitionIsolation);

                int idFinitionPlancher = (int)Session["selectPlancherId"];
                Finition finitionPlancher = finitionRepository.getOne(idFinitionPlancher);
                produitSelectionne.ListeFinition.Add(finitionPlancher);

                int idFinitionHuisserie = (int)Session["selectHuisseriesId"];
                Finition finitionHuisserie = finitionRepository.getOne(idFinitionHuisserie);
                produitSelectionne.ListeFinition.Add(finitionHuisserie);

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
                if ((String)Session["downPanelId"] == "panelModule" && Session["selectedFinition"] != null)
                {
                    refreshModulePanel(produitSelectionne.Gamme);
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

        Session["selectedFinition"] = "finitionSelected";
        Session["downPanelId"] = "panelModule";
        refreshModulePanel((Gamme)Session["selectedGamme"]);
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
            myButtonGamme.CssClass = "btn btn-xs btn-primary";
            Panel pan = new Panel();
            pan.Controls.Add(myButtonGamme);
            downPanel.Controls.Add(pan);
        }
    }

    private void refreshModelGammePanel(Gamme selectedGamme)
    {
        downPanel.Controls.Clear();
        foreach (ModeleDeGamme modeleDeGamme in modelGammeRepository.GetByGamme(selectedGamme))
        {
            System.Diagnostics.Debug.WriteLine(modeleDeGamme.Id);
            Button myButtonModelGamme = new Button();
            myButtonModelGamme.Text = modeleDeGamme.Nom;
            myButtonModelGamme.ID = "" + modeleDeGamme.Id;
            myButtonModelGamme.Click += new EventHandler(this.BtnSelectionModeleGamme_Click);
            myButtonModelGamme.CssClass = "btn btn-xs btn-primary";
            Panel pan = new Panel();
            pan.Controls.Add(myButtonModelGamme);
            downPanel.Controls.Add(pan);
        }
    }

    private void refreshFinitionPanel(ModeleDeGamme selectedModeleDeGamme)
    {
        downPanel.Controls.Clear();

        //TODO : get finition by gamme

        //Couverture
        Label labelToit = new Label();
        labelToit.Text = "Couverture";
        labelToit.CssClass = "control-label col-sm-4";
        DropDownList selectToit = new DropDownList();
        selectToit.DataSource = finitionRepository.getByGamme(selectedModeleDeGamme.Gamme).FindAll(i => i.TypeFinition.Nom == "Couverture");
        //selectToit.DataSource = finitionRepository.getByModeleDeGamme(selectedModeleDeGamme).FindAll(i => i.TypeFinition.Nom == "Couverture");
        selectToit.DataTextField = "Nom";
        selectToit.DataValueField = "Id";
        selectToit.DataBind();
        selectToit.ID = "selectToit";
        selectToit.CssClass = "form-control";
        Panel pan = new Panel();
        pan.CssClass = "form-group";

        pan.Controls.Add(labelToit);
        pan.Controls.Add(selectToit);
        downPanel.Controls.Add(pan);

        //Finition intérieure
        Label labelFinitionInterieure = new Label();
        labelFinitionInterieure.Text = "Finition Intérieure";
        labelFinitionInterieure.CssClass = "control-label col-sm-4";
        DropDownList selectFinitionInterieure = new DropDownList();
        selectFinitionInterieure.DataSource = finitionRepository.getByModeleDeGamme(selectedModeleDeGamme).FindAll(i => i.TypeFinition.Nom == "Finition intérieure");
        selectFinitionInterieure.DataTextField = "Nom";
        selectFinitionInterieure.DataValueField = "Id";
        selectFinitionInterieure.DataBind();
        selectFinitionInterieure.ID = "selectFinitionInterieure";
        selectFinitionInterieure.CssClass = "form-control";

        pan = new Panel();
        pan.CssClass = "form-group";
        pan.Controls.Add(labelFinitionInterieure);
        pan.Controls.Add(selectFinitionInterieure);
        downPanel.Controls.Add(pan);

        //Finition extérieure
        Label labelFinitionExterieure = new Label();
        labelFinitionExterieure.Text = "Finition extérieure";
        labelFinitionExterieure.CssClass = "control-label col-sm-4";
        DropDownList selectFinitionExterieure = new DropDownList();
        selectFinitionExterieure.DataSource = finitionRepository.getByModeleDeGamme(selectedModeleDeGamme).FindAll(i => i.TypeFinition.Nom == "Finition extérieure");
        selectFinitionExterieure.DataTextField = "Nom";
        selectFinitionExterieure.DataValueField = "Id";
        selectFinitionExterieure.DataBind();
        selectFinitionExterieure.ID = "selectFinitionExterieure";
        selectFinitionExterieure.CssClass = "form-control";

        pan = new Panel();
        pan.CssClass = "form-group";
        pan.Controls.Add(labelFinitionExterieure);
        pan.Controls.Add(selectFinitionExterieure);
        downPanel.Controls.Add(pan);

        //Isolation
        Label labelIsolation = new Label();
        labelIsolation.Text = "Isolation";
        labelIsolation.CssClass = "control-label col-sm-4";
        DropDownList selectIsolation = new DropDownList();
        selectIsolation.DataSource = finitionRepository.getByModeleDeGamme(selectedModeleDeGamme).FindAll(i => i.TypeFinition.Nom == "Isolation");
        selectIsolation.DataTextField = "Nom";
        selectIsolation.DataValueField = "Id";
        selectIsolation.DataBind();
        selectIsolation.ID = "selectIsolation";
        selectIsolation.CssClass = "form-control";

        pan = new Panel();
        pan.CssClass = "form-group";
        pan.Controls.Add(labelIsolation);
        pan.Controls.Add(selectIsolation);
        downPanel.Controls.Add(pan);

        //Plancher
        Label labelPlancher = new Label();
        labelPlancher.Text = "Plancher";
        labelPlancher.CssClass = "control-label col-sm-4";
        DropDownList selectPlancher = new DropDownList();
        selectPlancher.DataSource = finitionRepository.getByModeleDeGamme(selectedModeleDeGamme).FindAll(i => i.TypeFinition.Nom == "Plancher");
        selectPlancher.DataTextField = "Nom";
        selectPlancher.DataValueField = "Id";
        selectPlancher.DataBind();
        selectPlancher.ID = "selectPlancher";
        selectPlancher.CssClass = "form-control";

        pan = new Panel();
        pan.CssClass = "form-group";
        pan.Controls.Add(labelPlancher);
        pan.Controls.Add(selectPlancher);
        downPanel.Controls.Add(pan);

        //Qualité des huisseries
        Label labelHuisseries = new Label();
        labelHuisseries.Text = "Huisseries";
        labelHuisseries.CssClass = "control-label col-sm-4";
        DropDownList selectHuisseries = new DropDownList();
        selectHuisseries.DataSource = finitionRepository.getByModeleDeGamme(selectedModeleDeGamme).FindAll(i => i.TypeFinition.Nom == "Qualité des huisseries");
        selectHuisseries.DataTextField = "Nom";
        selectHuisseries.DataValueField = "Id";
        selectHuisseries.DataBind();
        selectHuisseries.ID = "selectHuisseries";
        selectHuisseries.CssClass = "form-control";

        pan = new Panel();
        pan.CssClass = "form-group";
        pan.Controls.Add(labelHuisseries);
        pan.Controls.Add(selectHuisseries);
        downPanel.Controls.Add(pan);



        Button validationFinitionButton = new Button();
        validationFinitionButton.Text = "Valider";
        validationFinitionButton.ID = "validationButtonId";
        validationFinitionButton.CssClass = "btn btn-success";
        validationFinitionButton.Click += new EventHandler(this.BtnConfigurerProduit_Click);

        downPanel.Controls.Add(validationFinitionButton);
    }
    private void refreshModulePanel(Gamme gammeSelectionne)
    {
        downPanel.Controls.Clear();
    }
}