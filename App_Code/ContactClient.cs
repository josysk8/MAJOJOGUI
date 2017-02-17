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
    public ContactClient()
    {
        //
        // TODO: Add constructor logic here
        //
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