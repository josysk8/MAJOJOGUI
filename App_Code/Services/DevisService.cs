using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de DevisService
/// </summary>
public class DevisService
{
    private CommandeFournisseurRepository commandeFournisseurRepository;

    public DevisService()
    {
        commandeFournisseurRepository = new CommandeFournisseurRepository();
    }

    public decimal CalculateEstimatedPrice(Devis devis)
    {
        decimal totalPrice = 0;

        // Get Products
        foreach (var produit in devis.Produits)
        {
            // Get Modules
            if (produit.ModeleDeGamme != null)
            {
                foreach (var moduleCompose in produit.ModeleDeGamme.Modules)
                {
                    Module module = moduleCompose.Module;
                    totalPrice += GetPriceOfModule(module);
                }
            }
        }

        return totalPrice;
    }

    public decimal GetPriceOfModule(Module module)
    {
        decimal total = 0;

        if (module.Enfants.Count > 0)
        {
            foreach (var item in module.Enfants)
            {
                total += GetPriceOfModule(item);
            }
        }
        foreach (var composantCoupe in module.ComposantsCoupePrincipe)
        {
            LigneCommande lastCommande = commandeFournisseurRepository.GetLastByComposant(composantCoupe.Composant);
            decimal composantPrice = lastCommande.PrixAchat +
                ((decimal)composantCoupe.Composant.ValeurAjoutee * lastCommande.PrixAchat);
            decimal margeCom = composantPrice * (decimal)module.MargeCommercial;
            decimal margeEntreprise = composantPrice * (decimal)module.MargeEntreprise;

            composantPrice += margeCom + margeEntreprise;
            total += composantPrice;
        }

        return total;
    }
}