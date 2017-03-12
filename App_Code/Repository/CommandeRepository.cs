using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de CommandeRepository
/// </summary>
public class CommandeRepository
{
    public CommandeRepository()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void Add(Commande commande)
    {
        COMMANDE entity = new COMMANDE();
        entity.COMMANDE_DATE = commande.Date;
        entity.COMMANDE_ID = commande.Id;
        entity.COMMANDE_STATUT = commande.Statut;

        using (var db = new maderaEntities())
        {
            db.COMMANDE.Add(entity);
            db.SaveChanges();
        }
    }

    public Commande GetById(int id)
    {
        Commande dto;
        using (var db = new maderaEntities())
        {
            var query = from a in db.COMMANDE where a.COMMANDE_ID.Equals(id) select a;
            dto = new Commande(query.First().COMMANDE_ID, query.First().COMMANDE_DATE, query.First().COMMANDE_STATUT);
        }
        return dto;
    }
}