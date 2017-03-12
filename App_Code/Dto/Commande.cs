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
    private DateTime? date;
    private short? statut;

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

    public DateTime? Date
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

    public short? Statut
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

    public Commande(int id, DateTime? date, short? statut)
    {
        this.id = id;
        this.date = date;
        this.statut = statut;
    }
}