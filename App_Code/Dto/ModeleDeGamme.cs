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
    private bool? estParDefaut;
    private String nom;
    private String description;
    private Gamme gamme;
    private int? nbPieces;
    private int? surface;
    private TypeModeleGamme typeModeleGamme;

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

    public bool? EstParDefaut
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

    public int? NbPieces
    {
        get
        {
            return nbPieces;
        }

        set
        {
            nbPieces = value;
        }
    }

    public int? Surface
    {
        get
        {
            return surface;
        }

        set
        {
            surface = value;
        }
    }

    public TypeModeleGamme TypeModeleGamme
    {
        get
        {
            return typeModeleGamme;
        }

        set
        {
            typeModeleGamme = value;
        }
    }

    public ModeleDeGamme()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}