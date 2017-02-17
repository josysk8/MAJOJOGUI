using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NouveauDevis : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           //ViewState["RefUrl"] = Request.UrlReferrer.ToString();
        }
    }

    protected void btnRetour_Click(object sender, EventArgs e)
    {
        object refUrl = ViewState["RefUrl"];
        if (refUrl != null)
            Response.Redirect((string)refUrl);
    }

    protected void btnConfirmer_Click(object sender, EventArgs e)
    {
        Client recordedClient = new Client(TxtNomProjet.Text, "Jean Pierre Papin");
        Session["currentDevis"] = recordedClient;
        Response.Redirect("ListeProduit.aspx");
    }
}