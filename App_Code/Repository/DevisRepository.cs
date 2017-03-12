using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de DevisRepository
/// </summary>
public class DevisRepository
{
    public DevisRepository()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void Add(Devis devis)
    {
        Random random = new Random();
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        
        DEVIS entity = new DEVIS();
        entity.CLIENT_ID = devis.Client.Id;
        entity.DEVIS_NOM_PROJET = devis.NomProjet;
        entity.DEVIS_REFERENCE = new string(Enumerable.Repeat(chars, 10)
          .Select(s => s[random.Next(s.Length)]).ToArray());
        entity.DEVIS_ETAT = 0;
        entity.DEVIS_DATE = new DateTime();
        using (var db = new maderaEntities())
        {
            db.DEVIS.Add(entity);
            db.SaveChanges();
        }
    }
}