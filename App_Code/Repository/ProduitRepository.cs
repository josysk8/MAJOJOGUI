using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de ProduitRepository
/// </summary>
public class ProduitRepository
{
    public ProduitRepository()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    
    public void Add(Produit produit)
    {
        PRODUIT entity = new PRODUIT();
        entity.PRODUIT_NOM = produit.Nom;
        entity.PRODUIT_DESCRIPTION = produit.Description;
        entity.DEVIS_ID = produit.Devis.Id;
        entity.GAMME_ID = produit.Gamme.Id;
        
        using (var db = new maderaEntities())
        {
            db.PRODUIT.Add(entity);
            db.SaveChanges();
        }
    }
}