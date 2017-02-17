using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListeProduit : System.Web.UI.Page
{
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
}