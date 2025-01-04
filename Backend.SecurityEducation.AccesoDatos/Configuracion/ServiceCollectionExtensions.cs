using Backend.SecurityEducation.AccesoDatos.Interna;
using Microsoft.Extensions.DependencyInjection;

namespace Backend.SecurityEducation.AccesoDatos.Configuracion
{
    public static class ServiceCollectionExtensions
    {
        public static void AddDataAccessServices(this IServiceCollection services, string connectionString)
        {
            // Crear la configuración de acceso a datos y agregarla como Singleton
            services.AddSingleton(new ConexionBaseDatos(connectionString));

            // Registrar las clases de acceso a datos que usan la configuración
            services.AddTransient<Usuario>();
            services.AddTransient<Asignatura>();
            services.AddTransient<Campania>();
            services.AddTransient<Reporte>();
        }
    }
}
