using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListeProduit : System.Web.UI.Page
{
    Dictionary<string, Panel> produits = new Dictionary<string, Panel>();
    Devis recordedDevis;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (null != Session["currentDevis"])
        {
            recordedDevis = (Devis)Session["currentDevis"];
            LblNomProjet.Text = recordedDevis.NomProjet;
            LblNomClient.Text = recordedDevis.Client.Name;
            if (recordedDevis.EstimationPrix == null)
            {
                recordedDevis.EstimationPrix = 0;
            }
            LblPrix.Text = recordedDevis.EstimationPrix.ToString();
        }

        if (null != Session["panelContent"])
        {
            refreshProductPanel();
        }
    }

    protected void ImgBtnNouveauProduit_Click(object sender, ImageClickEventArgs e)
    {
        refreshProductPanel();
    }

    protected void BtnModalConfirmer_Click(object sender, EventArgs e)
    {
        Panel myPanel = new Panel();
        String nextKey = "" + (Int32)(DateTime.UtcNow.Subtract(new DateTime(1970, 1, 1))).TotalSeconds;
        myPanel.ID = nextKey;

        Button myEditButton = new Button();
        myEditButton.Text = TxtModalNomProduit.Text;
        myEditButton.CssClass = "btn btn-sm btn-primary";

        ImageButton myDeleteButton = new ImageButton();
        myDeleteButton.ImageUrl = "Images/cancel-icon.png";
        myDeleteButton.Height = 10;
        myDeleteButton.Width = 10;

        myPanel.Controls.Add(myEditButton);
        myPanel.Controls.Add(myDeleteButton);

        produits.Add(nextKey, myPanel);
        Session["panelContent"] = produits;
        Session["currentDevis"] = recordedDevis;

        refreshProductPanel();
    }

    protected void BtnConfigurerProduit_Click(object sender, EventArgs e)
    {
        Button button = (Button)sender;

        string idProduit = button.Parent.ID;

        Produit produitEnvoy = new Produit();
        produitEnvoy.Id = int.Parse(idProduit);
        produitEnvoy.Nom = button.Text;

        recordedDevis.Produits.Add(produitEnvoy);
        Session["currentProduit"] = produitEnvoy.Id;
        Session["currentDevis"] = recordedDevis;
        Response.Redirect("ConfigurerProduit.aspx");
    }

    protected void ImgBtnDelete_Click(object sender, EventArgs e)
    {
        ImageButton button = (ImageButton)sender;

        string idProduit = button.Parent.ID;
        produits.Remove(idProduit);
        Session["panelContent"] = produits;
        refreshProductPanel();
    }

    protected void BtnClearProduit_Click(object sender, EventArgs e)
    {
        PnlListeProduit.Controls.Clear();
        produits.Clear();
        Session["panelContent"] = null;
    }

    //fonction qui refresh le panel de produits
    private void refreshProductPanel()
    {
        produits = (Dictionary<string, Panel>)Session["panelContent"];
        PnlListeProduit.Controls.Clear();
        if (recordedDevis.Produits != null)
        {
            recordedDevis.Produits.Clear();
        }
        foreach (KeyValuePair<string, Panel> produit in produits)
        {
            Button modifierButton = produit.Value.Controls.OfType<Button>().Last();
            modifierButton.Click += new EventHandler(this.BtnConfigurerProduit_Click);

            ImageButton deleteButton = produit.Value.Controls.OfType<ImageButton>().Last();
            deleteButton.Click += new ImageClickEventHandler(this.ImgBtnDelete_Click);
            PnlListeProduit.Controls.Add(produit.Value);
            Produit produitToAdd = new Produit();
            produitToAdd.Nom = modifierButton.Text;
            recordedDevis.Produits.Add(produitToAdd);
        }
    }
}