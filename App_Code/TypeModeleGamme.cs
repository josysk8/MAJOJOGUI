﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de TypeModeleGamme
/// </summary>
public class TypeModeleGamme
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

    public TypeModeleGamme()
    {
        //
        // TODO: Add constructor logic here
        //
    }


}