using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Accueil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnCreerDevis_Click(object sender, EventArgs e)
    {
        Response.Redirect("NouveauDevis.aspx");
    }

    protected void btnBrouillonDevis_Click(object sender, EventArgs e)
    {
    }

    protected void btnNouveauClientDevis_Click(object sender, EventArgs e)
    {
        Response.Redirect("NouveauClient.aspx");
    }

    protected void btnEditFicheClientDevis_Click(object sender, EventArgs e)
    {

    }
}