using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Fichier
/// </summary>
public class Fichier
{
    private int id;
    private String nom;
    private String chemin;
    private long poids;

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

    protected string Chemin
    {
        get
        {
            return chemin;
        }

        set
        {
            chemin = value;
        }
    }

    protected long Poids
    {
        get
        {
            return poids;
        }

        set
        {
            poids = value;
        }
    }

    public Fichier()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}