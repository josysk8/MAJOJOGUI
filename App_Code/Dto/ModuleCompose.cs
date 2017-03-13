using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de ModuleCompose
/// </summary>
public class ModuleCompose
{
    private Module module;
    private String identification;
    private String section;
    private int longueur;
    private int hauteur;
    private ModeleDeGamme modeleDeGamme;

    public ModuleCompose()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Module Module
    {
        get
        {
            return module;
        }

        set
        {
            module = value;
        }
    }

    public string Identification
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

    public string Section
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

    public int Longueur
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

    public int Hauteur
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

    public ModeleDeGamme ModeleDeGamme
    {
        get
        {
            return modeleDeGamme;
        }

        set
        {
            modeleDeGamme = value;
        }
    }
}