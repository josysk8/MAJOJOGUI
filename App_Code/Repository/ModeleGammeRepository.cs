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
    public ModeleGammeRepository()
    {
        typeModeleGammeRepository = new TypeModeleGammeRepository();
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
                dto.Id = (int) item.MODELE_GAMME_ID;
                dto.Nom = item.MODELE_GAMME_NOM;
                dto.Description = item.MODELE_GAMME_DESCRIPTION;
                dto.EstParDefaut = item.EST_PAR_DEFAUT;
                dto.NbPieces = item.MODELE_GAMME_NB_PIECES;
                dto.Surface = item.MODELE_GAMME_SURFACE;
                dto.TypeModeleGamme = typeModeleGammeRepository.GetOne(item.TYPE_MODELE_GAMME_ID); 
                dtos.Add(dto);
            }
        }

        return dtos;
    }

    public void Add(ModeleDeGamme dto)
    {
        MODELE_DE_GAMME entity = new MODELE_DE_GAMME();
        entity.GAMME_ID = dto.Gamme.Id;
        entity.EST_PAR_DEFAUT = dto.EstParDefaut;
        entity.MODELE_GAMME_DESCRIPTION = dto.Description;
        entity.MODELE_GAMME_NB_PIECES = dto.NbPieces;
        entity.MODELE_GAMME_SURFACE = dto.Surface;
        entity.MODELE_GAMME_NOM = dto.Nom;
        entity.TYPE_MODELE_GAMME_ID = dto.TypeModeleGamme.Id;
    }
}