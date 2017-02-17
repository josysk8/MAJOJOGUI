using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Client
/// </summary>
public class Client
{
    private int id;

    #region constructer
    public Client()
    {
    //
    // TODO: Add constructor logic here
    //
}

    public Client(string nomProjet, string nomClient)
    {
        this.nomProjet = nomProjet;
        this.nomClient = nomClient;
        this.prixDevisPrevision = 0;
    }

    public Client(string nomProjet, string nomClient, double prixDevisPrevision)
    {
        this.nomProjet = nomProjet;
        this.nomClient = nomClient;
        this.prixDevisPrevision = prixDevisPrevision;
    }

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


    #endregion
}