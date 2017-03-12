using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de BureauEtudeRepository
/// </summary>
public class BureauEtudeRepository
{
    public BureauEtudeRepository()
    {
        //
        // TODO: Add constructor logic here
        //
    }
     public void Add(BureauEtude bureauEtude)
    {
        BUREAU_ETUDE entity = new BUREAU_ETUDE();
        entity.PERSONNEL_ID = bureauEtude.Id;
        entity.PERSONNEL_NOM = bureauEtude.Nom;
        entity.PERSONNEL_PRENOM = bureauEtude.Prenom;
        entity.SPECIALISATION = bureauEtude.Specialisation;
        entity.PERSONNEL_LOGIN = bureauEtude.Login;
        entity.PERSONNEL_MDP = bureauEtude.Mdp;
        entity.PERSONNEL_TOKEN = bureauEtude.Token;

        using (var db = new maderaEntities())
        {
            db.BUREAU_ETUDE.Add(entity);
            db.SaveChanges();
        }
    }

    public BureauEtude GetById(int id)
    {
        BureauEtude entity;
        using (var db = new maderaEntities())
        {
            var query = from a in db.BUREAU_ETUDE where a.PERSONNEL_ID.Equals(id) select a;
            entity = new BureauEtude(query.First().SPECIALISATION, (int) query.First().PERSONNEL_ID, query.First().PERSONNEL_LOGIN, query.First().PERSONNEL_MDP, query.First().PERSONNEL_NOM,
                                     query.First().PERSONNEL_PRENOM, query.First().PERSONNEL_TOKEN);
        }
        return entity;
    }
}