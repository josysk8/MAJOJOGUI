using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Client
/// </summary>
public class Client
{
    public int id { get; set; }
    public virtual ICollection<ContactClient> listeContactClient { get; set; }

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

    private string reference;



    public Client()
    {
    }
}
