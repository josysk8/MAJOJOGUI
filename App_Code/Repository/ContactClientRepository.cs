using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de ContactClientRepository
/// </summary>
public class ContactClientRepository
{
    public ContactClientRepository()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public ICollection<ContactClient> GetById(int id)
    {

        ICollection<ContactClient> contacts = new List<ContactClient>();
        using (var db = new maderaEntities())
        {
            var query = from a in db.CONTACT_CLIENT where a.CLIENT_ID.Equals(id) select a;
            foreach (var item in query)
            {
                ContactClient contactClient = new ContactClient(
                    item.CONTACT_NOM,
                    item.CONTACT_TELEPHONE,
                    item.CONTACT_MAIL,
                    item.CONTACT_ADRESSE,
                    item.CONTACT_ADRESSE2,
                    item.CONTACT_CP,
                    item.CONTACT_VILLE);
                contacts.Add(contactClient);
            }

            return contacts;
        }
    }

    public void Add(ContactClient contactClient)
    {
        CONTACT_CLIENT entity = new CONTACT_CLIENT();
        entity.CLIENT_ID = contactClient.Id;

        using (var db = new maderaEntities())
        {
            db.CONTACT_CLIENT.Add(entity);
            db.SaveChanges();
        }
    }
}