using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de CommercialRepository
/// </summary>
public class CommercialRepository
{
    public CommercialRepository()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void Add(Commercial commercial)
    {
        COMMERCIAL entity = new COMMERCIAL();
        entity.PERSONNEL_ID = commercial.Id;
        entity.PERSONNEL_NOM = commercial.Nom;
        entity.PERSONNEL_PRENOM = commercial.Prenom;
        entity.SECTEUR = commercial.Secteur;
        entity.NUMERO_MOBILE = commercial.NumeroMobile;
        entity.PERSONNEL_LOGIN = commercial.Login;
        entity.PERSONNEL_MDP = commercial.Mdp;
        entity.PERSONNEL_TOKEN = commercial.Token;

        using (var db = new maderaEntities())
        {
            db.COMMERCIAL.Add(entity);
            db.SaveChanges();
        }
    }

    public Commercial GetById(int id)
    {
        Commercial entity;
        using (var db = new maderaEntities())
        {
            var query = from a in db.COMMERCIAL where a.PERSONNEL_ID.Equals(id) select a;
            entity = new Commercial(query.First().SECTEUR, query.First().NUMERO_MOBILE, (int)query.First().PERSONNEL_ID, query.First().PERSONNEL_LOGIN, query.First().PERSONNEL_MDP, query.First().PERSONNEL_NOM,
                                     query.First().PERSONNEL_PRENOM, query.First().PERSONNEL_TOKEN);
        }
        return entity;
    }
}