using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(nthing.Startup))]
namespace nthing
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
