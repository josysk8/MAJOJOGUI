using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de ComposantCoupePrincipe
/// </summary>
public class ComposantCoupePrincipe
{
    private Composant composant;
    private int quantite;
    public ComposantCoupePrincipe()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Composant Composant
    {
        get
        {
            return composant;
        }

        set
        {
            composant = value;
        }
    }

    public int Quantite
    {
        get
        {
            return quantite;
        }

        set
        {
            quantite = value;
        }
    }
}