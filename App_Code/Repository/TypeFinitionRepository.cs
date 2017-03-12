using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de TypeFinitionRepository
/// </summary>
public class TypeFinitionRepository
{
    public TypeFinitionRepository()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public TypeFinition GetOne(int id)
    {
        TypeFinition dto = new TypeFinition();

        using (var db = new maderaEntities())
        {
            var query = from a in db.TYPE_FINITION where a.TYPE_FINITION_ID.Equals(id) select a;
            dto.Id = query.First().TYPE_FINITION_ID;
            dto.Nom = query.First().TYPE_FINITION_NOM;
        }

        return dto;
    }
}