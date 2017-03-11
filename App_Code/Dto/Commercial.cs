using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Commercial
/// </summary>
public class Commercial
{
    private String secteur;
    private String numeroMobile;

    protected string Secteur
    {
        get
        {
            return secteur;
        }

        set
        {
            secteur = value;
        }
    }

    protected string NumeroMobile
    {
        get
        {
            return numeroMobile;
        }

        set
        {
            numeroMobile = value;
        }
    }

    public Commercial()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}