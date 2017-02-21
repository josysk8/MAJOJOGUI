using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NouveauClient : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //ViewState["RefUrl"] = Request.UrlReferrer.ToString();
        }
    }

    protected void BtnRetour_Click(object sender, EventArgs e)
    {
        object refUrl = ViewState["RefUrl"];
        if (refUrl != null)
            Response.Redirect((string)refUrl);
    }

    protected void BtnConfirmer_Click(object sender, EventArgs e)
    {
        ContactClient contactNouveauClient = new ContactClient(TxtNomCLient.Text, TxtTelephoneClient.Text, TxtEmailClient.Text, TxtAdressseClient.Text, TxtAdresse2Client.Text,TxtCpClient.Text, TxtVilleClient.Text);
        Client nouveauClient = new Client();
        nouveauClient.listeContactClient.Add(contactNouveauClient);
    }
}