using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListeProduit : System.Web.UI.Page
{
    Dictionary<string, Label> produits = new Dictionary<string, Label>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (null != Session["currentDevis"])
        {
            Client recordedDevis = (Client)Session["currentDevis"];
            LblNomClient.Text = recordedDevis.NomClient;
            LblNomProjet.Text = recordedDevis.NomProjet;
            LblPrix.Text = recordedDevis.PrixDevisPrevision.ToString();
        }
    }

    protected void ImgBtnNouveauProduit_Click(object sender, ImageClickEventArgs e)
    {

    }

    protected void BtnModalConfirmer_Click(object sender, EventArgs e)
    {
        Label myLabel = new Label();
        myLabel.Text = TxtModalNomProduit.Text;
        String nextKey = "produit" + produits.Count.ToString();
        produits.Add(nextKey, myLabel);

        for (int i = 0; i < produits.Count; i++)
        {
            String key = "produit" + i.ToString();
            PnlListeProduit.Controls.AddAt(i, produits[key]);
        }
    }

}