using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Module
/// </summary>
public class Module
{
    private int id;
    private String nom;
    private String type;
    private double margeCommercial;
    private double margeEntreprise;
    private TypeModule typeModule;
    private List<ComposantCoupePrincipe> composantsCoupePrincipe;
    private List<Module> enfants;
    private int? quantiteCompositionParent;

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

    public string Type
    {
        get
        {
            return type;
        }

        set
        {
            type = value;
        }
    }

    public double MargeCommercial
    {
        get
        {
            return margeCommercial;
        }

        set
        {
            margeCommercial = value;
        }
    }

    public double MargeEntreprise
    {
        get
        {
            return margeEntreprise;
        }

        set
        {
            margeEntreprise = value;
        }
    }

    public TypeModule TypeModule
    {
        get
        {
            return typeModule;
        }

        set
        {
            typeModule = value;
        }
    }

    public List<ComposantCoupePrincipe> ComposantsCoupePrincipe
    {
        get
        {
            return composantsCoupePrincipe;
        }

        set
        {
            composantsCoupePrincipe = value;
        }
    }

    public int? QuantiteCompositionParent
    {
        get
        {
            return quantiteCompositionParent;
        }

        set
        {
            quantiteCompositionParent = value;
        }
    }

    public List<Module> Enfants
    {
        get
        {
            return enfants;
        }

        set
        {
            enfants = value;
        }
    }

    public Module()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}