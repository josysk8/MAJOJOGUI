using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Client
/// </summary>
public class Client
{
    private int id;
    private ICollection<ContactClient> listeContactClient;
    private string reference;

    public string Reference
    {
        get
        {
            return reference;
        }

        set
        {
            reference = value;
        }
    }

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

    public ICollection<ContactClient> ListeContactClient
    {
        get
        {
            return listeContactClient;
        }

        set
        {
            listeContactClient = value;
        }
    }

    public Client()
    {
        this.ListeContactClient = new Collection<ContactClient>();
    }
}
