using Microsoft.Extensions.DependencyInjection;
using Backend.SecurityEducation.AccesoDatos.Configuracion;
using Backend.SecurityEducation.Infraestructura.Servicios;

namespace Backend.SecurityEducation.Infraestructura.Configuracion
{
    public static class ServiceConfigurator
    {
        public static void AddDataBusinessServices(this IServiceCollection services, string connectionString)
        {
            services.AddDataAccessServices(connectionString);
            services.AddTransient<IUsuarioService, UsuarioService>();
            services.AddTransient<IModuloService, ModuloService>();
            services.AddTransient<ICampaniaService, CampaniaService>();
            services.AddTransient<IReporteService, ReporteService>();
        }
    }
}
