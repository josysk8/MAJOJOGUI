using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de EtapeEchelonnement
/// </summary>
public class EtapeEchelonnement
{
    private int id;
    private String nom;
    private int ordre;

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

    protected int Ordre
    {
        get
        {
            return ordre;
        }

        set
        {
            ordre = value;
        }
    }

    public EtapeEchelonnement()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}