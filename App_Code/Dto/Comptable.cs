using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Comptable
/// </summary>
public class Comptable : Personnel
{
    private String numeroPoste;
    public Comptable()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Comptable(string numeroPoste, int id, String nom, String prenom, String login, String mdp, String token) : base(id, nom, prenom, login, mdp, token)
    {
        this.numeroPoste = numeroPoste;
    }

    public string NumeroPoste
    {
        get
        {
            return numeroPoste;
        }

        set
        {
            numeroPoste = value;
        }
    }
}