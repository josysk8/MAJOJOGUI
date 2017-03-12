using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Finition
/// </summary>
public class Finition
{
    private int id;
    private String nom;
    private String description;
    private TypeFinition typeFinition;

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

    public string Description
    {
        get
        {
            return description;
        }

        set
        {
            description = value;
        }
    }

    public TypeFinition TypeFinition
    {
        get
        {
            return typeFinition;
        }

        set
        {
            typeFinition = value;
        }
    }

    public Finition()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}