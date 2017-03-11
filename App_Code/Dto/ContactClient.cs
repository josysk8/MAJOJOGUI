using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de ContactClient
/// </summary>
public class ContactClient : Contact
{
    private String referenceClient;
    public ContactClient(string nom, string telephone, string email, string adresse, string adresse2, string cp, string ville) : base(nom, telephone, email, adresse, adresse2,cp, ville)
    {
    }

    public ContactClient(String referenceClient, string nom, string telephone, string email, string adresse, string adresse2, string cp, string ville) : base(nom, telephone, email, adresse, adresse2, cp, ville)
    {
    }

    protected string ReferenceClient
    {
        get
        {
            return referenceClient;
        }

        set
        {
            referenceClient = value;
        }
    }
}