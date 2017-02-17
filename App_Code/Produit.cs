using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Produit
/// </summary>
public class Produit
{
    private int id;
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

    public Produit()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}