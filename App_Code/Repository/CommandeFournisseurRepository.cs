using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de CommandeFournisseurRepository
/// </summary>
public class CommandeFournisseurRepository
{
    public CommandeFournisseurRepository()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public LigneCommande GetLastByComposant(Composant composant)
    {
        LigneCommande dto = new LigneCommande();

        using (var db = new maderaEntities())
        {
            var query = (from a in db.LIGNE_COMMANDE
                        where a.COMPOSANT_ID.Equals(composant.Id)
                        orderby a.COMMANDE_ID descending
                        select a).Take(1);

            dto.Id = query.First().COMMANDE_ID;
            dto.PrixAchat = query.First().PRIX_ACHAT;
            dto.Quantite = query.First().QUANTITE_LIGNE_COMMANDE;
            // TODO: Fournisseur
        }

        return dto;
    }
}