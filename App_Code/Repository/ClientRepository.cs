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
                dto.id = (int)item.CLIENT_ID;
                dto.Reference = item.CLIENT_REFERENCE;
                dto.listeContactClient = contactClientRepository.GetById(dto.id);
                clients.Add(dto);
            }
        }

        return clients;
    }
}