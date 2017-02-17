using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Client
/// </summary>
public class Client
{
    private String nomProjet;
    private String nomClient;
    private double prixDevisPrevision;

    #region accesseur
    public string NomProjet
    {
        get
        {
            return nomProjet;
        }

        set
        {
            nomProjet = value;
        }
    }

    public string NomClient
    {
        get
        {
            return nomClient;
        }

        set
        {
            nomClient = value;
        }
    }

    public double PrixDevisPrevision
    {
        get
        {
            return prixDevisPrevision;
        }

        set
        {
            prixDevisPrevision = value;
        }
    }

    #endregion

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


    #endregion
}