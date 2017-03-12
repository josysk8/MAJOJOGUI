using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de BureauEtude
/// </summary>
public class BureauEtude : Personnel
{
    private String specialisation;
    public BureauEtude()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public BureauEtude(String spe, int id, String nom, String prenom, String login, String mdp, String token) : base (id, nom, prenom, login, mdp, token)
    {

    }

    public string Specialisation
    {
        get
        {
            return specialisation;
        }

        set
        {
            specialisation = value;
        }
    }
}