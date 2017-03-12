using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Personnel
/// </summary>
public abstract class Personnel
{
    private int id;
    private String nom;
    private String prenom;
    private String login;
    private String mdp;
    private String token;

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

    public string Nom
    {
        get
        {
            return nom;
        }

        set
        {
            nom = value;
        }
    }

    public string Prenom
    {
        get
        {
            return prenom;
        }

        set
        {
            prenom = value;
        }
    }

    public string Login
    {
        get
        {
            return login;
        }

        set
        {
            login = value;
        }
    }

    public string Mdp
    {
        get
        {
            return mdp;
        }

        set
        {
            mdp = value;
        }
    }

    public string Token
    {
        get
        {
            return token;
        }

        set
        {
            token = value;
        }
    }

    public Personnel()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Personnel(int id, string nom, string prenom, string login, string mdp, string token)
    {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
        this.login = login;
        this.mdp = mdp;
        this.token = token;
    }
}