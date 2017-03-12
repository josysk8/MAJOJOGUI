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
    private string situationMatrimoniale;

    public ContactClient(string nom, string situationMatrimoniale, string telephone, string email, string adresse, string adresse2, string cp, string ville) : base(nom, telephone, email, adresse, adresse2,cp, ville)
    {
        this.SituationMatrimoniale = situationMatrimoniale;
    }

    public ContactClient(String referenceClient, string nom, string situationMatrimoniale, string telephone, string email, string adresse, string adresse2, string cp, string ville) : base(nom, telephone, email, adresse, adresse2, cp, ville)
    {
    }

    public string ReferenceClient
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

    public string SituationMatrimoniale
    {
        get
        {
            return situationMatrimoniale;
        }

        set
        {
            situationMatrimoniale = value;
        }
    }
}