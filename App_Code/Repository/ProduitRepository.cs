using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de ProduitRepository
/// </summary>
public class ProduitRepository
{
    protected GammeRepository gammeRepository;
    protected ModeleGammeRepository modeleGammeRepository;

    public ProduitRepository()
    {
        gammeRepository = new GammeRepository();
    }
    
    public void Add(Produit produit, int devisId)
    {
        PRODUIT entity = new PRODUIT();
        entity.PRODUIT_NOM = produit.Nom;
        entity.PRODUIT_DESCRIPTION = produit.Description;
        entity.DEVIS_ID = devisId;
        entity.GAMME_ID = produit.Gamme.Id;
        if (produit.ModeleDeGamme.Id != 0)
            entity.MODELE_DE_GAMME_ID = produit.ModeleDeGamme.Id;
        else
        {
            entity.MODELE_DE_GAMME_ID = modeleGammeRepository.Add(produit.ModeleDeGamme);
        }
        
        using (var db = new maderaEntities())
        {
            db.PRODUIT.Add(entity);
            db.SaveChanges();
        }
    }

    public List<Produit> GetByDevis(Devis devis)
    {
        List<Produit> dtos = new List<Produit>();

        using (var db = new maderaEntities())
        {
            var query = from a in db.PRODUIT where a.DEVIS_ID.Equals(devis.Id) select a;

            foreach (var item in query)
            {
                Produit dto = new Produit();
                dto.Id = item.PRODUIT_ID;
                dto.Nom = item.PRODUIT_NOM;
                dto.Description = item.PRODUIT_DESCRIPTION;
                dto.Gamme = gammeRepository.GetOne(item.GAMME_ID);
                if (item.MODELE_DE_GAMME_ID != null)
                    dto.ModeleDeGamme = modeleGammeRepository.GetOne((int) item.MODELE_DE_GAMME_ID);
                dtos.Add(dto);
            }
        }

        return dtos;
    }
}