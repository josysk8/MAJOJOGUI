using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListeProduit : System.Web.UI.Page
{
    Dictionary<string, Panel> produits = new Dictionary<string, Panel>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (null != Session["currentDevis"])
        {
            Devis recordedDevis = (Devis)Session["currentDevis"];

        }

        if (null != Session["panelContent"])
        {
            produits = (Dictionary<string, Panel>)Session["panelContent"];
            for (int i = 0; i < produits.Count; i++)
            {
                String key = "produit" + i.ToString();
                Button deleteButton = produits[key].Controls.OfType<Button>().Last();
                if (deleteButton.OnClientClick == null)
                {
                    deleteButton.OnClientClick += new EventHandler(ImgBtnDelete_Click);
                }
                PnlListeProduit.Controls.AddAt(i, produits[key]);
            }
        }
    }

    protected void ImgBtnNouveauProduit_Click(object sender, ImageClickEventArgs e)
    {

    }

    protected void BtnModalConfirmer_Click(object sender, EventArgs e)
    {
        // Utiliser la session pour repasser la liste à chaque refresh

        Panel myPanel = new Panel();

        Button myEditButton = new Button();

        Button myDeleteButton = new Button();
        myDeleteButton.Text = "Effacer";
        //myDeleteButton.ImageUrl = "Images/cancel-icon.png";
        //myDeleteButton.Height = 10;
        //myDeleteButton.Width = 10;

        myEditButton.Text = TxtModalNomProduit.Text;

        myDeleteButton.ID = "produit" + produits.Count;

        myPanel.Controls.Add(myEditButton);
        myPanel.Controls.Add(myDeleteButton);

        String nextKey = "produit" + produits.Count.ToString();
        produits.Add(nextKey, myPanel);
        Session["panelContent"] = produits;

        for (int i = 0; i < produits.Count; i++)
        {
            String key = "produit" + i.ToString();
            PnlListeProduit.Controls.AddAt(i, produits[key]);
        }
    }

    protected void ImgBtnDelete_Click(object sender, EventArgs e)
    {
        Button button = (Button)sender;
        string buttonId = button.ID;
        produits.Remove(buttonId);
        Session["panelContent"] = produits;
    }

    //Appeler après le page load :S
    protected void BtnClearProduit_Click(object sender, ImageClickEventArgs e)
    {
        produits.Clear();
        Session["panelContent"] = null;
    }
}