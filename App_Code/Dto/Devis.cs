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
    private decimal? estimationPrix;
    private DateTime? date;
    private string nomProjet;
    private String reference;
    private short? etat;
    private Client client;
    private List<Produit> produits;

    #region accesseur
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

    public decimal? EstimationPrix
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

    public string Reference
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

    public short? Etat
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

    public List<Produit> Produits
    {
        get
        {
            return produits;
        }

        set
        {
            produits = value;
        }
    }
    #endregion
    #region constructeur
    public Devis()
    {
        this.Produits = new List<Produit>();
    }

    public Devis(string nomProjet, Client SelectedClient)
    {
        this.NomProjet = nomProjet;
        this.Client = SelectedClient;
        this.Produits = new List<Produit>();
    }
    #endregion

    public Devis(int id, decimal? estimationPrix, DateTime? date, string nomProjet, string reference, short? etat, Client client)
    {
        this.id = id;
        this.estimationPrix = estimationPrix;
        this.date = date;
        this.nomProjet = nomProjet;
        this.reference = reference;
        this.etat = etat;
        this.client = client;
        this.Produits = new List<Produit>();
    }
   
}