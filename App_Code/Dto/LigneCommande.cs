using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de LigneCommande
/// </summary>
public class LigneCommande
{
    private int quantite;
    private decimal prixAchat;

    protected int Quantite
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

    protected decimal PrixAchat
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

    public LigneCommande()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}