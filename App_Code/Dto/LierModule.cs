using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de LierModule
/// </summary>
public class LierModule
{
    private String identification;
    private String section;
    private int longueur;
    private int hauteur;

    protected string Identification
    {
        get
        {
            return identification;
        }

        set
        {
            identification = value;
        }
    }

    protected string Section
    {
        get
        {
            return section;
        }

        set
        {
            section = value;
        }
    }

    protected int Longueur
    {
        get
        {
            return longueur;
        }

        set
        {
            longueur = value;
        }
    }

    protected int Hauteur
    {
        get
        {
            return hauteur;
        }

        set
        {
            hauteur = value;
        }
    }

    public LierModule()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}