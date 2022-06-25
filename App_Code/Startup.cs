using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(IniU_Net.Startup))]
namespace IniU_Net
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
