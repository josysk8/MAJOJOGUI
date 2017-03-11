using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de ContactFournisseur
/// </summary>
public class ContactFournisseur : Contact
{
    private String poste;
    public ContactFournisseur()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    protected string Poste
    {
        get
        {
            return poste;
        }

        set
        {
            poste = value;
        }
    }
}