using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de TypeComposant
/// </summary>
public class TypeComposant
{
    private int id;
    private String nom;
    private String caracteristique;
    private String uniteUsage;

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

    protected string Caracteristique
    {
        get
        {
            return caracteristique;
        }

        set
        {
            caracteristique = value;
        }
    }

    protected string UniteUsage
    {
        get
        {
            return uniteUsage;
        }

        set
        {
            uniteUsage = value;
        }
    }

    public TypeComposant()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}