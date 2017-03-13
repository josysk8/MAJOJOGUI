using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de FichierRepository
/// </summary>
public class FichierRepository
{
    private TypeFichierRepository typeFichierRepo;


    public FichierRepository()
    {
        typeFichierRepo = new TypeFichierRepository();
    }

    public Fichier GetOne(int id)
    {
        Fichier dto;
        using (var db = new maderaEntities())
        {
            var query = from a in db.FICHIER where a.FICHIER_ID.Equals(id) select a;
            dto = new Fichier(query.First().FICHIER_ID, query.First().FICHIER_NOM, 
                              query.First().FICHIER_CHEMIN, query.First().FICHIER_POIDS, 
                              typeFichierRepo.GetOne(query.First().TYPE_FICHIER_ID));
        }
        return dto;
    }
}