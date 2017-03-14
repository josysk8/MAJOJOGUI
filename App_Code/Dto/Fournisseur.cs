using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Fournisseur
/// </summary>
public class Fournisseur
{
    private int id;
    private String siret;
    private String siren;
    private String nom;

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

    public string Siret
    {
        get
        {
            return siret;
        }

        set
        {
            siret = value;
        }
    }

    public string Siren
    {
        get
        {
            return siren;
        }

        set
        {
            siren = value;
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

    public Fournisseur()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}