using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de TypeFichierRepository
/// </summary>
public class TypeFichierRepository
{
    public TypeFichierRepository()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public TypeFichier GetOne(int id)
    {
        TypeFichier dto = new TypeFichier();

        using (var db = new maderaEntities())
        {
            var query = from a in db.TYPE_FICHIER where a.TYPE_FICHIER_ID.Equals(id) select a;

            dto.Id = query.First().TYPE_FICHIER_ID;
            dto.Nom = query.First().TYPE_FICHIER_NOM;
        }

        return dto;
    }
}