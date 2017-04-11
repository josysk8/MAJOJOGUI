using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de ModeleGammeRepository
/// </summary>
public class ModeleGammeRepository
{
    protected TypeModeleGammeRepository typeModeleGammeRepository;
    protected FichierRepository fichierRepository;
    protected ModuleRepository moduleRepository;
    protected FinitionRepository finitionRepository;
    protected GammeRepository gammeRepository;

    public ModeleGammeRepository()
    {
        typeModeleGammeRepository = new TypeModeleGammeRepository();
        fichierRepository = new FichierRepository();
        moduleRepository = new ModuleRepository();
        finitionRepository = new FinitionRepository();
        gammeRepository = new GammeRepository();
    }

    public List<ModeleDeGamme> GetByGamme(Gamme gamme)
    {
        List<ModeleDeGamme> dtos = new List<ModeleDeGamme>();
        using (var db = new maderaEntities())
        {
            var query = from a in db.MODELE_DE_GAMME where a.GAMME_ID.Equals(gamme.Id) select a;

            foreach (var item in query)
            {
                ModeleDeGamme dto = new ModeleDeGamme();
                dto.Id = (int)item.MODELE_GAMME_ID;
                dto.Nom = item.MODELE_GAMME_NOM;
                dto.Description = item.MODELE_GAMME_DESCRIPTION;
                dto.EstParDefaut = item.EST_PAR_DEFAUT;
                dto.NbPieces = item.MODELE_GAMME_NB_PIECES;
                dto.Surface = item.MODELE_GAMME_SURFACE;
                dto.TypeModeleGamme = typeModeleGammeRepository.GetOne(item.TYPE_MODELE_GAMME_ID);
                dto.Gamme = gammeRepository.GetOne(item.GAMME_ID);
                var image = from a in db.MODELE_GAMME_IMAGE where a.MODELE_GAMME_ID.Equals(dto.Id) select a;
                if (image.Count() != 0)
                {
                    //TODO : Plante quand il n'y a pas d'image
                    dto.Image = fichierRepository.GetOne(image.First().FICHIER_ID);
                }
                var queryFinitions = from a in db.LIER_FINITION where a.MODELE_GAMME_ID.Equals(dto.Id) select a;
                List<Finition> finitions = new List<Finition>();
                foreach (var itemFin in queryFinitions)
                {
                    finitions.Add(finitionRepository.getOne(itemFin.FINITION_ID));
                }
                dto.Finitions = finitions;
                dtos.Add(dto);
            }
        }

        return dtos;
    }

    public ModeleDeGamme GetOne(int id)
    {
        ModeleDeGamme dto = new ModeleDeGamme();
        using (var db = new maderaEntities())
        {
            var query = from a in db.MODELE_DE_GAMME where a.MODELE_GAMME_ID.Equals(id) select a;

            dto.Id = query.First().MODELE_GAMME_ID;
            dto.Nom = query.First().MODELE_GAMME_NOM;
            dto.Description = query.First().MODELE_GAMME_DESCRIPTION;
            dto.EstParDefaut = query.First().EST_PAR_DEFAUT;
            dto.NbPieces = query.First().MODELE_GAMME_NB_PIECES;
            dto.Surface = query.First().MODELE_GAMME_SURFACE;
            dto.TypeModeleGamme = typeModeleGammeRepository.GetOne(query.First().TYPE_MODELE_GAMME_ID);
            dto.Gamme = gammeRepository.GetOne(query.First().GAMME_ID);
            var image = from a in db.MODELE_GAMME_IMAGE where a.MODELE_GAMME_ID.Equals(dto.Id) select a;
            if (image.Count() != 0)
                dto.Image = fichierRepository.GetOne(image.First().FICHIER_ID);
            var queryFinitions = from a in db.LIER_FINITION where a.MODELE_GAMME_ID.Equals(id) select a;
            List<Finition> finitions = new List<Finition>();
            foreach (var item in queryFinitions)
            {
                finitions.Add(finitionRepository.getOne(item.FINITION_ID));
            }
            dto.Finitions = finitions;
            dto.Modules = moduleRepository.GetCompositionByIdModeleGamme(id);
        }

        return dto;
    }

    public int Add(ModeleDeGamme dto)
    {
        MODELE_DE_GAMME entity = new MODELE_DE_GAMME();
        entity.GAMME_ID = dto.Gamme.Id;
        entity.EST_PAR_DEFAUT = dto.EstParDefaut;
        entity.MODELE_GAMME_DESCRIPTION = dto.Description;
        entity.MODELE_GAMME_NB_PIECES = dto.NbPieces;
        entity.MODELE_GAMME_SURFACE = dto.Surface;
        entity.MODELE_GAMME_NOM = dto.Nom;
        entity.TYPE_MODELE_GAMME_ID = dto.TypeModeleGamme.Id;
        entity.GAMME_ID = dto.Gamme.Id;

        using (var db = new maderaEntities())
        {
            db.MODELE_DE_GAMME.Add(entity);
            db.SaveChanges();

            var queryModele = (from a in db.MODELE_DE_GAMME orderby a.MODELE_GAMME_ID descending select a).Single();
            foreach (var item in dto.Finitions)
            {
                LIER_FINITION entityFin = new LIER_FINITION();
                entityFin.FINITION_ID = item.Id;
                entityFin.MODELE_GAMME_ID = queryModele.MODELE_GAMME_ID;
                db.LIER_FINITION.Add(entityFin);
                db.SaveChanges();
            }
        }
        return entity.MODELE_GAMME_ID;
    }

    public ModeleDeGamme GetByProduit(Produit prod)
    {
        ModeleDeGamme dto = new ModeleDeGamme();
        using (var db = new maderaEntities())
        {
            var query = from a in db.MODELE_DE_GAMME where a.MODELE_GAMME_ID.Equals(prod.Id) select a;

            foreach (var item in query)
            {
                dto.Id = (int)item.MODELE_GAMME_ID;
                dto.Nom = item.MODELE_GAMME_NOM;
                dto.Description = item.MODELE_GAMME_DESCRIPTION;
                dto.EstParDefaut = item.EST_PAR_DEFAUT;
                dto.NbPieces = item.MODELE_GAMME_NB_PIECES;
                dto.Surface = item.MODELE_GAMME_SURFACE;
                dto.TypeModeleGamme = typeModeleGammeRepository.GetOne(item.TYPE_MODELE_GAMME_ID);
                dto.Gamme = gammeRepository.GetOne(item.GAMME_ID);
                var image = from a in db.MODELE_GAMME_IMAGE where a.MODELE_GAMME_ID.Equals(dto.Id) select a;
                if (image.Count() != 0)
                    dto.Image = fichierRepository.GetOne(image.First().FICHIER_ID);
                var queryFinitions = from a in db.LIER_FINITION where a.MODELE_GAMME_ID.Equals(dto.Id) select a;
                List<Finition> finitions = new List<Finition>();
                foreach (var itemFin in queryFinitions)
                {
                    finitions.Add(finitionRepository.getOne(itemFin.FINITION_ID));
                }
                dto.Finitions = finitions;
                //
                // TODO: boucle infinie ?
                //
                dto.Modules = moduleRepository.GetCompositionByModeleGamme(dto);
            }
        }

        return dto;
    }
}