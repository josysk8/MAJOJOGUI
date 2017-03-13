using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Composant
/// </summary>
public class Composant
{
    private int id;
    private String nom;
    private int stock;
    private decimal valeurCaracteristique1;
    private decimal valeurCaracteristique2;
    private double valeurAjoutee;

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

    public int Stock
    {
        get
        {
            return stock;
        }

        set
        {
            stock = value;
        }
    }

    public decimal ValeurCaracteristique1
    {
        get
        {
            return valeurCaracteristique1;
        }

        set
        {
            valeurCaracteristique1 = value;
        }
    }

    public decimal ValeurCaracteristique2
    {
        get
        {
            return valeurCaracteristique2;
        }

        set
        {
            valeurCaracteristique2 = value;
        }
    }

    public double ValeurAjoutee
    {
        get
        {
            return valeurAjoutee;
        }

        set
        {
            valeurAjoutee = value;
        }
    }

    public Composant()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}