using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de LigneCommande
/// </summary>
public class LigneCommande
{
    private int id;
    private int quantite;
    private decimal prixAchat;
    private Fournisseur fournisseur;

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

    public decimal PrixAchat
    {
        get
        {
            return prixAchat;
        }

        set
        {
            prixAchat = value;
        }
    }

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

    public Fournisseur Fournisseur
    {
        get
        {
            return fournisseur;
        }

        set
        {
            fournisseur = value;
        }
    }

    public LigneCommande()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}