﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de DevisRepository
/// </summary>
public class DevisRepository
{

    private ClientRepository clientRepo;
    private ProduitRepository produitRepository;
    private decimal? estimationPrixRepo;

    public DevisRepository()
    {
        clientRepo = new ClientRepository();
        produitRepository = new ProduitRepository();
    }

    public void Add(Devis devis)
    {
        Random random = new Random();
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        
        DEVIS entity = new DEVIS();
        entity.CLIENT_ID = devis.Client.Id;
        entity.DEVIS_NOM_PROJET = devis.NomProjet;
        string reference = new string(Enumerable.Repeat(chars, 10)
          .Select(s => s[random.Next(s.Length)]).ToArray());
        entity.DEVIS_REFERENCE = reference;
        entity.DEVIS_ETAT = 0;
        entity.DEVIS_ESTIMATION_PRIX = devis.EstimationPrix;
        entity.DEVIS_DATE = DateTime.Now;
        using (var db = new maderaEntities())
        {
            db.DEVIS.Add(entity);
            db.SaveChanges();

            var query = from a in db.DEVIS where a.DEVIS_REFERENCE.Equals(reference) select a;
            int id = query.First().DEVIS_ID;
            foreach (var item in devis.Produits)
            {
                produitRepository.Add(item, id);
            }
        }
    }

    public Devis GetById(int id)
    {
        Devis devis;
        using (var db = new maderaEntities())
        {
            var query = from a in db.DEVIS where a.DEVIS_ID.Equals(id) select a;

            devis = new Devis(query.First().DEVIS_ID, query.First().DEVIS_ESTIMATION_PRIX, query.First().DEVIS_DATE, 
                               query.First().DEVIS_NOM_PROJET, query.First().DEVIS_REFERENCE, query.First().DEVIS_ETAT,
                               clientRepo.GetById(query.First().CLIENT_ID));

            devis.Produits = produitRepository.GetByDevis(devis);
        }
        return devis;
    }
}