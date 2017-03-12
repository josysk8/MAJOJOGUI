using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NouveauDevis : System.Web.UI.Page
{
    ClientRepository clientRepository;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           ViewState["RefUrl"] = Request.UrlReferrer.ToString();
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
        //Envoi d'un type client
        clientRepository = new ClientRepository();
        Client clientFromSelect = clientRepository.GetById(int.Parse(SelectClient.SelectedValue));
        Devis recordedClient = new Devis(TxtNomProjet.Text, clientFromSelect);
        Session["currentDevis"] = recordedClient;
        Response.Redirect("ListeProduit.aspx");

    }
}