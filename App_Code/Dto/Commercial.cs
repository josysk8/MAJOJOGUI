using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Commercial
/// </summary>
public class Commercial : Personnel
{
    private String secteur;
    private String numeroMobile;

    public string Secteur
    {
        get
        {
            return secteur;
        }

        set
        {
            secteur = value;
        }
    }

    public string NumeroMobile
    {
        get
        {
            return numeroMobile;
        }

        set
        {
            numeroMobile = value;
        }
    }

    public Commercial()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Commercial(string secteur, string numeroMobile, int id, String nom, String prenom, String login, String mdp, String token) : base(id, nom, prenom, login, mdp, token)
    {
        this.secteur = secteur;
        this.numeroMobile = numeroMobile;
    }

    
}