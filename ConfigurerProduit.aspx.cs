using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConfigurerProduit : System.Web.UI.Page
{
    ModuleRepository moduleRepository = new ModuleRepository();
    GammeRepository gammeRepository = new GammeRepository();
    ModeleGammeRepository modelGammeRepository = new ModeleGammeRepository();
    FinitionRepository finitionRepository = new FinitionRepository();
    Devis recordedDevis;
    Produit produitSelectionne;
    int moduleSelectedId;
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
            produitSelectionne = recordedDevis.Produits.Find(i => i.Id == idProduit);
            LblNomProduit.Text = produitSelectionne.Nom;

            if (null != Session["selectedGamme"])
            {
                produitSelectionne.Gamme = (Gamme)Session["selectedGamme"];
            }

            if (null != Session["selectedModeleGamme"])
            {
                produitSelectionne.ModeleDeGamme = (ModeleDeGamme)Session["selectedModeleGamme"];
                produitSelectionne.ModeleDeGamme.Id = 0;
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
                    if (ModalTypeModuleDropDownList.SelectedValue != null)
                    {
                        moduleSelectedId = int.Parse(ModalTypeModuleDropDownList.SelectedValue.ToString());
                    }
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

    protected void BtnConfigurerProduit_Click(object sender, EventArgs e)
    {

        DropDownList selectToit = (DropDownList)downPanel.FindControl("selectToit");
        int idFinitionToit = int.Parse(selectToit.SelectedValue);
        Finition finitionToit = finitionRepository.getOne(idFinitionToit);
        produitSelectionne.ModeleDeGamme.Finitions.Add(finitionToit);

        DropDownList selectFinitionInterieure = (DropDownList)downPanel.FindControl("selectFinitionInterieure");
        int idFinitionIntérieure = int.Parse(selectFinitionInterieure.SelectedValue);
        Finition finitionIntérieure = finitionRepository.getOne(idFinitionIntérieure);
        produitSelectionne.ModeleDeGamme.Finitions.Add(finitionIntérieure);

        DropDownList selectFinitionExterieure = (DropDownList)downPanel.FindControl("selectFinitionExterieure");
        int idFinitionExterieur = int.Parse(selectFinitionExterieure.SelectedValue);
        Finition finitionExterieur = finitionRepository.getOne(idFinitionExterieur);
        produitSelectionne.ModeleDeGamme.Finitions.Add(finitionExterieur);

        DropDownList selectIsolation = (DropDownList)downPanel.FindControl("selectIsolation");
        int idFinitionIsolation = int.Parse(selectIsolation.SelectedValue);
        Finition finitionIsolation = finitionRepository.getOne(idFinitionIsolation);
        produitSelectionne.ModeleDeGamme.Finitions.Add(finitionIsolation);

        DropDownList selectPlancher = (DropDownList)downPanel.FindControl("selectPlancher");
        int idFinitionPlancher = int.Parse(selectPlancher.SelectedValue);
        Finition finitionPlancher = finitionRepository.getOne(idFinitionPlancher);
        produitSelectionne.ModeleDeGamme.Finitions.Add(finitionPlancher);

        DropDownList selectHuisseries = (DropDownList)downPanel.FindControl("selectHuisseries");
        int idFinitionHuisserie = int.Parse(selectHuisseries.SelectedValue);
        Finition finitionHuisserie = finitionRepository.getOne(idFinitionHuisserie);
        produitSelectionne.ModeleDeGamme.Finitions.Add(finitionHuisserie);

        Session["selectedFinition"] = "finitionSelected";
        Session["downPanelId"] = "panelModule";
        refreshModulePanel((Gamme)Session["selectedGamme"]);
    }
    protected void BtnModalModule_Click(object sender, EventArgs e)
    {
        Module moduleSelected = moduleRepository.GetOne(moduleSelectedId);
        ModuleCompose moduleCompose = new ModuleCompose();
        moduleSelected.Type = "0";
        moduleCompose.Module = moduleSelected;
        moduleCompose.Identification = TxtModalNomModule.Text;
        moduleCompose.ModeleDeGamme = (ModeleDeGamme)Session["selectedModeleGamme"];
        produitSelectionne.ModeleDeGamme.Modules.Add(moduleCompose);
        refreshModulePanel(produitSelectionne.Gamme);
    }

    protected void ImgBtnDeleteModule_Click(object sender, EventArgs e)
    {
        ImageButton imageButton = (ImageButton)sender;
        produitSelectionne.ModeleDeGamme.Modules = produitSelectionne.ModeleDeGamme.Modules.Where(note => note.Identification != imageButton.ID).ToList();
        refreshModulePanel(produitSelectionne.Gamme);
    }

    private void BtnConfirmProduct_Click(object sender, EventArgs e)
    {
        Session["currentDevis"] = recordedDevis;
        Response.Redirect("ListeProduit.aspx");
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
        selectFinitionInterieure.DataSource = finitionRepository.getByGamme(selectedModeleDeGamme.Gamme).FindAll(i => i.TypeFinition.Nom == "Finition intérieure");
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
        selectFinitionExterieure.DataSource = finitionRepository.getByGamme(selectedModeleDeGamme.Gamme).FindAll(i => i.TypeFinition.Nom == "Finition extérieure");
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
        selectIsolation.DataSource = finitionRepository.getByGamme(selectedModeleDeGamme.Gamme).FindAll(i => i.TypeFinition.Nom == "Isolation");
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
        selectPlancher.DataSource = finitionRepository.getByGamme(selectedModeleDeGamme.Gamme).FindAll(i => i.TypeFinition.Nom == "Plancher");
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
        selectHuisseries.DataSource = finitionRepository.getByGamme(selectedModeleDeGamme.Gamme).FindAll(i => i.TypeFinition.Nom == "Qualité des huisseries");
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

        Button ajouterModuleButton = new Button();
        ajouterModuleButton.ID = "ajouterModuleButton";
        ajouterModuleButton.Text = "Ajouter un nouveau module";
        ajouterModuleButton.Attributes["data-toggle"] = "modal";
        ajouterModuleButton.Attributes["data-target"] = "#myModal";
        ajouterModuleButton.CssClass = "btn btn-xs btn-primary";

        AjaxControlToolkit.ModalPopupExtender buttonModalPopup = new AjaxControlToolkit.ModalPopupExtender();
        buttonModalPopup.ID = "mpe";
        buttonModalPopup.TargetControlID = ajouterModuleButton.ID;
        buttonModalPopup.PopupControlID = "ModalPanel";
        buttonModalPopup.OkControlID = "OKButton";

        
        ModalTypeModuleDropDownList.DataSource = moduleRepository.GetByGamme(gammeSelectionne);
        ModalTypeModuleDropDownList.DataTextField = "Nom";
        ModalTypeModuleDropDownList.DataValueField = "Id";
        ModalTypeModuleDropDownList.EnableViewState = true;
        ModalTypeModuleDropDownList.DataBind();

        foreach (ModuleCompose module in produitSelectionne.ModeleDeGamme.Modules)
        {
            if(module.Module.Type == "0")
            {
                Panel panelModule = new Panel();

                Label newModuleLabel = new Label();
                newModuleLabel.Text = module.Identification;
                panelModule.Controls.Add(newModuleLabel);

                ImageButton deleteButton = new ImageButton();
                deleteButton.ImageUrl = "Images/cancel-icon.png";
                deleteButton.Height = 10;
                deleteButton.Width = 10;
                deleteButton.ID = module.Identification;
                deleteButton.Click += new ImageClickEventHandler(this.ImgBtnDeleteModule_Click);
                panelModule.Controls.Add(deleteButton);
                downPanel.Controls.Add(panelModule);
            }
        }

        Button confirmProduit = new Button();
        confirmProduit.Text = "Terminer";
        confirmProduit.CssClass = "btn btn-xs btn-primary";
        confirmProduit.Click += new EventHandler(this.BtnConfirmProduct_Click);


        Panel pan = new Panel();
        pan.Controls.Add(ajouterModuleButton);
        pan.Controls.Add(buttonModalPopup);
        pan.Controls.Add(confirmProduit);
        downPanel.Controls.Add(pan);
    }

   
}