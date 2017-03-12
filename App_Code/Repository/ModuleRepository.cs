using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de ModuleRepository
/// </summary>
public class ModuleRepository
{
    public ModuleRepository()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void Add(Module module)
    {
        MODULE entity = new MODULE();
        entity.MODULE_ID = module.Id;
        entity.MODULE_NOM = module.Nom;
        entity.MODULE_TYPE = module.Type;
        entity.MODULE_MARGE_COMMERCIAL = module.MargeCommercial;
        entity.MODULE_MARGE_ENTREPRISE = module.MargeEntreprise;
        // temp
        entity.PERSONNEL_ID = 0;
        entity.MOD_MODULE_ID = 0;
        entity.QUANTITE_PARENT = 0;
        using (var db = new maderaEntities())
        {
            db.MODULE.Add(entity);
            db.SaveChanges();
        }
    }
}