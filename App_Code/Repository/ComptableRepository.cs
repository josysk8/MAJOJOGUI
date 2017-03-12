using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de ComptableRepository
/// </summary>
public class ComptableRepository
{
    public ComptableRepository()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void Add(Comptable comptable)
    {
        COMPTABLE entity = new COMPTABLE();
        entity.PERSONNEL_ID = comptable.Id;
        entity.PERSONNEL_NOM = comptable.Nom;
        entity.PERSONNEL_PRENOM = comptable.Prenom;
        entity.NUMERO_POSTE = comptable.NumeroPoste;
        entity.PERSONNEL_LOGIN = comptable.Login;
        entity.PERSONNEL_MDP = comptable.Mdp;
        entity.PERSONNEL_TOKEN = comptable.Token;

        using (var db = new maderaEntities())
        {
            db.COMPTABLE.Add(entity);
            db.SaveChanges();
        }
    }

    public Comptable GetById(int id)
    {
        Comptable entity;
        using (var db = new maderaEntities())
        {
            var query = from a in db.COMPTABLE where a.PERSONNEL_ID.Equals(id) select a;
            entity = new Comptable(query.First().NUMERO_POSTE, (int)query.First().PERSONNEL_ID, query.First().PERSONNEL_LOGIN, query.First().PERSONNEL_MDP, query.First().PERSONNEL_NOM,
                                     query.First().PERSONNEL_PRENOM, query.First().PERSONNEL_TOKEN);
        }
        return entity;
    }

}