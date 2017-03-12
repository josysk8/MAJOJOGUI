using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Module
/// </summary>
public class Module
{
    private int id;
    private String nom;
    private String type;
    private decimal margeCommercial;
    private decimal margeEntreprise;

    public int Id
    {
        get
        {
            return id;
        }

        set
        {
            id = value;
        }
    }

    public string Nom
    {
        get
        {
            return nom;
        }

        set
        {
            nom = value;
        }
    }

    public string Type
    {
        get
        {
            return type;
        }

        set
        {
            type = value;
        }
    }

    public decimal MargeCommercial
    {
        get
        {
            return margeCommercial;
        }

        set
        {
            margeCommercial = value;
        }
    }

    public decimal MargeEntreprise
    {
        get
        {
            return margeEntreprise;
        }

        set
        {
            margeEntreprise = value;
        }
    }

    public Module()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}