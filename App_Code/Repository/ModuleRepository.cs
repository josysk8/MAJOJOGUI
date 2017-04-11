using System;
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

    public List<ModuleCompose> GetCompositionByIdModeleGamme(int id)
    {
        List<ModuleCompose> dtos = new List<ModuleCompose>();

        using (var db = new maderaEntities())
        {
            var queryLierModule = from a in db.LIER_MODULE where a.MODELE_GAMME_ID.Equals(id) select a;
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
            dto.ComposantsCoupePrincipe = composantRepository.GetComposantCoupePrincipeByModule(dto);
            var queryAssoc = from a in db.ASSOC_MODULE where a.MODULE_PARENT_ID.Equals(dto.Id) select a;
            List<Module> enfants = new List<Module>();
            foreach (var item in queryAssoc)
            {
                Module enfant = GetOne(item.MODULE_ENFANT_ID);
                enfant.QuantiteCompositionParent = item.QUANTITE;
                enfants.Add(enfant);
            }
        }

        return dto;
    }

    public List<Module> GetByGamme(Gamme gamme)
    {
        List<Module> dtos = new List<Module>();

        using (var db = new maderaEntities())
        {
            var query = from a in db.EST_DISPONIBLE where a.GAMME_ID.Equals(gamme.Id) select a;
            foreach (var item in query)
            {
                Module module = GetOne(item.MODULE_ID);
                dtos.Add(module);
            }
        }

        return dtos;
    }
}