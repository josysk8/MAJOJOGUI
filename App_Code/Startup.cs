using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Madera.Startup))]
namespace Madera
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
