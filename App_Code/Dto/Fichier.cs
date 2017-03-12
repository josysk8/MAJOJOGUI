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
    private TypeFichier typeFichier;

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

    public string Chemin
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

    public long Poids
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

    public TypeFichier TypeFichier
    {
        get
        {
            return typeFichier;
        }

        set
        {
            typeFichier = value;
        }
    }

    public Fichier()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Fichier(int id, string nom, string chemin, long poids, TypeFichier typeFichier)
    {
        this.id = id;
        this.nom = nom;
        this.chemin = chemin;
        this.poids = poids;
        this.typeFichier = typeFichier;
    }
}