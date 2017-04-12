using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListeProduit : System.Web.UI.Page
{
    DevisRepository repositoryDevis;
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
        refreshProductPanel();
    }

    protected void ImgBtnNouveauProduit_Click(object sender, ImageClickEventArgs e)
    {
        refreshProductPanel();
    }

    protected void BtnModalConfirmer_Click(object sender, EventArgs e)
    {
        Produit nouveauProduit = new Produit();
        nouveauProduit.Nom = TxtModalNomProduit.Text;
        nouveauProduit.Id = (Int32)(DateTime.UtcNow.Subtract(new DateTime(1970, 1, 1))).TotalSeconds;
        recordedDevis.Produits.Add(nouveauProduit);
        refreshProductPanel();
    }

    protected void BtnConfigurerProduit_Click(object sender, EventArgs e)
    {
        Button button = (Button)sender;
        int idProduit = int.Parse(button.ID.Substring(1));

        Session["currentProduit"] = idProduit;
        Session["currentDevis"] = recordedDevis;
        Response.Redirect("ConfigurerProduit.aspx");
    }

    protected void ImgBtnDelete_Click(object sender, EventArgs e)
    {
        ImageButton button = (ImageButton)sender;
        int idProduit = int.Parse(button.ID.Substring(1));
        recordedDevis.Produits = recordedDevis.Produits.Where(note => note.Id != idProduit).ToList();
        refreshProductPanel();
    }

    protected void BtnClearProduit_Click(object sender, EventArgs e)
    {
        PnlListeProduit.Controls.Clear();
        recordedDevis.Produits.Clear();
    }

    protected void BtnFinaliserDevis_Click(object sender, EventArgs e)
    {
        repositoryDevis = new DevisRepository();
        repositoryDevis.Add(recordedDevis);
        Response.Redirect("Recapitulatif.aspx");
    }

    //fonction qui refresh le panel de produits
    private void refreshProductPanel()
    {
        PnlListeProduit.Controls.Clear();
        foreach (Produit produit in recordedDevis.Produits)
        {
            Panel myProduitPanel = new Panel();

            Button modifierButton = new Button();
            modifierButton.ID = "M" + produit.Id.ToString();
            modifierButton.Text = produit.Nom;
            modifierButton.CssClass = "btn btn-xs btn-primary";
            modifierButton.Click += new EventHandler(this.BtnConfigurerProduit_Click);
            myProduitPanel.Controls.Add(modifierButton);

            ImageButton deleteButton = new ImageButton();
            deleteButton.ID = "D" + produit.Id.ToString();
            deleteButton.ImageUrl = "Images/cancel-icon.png";
            deleteButton.Height = 10;
            deleteButton.Width = 10;
            deleteButton.Click += new ImageClickEventHandler(this.ImgBtnDelete_Click);
            myProduitPanel.Controls.Add(deleteButton);

            PnlListeProduit.Controls.Add(myProduitPanel);
        }
    }
}