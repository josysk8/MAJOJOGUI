using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de GammeRepository
/// </summary>
public class GammeRepository
{
    public GammeRepository()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public List<Gamme> getAll()
    {
        List<Gamme> gammes = new List<Gamme>();
        using (var db = new maderaEntities())
        {
            var query = from a in db.GAMME select a;

            foreach (var item in query)
            {
                Gamme dto = new Gamme();
                dto.Id = (int) item.GAMME_ID;
                dto.Nom = item.GAMME_NOM;
                dto.Description = item.GAMME_DESCRIPTION;
                gammes.Add(dto);
            }
        }

        return gammes;
    }
}