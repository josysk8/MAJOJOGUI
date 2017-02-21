using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Contact
/// </summary>
public class Contact
{
    private int id;
    private String nom;
    private String telephone;
    private String email;
    private String adresse;
    private String adresse2;
    private String cp;
    private String ville;

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

    protected string Nom
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

    protected string Telephone
    {
        get
        {
            return telephone;
        }

        set
        {
            telephone = value;
        }
    }

    protected string Email
    {
        get
        {
            return email;
        }

        set
        {
            email = value;
        }
    }

    protected string Adresse
    {
        get
        {
            return adresse;
        }

        set
        {
            adresse = value;
        }
    }

    protected string Adresse2
    {
        get
        {
            return adresse2;
        }

        set
        {
            adresse2 = value;
        }
    }

    protected string Cp
    {
        get
        {
            return cp;
        }

        set
        {
            cp = value;
        }
    }

    protected string Ville
    {
        get
        {
            return ville;
        }

        set
        {
            ville = value;
        }
    }

    public Contact()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Contact(string nom, string telephone, string email, string adresse, string adresse2, string cp, string ville)
    {
        this.nom = nom;
        this.telephone = telephone;
        this.email = email;
        this.adresse = adresse;
        this.adresse2 = adresse2;
        this.cp = cp;
        this.ville = ville;
    }
}