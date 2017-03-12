﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de FinitionRepository
/// </summary>
public class FinitionRepository
{
    TypeFinitionRepository typeFinitionRepository;
    FichierRepository fichierRepository;
    public FinitionRepository()
    {
        typeFinitionRepository = new TypeFinitionRepository();
        fichierRepository = new FichierRepository();
    }

    public List<Finition> getByModeleDeGamme(ModeleDeGamme modele)
    {
        List<Finition> dtos = new List<Finition>();

        using (var db = new maderaEntities())
        {
            var lierFinition = from a in db.LIER_FINITION where a.MODELE_GAMME_ID.Equals(modele.Id) select a;
            foreach (var item in lierFinition)
            {
                var query = from a in db.FINITION where a.FINITION_ID.Equals(item.FINITION_ID) select a;
                Finition finition = new Finition();
                finition.Id = query.First().FINITION_ID;
                finition.Nom = query.First().FINITION_NOM;
                finition.Description = query.First().FINITION_DESCRIPTION;
                finition.TypeFinition = typeFinitionRepository.GetOne(query.First().TYPE_FINITION_ID);
                var fichier = from a in db.FINITION_IMAGE where a.FINITION_ID.Equals(finition.Id) select a;
                finition.Image = fichierRepository.GetOne(fichier.First().FICHIER_ID);
                dtos.Add(finition);
            }
        }

        return dtos;
    }
}