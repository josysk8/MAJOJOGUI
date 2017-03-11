using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Devis
/// </summary>
public class Devis
{
    private int id;
    private decimal estimationPrix;
    private DateTime date;
    private string nomProjet;
    private String reference;
    private short etat;
    private Client client;

    #region accesseur
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

    protected decimal EstimationPrix
    {
        get
        {
            return estimationPrix;
        }

        set
        {
            estimationPrix = value;
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

    protected string NomProjet
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

    protected string Reference
    {
        get
        {
            return reference;
        }

        set
        {
            reference = value;
        }
    }

    protected short Etat
    {
        get
        {
            return etat;
        }

        set
        {
            etat = value;
        }
    }

    public Client Client
    {
        get
        {
            return client;
        }

        set
        {
            client = value;
        }
    }
    #endregion
    #region constructeur
    public Devis()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Devis(string nomProjet, Client SelectedClient)
    {
        this.NomProjet = nomProjet;
        this.Client = SelectedClient;
    }
    #endregion
}