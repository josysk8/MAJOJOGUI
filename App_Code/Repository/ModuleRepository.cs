﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de ModuleRepository
/// </summary>
public class ModuleRepository
{
    protected TypeModuleRepository typeModuleRepository;
    protected ComposantRepository composantRepository;

    public ModuleRepository()
    {
        typeModuleRepository = new TypeModuleRepository();
        composantRepository = new ComposantRepository();
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

    public List<ModuleCompose> GetCompositionByModeleGamme(ModeleDeGamme modeleGamme)
    {
        List<ModuleCompose> dtos = new List<ModuleCompose>();

        using (var db = new maderaEntities())
        {
            var queryLierModule = from a in db.LIER_MODULE where a.MODELE_GAMME_ID.Equals(modeleGamme.Id) select a;
            foreach (var item in queryLierModule)
            {
                ModuleCompose dto = new ModuleCompose();
                dto.Section = item.SECTION;
                dto.Module = GetOne(item.MODULE_ID);
                dto.Hauteur = item.HAUTEUR;
                dto.Longueur = item.LONGUEUR;
                dto.Identification = item.IDENTIFICATION;
                dtos.Add(dto);
            }
        }

        return dtos;
    }

    public Module GetOne(int id)
    {
        Module dto = new Module();

        using (var db = new maderaEntities())
        {
            var query = from a in db.MODULE where a.MODULE_ID.Equals(id) select a;
            dto.Id = query.First().MODULE_ID;
            dto.MargeCommercial = query.First().MODULE_MARGE_COMMERCIAL;
            dto.MargeEntreprise = query.First().MODULE_MARGE_ENTREPRISE;
            dto.Nom = query.First().MODULE_NOM;
            dto.TypeModule = typeModuleRepository.GetOne(query.First().TYPE_MODULE_ID);
            dto.QuantiteParent = query.First().QUANTITE_PARENT;
            dto.Parent = GetOne((int)query.First().MOD_MODULE_ID);
            dto.ComposantsCoupePrincipe = composantRepository.GetComposantCoupePrincipeByModule(dto);
        }

        return dto;
    }
}