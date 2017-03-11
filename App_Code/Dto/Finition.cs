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

    protected string Description
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

    public Finition()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}