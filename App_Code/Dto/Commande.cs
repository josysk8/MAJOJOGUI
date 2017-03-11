using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Commande
/// </summary>
public class Commande
{
    private int id;
    private DateTime date;
    private short statut;

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

    protected DateTime Date
    {
        get
        {
            return date;
        }

        set
        {
            date = value;
        }
    }

    protected short Statut
    {
        get
        {
            return statut;
        }

        set
        {
            statut = value;
        }
    }

    public Commande()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}