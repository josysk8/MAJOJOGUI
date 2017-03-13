using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de TypeModuleRepository
/// </summary>
public class TypeModuleRepository
{
    public TypeModuleRepository()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public TypeModule GetOne(int id)
    {
        TypeModule dto = new TypeModule();

        using (var db = new maderaEntities())
        {
            var query = from a in db.TYPE_MODULE where a.TYPE_MODULE_ID.Equals(id) select a;
            dto.Id = query.First().TYPE_MODULE_ID;
            dto.Nom = query.First().TYPE_MODULE_NOM;
            dto.UniteUsage = query.First().TYPE_MODULE_UNITE_USAGE;
            dto.Caracteristique = query.First().TYPE_MODULE_CARACTERISTIQUE;
        }

        return dto;
    }
}