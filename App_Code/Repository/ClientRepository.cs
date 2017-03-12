using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Description résumée de ClientRepository
/// </summary>
public class ClientRepository
{
    protected ContactClientRepository contactClientRepository;
    public ClientRepository()
    {
        contactClientRepository = new ContactClientRepository();
    }

    public List<Client> GetAll()
    {
        List<Client> clients = new List<Client>();
        using (var db = new maderaEntities())
        {
            var query = from b in db.CLIENT select b;
            
            foreach (var item in query)
            {
                Client dto = new Client();
                dto.Id = (int)item.CLIENT_ID;
                dto.Reference = item.CLIENT_REFERENCE;
                dto.ListeContactClient = contactClientRepository.GetById(dto.Id);
                clients.Add(dto);
            }
        }

        return clients;
    }

    public Client GetById(int id)
    {
        Client dto = new Client();
        using (var db = new maderaEntities())
        {
            var query = from a in db.CLIENT where a.CLIENT_ID.Equals(id) select a;
            dto.Id = (int) query.First().CLIENT_ID;
            dto.Name = query.First().CLIENT_NAME;
            dto.Reference = query.First().CLIENT_REFERENCE;
            dto.ListeContactClient = contactClientRepository.GetById(dto.Id);
        }
        return dto;
    }

    public void Add(Client client)
    {
        Random random = new Random();
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

        CLIENT entity = new CLIENT();
        string reference = new string(Enumerable.Repeat(chars, 10)
          .Select(s => s[random.Next(s.Length)]).ToArray());
        entity.CLIENT_REFERENCE = reference;
        entity.CLIENT_NAME = client.Name;

        using (var db = new maderaEntities())
        {
            db.CLIENT.Add(entity);
            db.SaveChanges();
            var query = from a in db.CLIENT where a.CLIENT_REFERENCE.Equals(reference) select a;

            int id = 0;
            foreach (var item in query)
            {
                id = (int) item.CLIENT_ID;
            }

            foreach (var item in client.ListeContactClient)
            {
                contactClientRepository.Add(item, id);
            }
        }
    }
}