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
        using (var db = new maderaEntities())
        {
            var query = from b in db.CLIENT select b;
            System.Diagnostics.Debug.WriteLine("entries : ");
            foreach (var item in query)
            {
                System.Diagnostics.Debug.WriteLine(item.CLIENT_REFERENCE);
            }

            var client = new CLIENT();
            client.CLIENT_ID = 3;
            client.CLIENT_REFERENCE = "super";
            //db.CLIENT.Add()
        }
            // maderaEntities db = new maderaEntities();
            
        
    }
}