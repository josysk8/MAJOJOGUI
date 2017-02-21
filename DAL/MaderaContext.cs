using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace Madera.DAL
{
    public class MaderaContext : DbContext
    {

        public MaderaContext() : base("MaderaContext")
        {
        }

        public DbSet<ContactClient> ContactClient { get; set; }
        public DbSet<Client> Client { get; set; }
        public DbSet<Devis> Devis { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
    }
}