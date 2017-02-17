using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Payer
/// </summary>
public class Payer
{
    private decimal pourcentageEtape;
    private bool statutPaiement;
    private DateTime dateEcheance;
    private DateTime datePaiement;
    private decimal montant;

    protected decimal PourcentageEtape
    {
        get
        {
            return pourcentageEtape;
        }

        set
        {
            pourcentageEtape = value;
        }
    }

    protected bool StatutPaiement
    {
        get
        {
            return statutPaiement;
        }

        set
        {
            statutPaiement = value;
        }
    }

    protected DateTime DateEcheance
    {
        get
        {
            return dateEcheance;
        }

        set
        {
            dateEcheance = value;
        }
    }

    protected DateTime DatePaiement
    {
        get
        {
            return datePaiement;
        }

        set
        {
            datePaiement = value;
        }
    }

    protected decimal Montant
    {
        get
        {
            return montant;
        }

        set
        {
            montant = value;
        }
    }

    public Payer()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}