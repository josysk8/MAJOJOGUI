using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de Client
/// </summary>
public class Client
{
    private int id { get; set; }
    public virtual ICollection<ContactClient> listeContactClient { get; set; }

    public Client()
    {
    }
}
