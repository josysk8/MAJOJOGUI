using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de TypeModule
/// </summary>
public class TypeModule
{
    private int id;
    private String nom;
    private String uniteUsage;
    private String caracteristique;

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

    public TypeModule()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}