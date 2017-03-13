using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de ComposantRepository
/// </summary>
public class ComposantRepository
{
    public ComposantRepository()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Composant GetById(int id)
    {
        Composant dto = new Composant();
        using (var db = new maderaEntities())
        {
            var query = from a in db.COMPOSANT where a.COMPOSANT_ID.Equals(id) select a;
            dto.Id = query.First().COMPOSANT_ID;
            dto.Nom = query.First().COMPOSANT_NOM;
            dto.Stock = query.First().COMPOSANT_STOCK;
            dto.ValeurCaracteristique1 = query.First().COMPOSANT_VALEUR_CARACTERISTIQUE_1;
            dto.ValeurCaracteristique2 = query.First().COMPOSANT_VALEUR_CARACTERISTIQUE_2;
            dto.ValeurAjoutee = query.First().VALEUR_AJOUTEE;
        }
        return dto;
    }

    public void Add(Composant composant)
    {
        COMPOSANT entity = new COMPOSANT();
        entity.COMPOSANT_ID = composant.Id;
        entity.COMPOSANT_NOM = composant.Nom;
        entity.COMPOSANT_STOCK = composant.Stock;
        entity.COMPOSANT_VALEUR_CARACTERISTIQUE_1 = composant.ValeurCaracteristique1;
        entity.COMPOSANT_VALEUR_CARACTERISTIQUE_2 = composant.ValeurCaracteristique2;
        entity.VALEUR_AJOUTEE = composant.ValeurAjoutee;

        using (var db = new maderaEntities())
        {
            db.COMPOSANT.Add(entity);
            db.SaveChanges();
        }
    }

    public List<ComposantCoupePrincipe> GetComposantCoupePrincipeByModule(Module module)
    {
        List<ComposantCoupePrincipe> dtos = new List<ComposantCoupePrincipe>();

        using (var db = new maderaEntities())
        {
            var query = from a in db.UTILISER___COUPE_DE_PRINCIPE where a.MODULE_ID.Equals(module.Id) select a;
            foreach (var item in query)
            {
                ComposantCoupePrincipe dto = new ComposantCoupePrincipe();
                dto.Composant = GetById(item.COMPOSANT_ID);
                dto.Quantite = item.QUANTITE_COUPE;
                dtos.Add(dto);
            }
        }

        return dtos;
    }
}