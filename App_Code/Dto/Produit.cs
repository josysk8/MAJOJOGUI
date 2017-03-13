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
    private Devis devis;
    private Gamme gamme;
    private ModeleDeGamme modeleDeGamme;

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

    public string Description
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

    public Gamme Gamme
    {
        get
        {
            return gamme;
        }

        set
        {
            gamme = value;
        }
    }

    public Devis Devis
    {
        get
        {
            return devis;
        }

        set
        {
            devis = value;
        }
    }

    public ModeleDeGamme ModeleDeGamme
    {
        get
        {
            return modeleDeGamme;
        }

        set
        {
            modeleDeGamme = value;
        }
    }

    public Produit()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}