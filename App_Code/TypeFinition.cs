using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de TypeFinition
/// </summary>
public class TypeFinition
{
    private int id;
    private String nom;

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

    public TypeFinition()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}