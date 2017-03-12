using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de TypeFichier
/// </summary>
public class TypeFichier
{
    private int id;
    private String nom;

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

    public TypeFichier()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}