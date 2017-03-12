using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de BureauEtude
/// </summary>
public class BureauEtude : Personnel
{
    private String specialisation;
    public BureauEtude()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    protected string Specialisation
    {
        get
        {
            return specialisation;
        }

        set
        {
            specialisation = value;
        }
    }
}