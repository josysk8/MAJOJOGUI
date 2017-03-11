using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Madera;

/// <summary>
/// Description résumée de TestEF
/// </summary>
public class TestEF
{
    public TestEF()
    {
        maderaEntities db = new maderaEntities();
        var query = from b in db.CLIENT select b;
        Console.WriteLine("entries : ");
        foreach (var item in query)
        {
            Console.WriteLine(item.CLIENT_ID);
        }
    }
}