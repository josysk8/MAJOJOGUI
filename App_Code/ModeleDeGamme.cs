using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de ModeleDeGamme
/// </summary>
public class ModeleDeGamme
{
    private int id;
    private bool estParDefaut;
    private String nom;
    private String description;

    protected int Id
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

    protected bool EstParDefaut
    {
        get
        {
            return estParDefaut;
        }

        set
        {
            estParDefaut = value;
        }
    }

    protected string Nom
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

    protected string Description
    {
        get
        {
            return description;
        }

        set
        {
            description = value;
        }
    }

    public ModeleDeGamme()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}