using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Personnel
/// </summary>
public class Personnel
{
    private int id;
    private String nom;
    private String prenom;

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

    protected string Prenom
    {
        get
        {
            return prenom;
        }

        set
        {
            prenom = value;
        }
    }

    public Personnel()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}