using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de EntityRepository
/// </summary>
abstract public class EntityRepository
{
    protected object entityType;
    public EntityRepository(object entityType)
    {
        this.entityType = entityType;
    }

    public void InsertDB(object entity)
    {
        using (var db = new maderaEntities())
        {
            
        }
    }
}