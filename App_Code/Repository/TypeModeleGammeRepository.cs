using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de TypeModeleGammeRepository
/// </summary>
public class TypeModeleGammeRepository
{
    public TypeModeleGammeRepository()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public TypeModeleGamme GetOne(int id)
    {
        TypeModeleGamme dto = new TypeModeleGamme();
        using (var db = new maderaEntities())
        {
            var query = from a in db.TYPE_MODELE_GAMME where a.TYPE_MODELE_GAMME_ID.Equals(id) select a;

            foreach (var item in query)
            {
                dto.Id = (int)item.TYPE_MODELE_GAMME_ID;
                dto.Nom = item.TYPE_MODELE_GAMME_NOM;
            }
        }

        return dto;
    }
}