using Microsoft.Extensions.DependencyInjection;
using System.Reflection;

namespace Backend.SecurityEducation.Aplicacion.Configuracion
{
    public static class AplicacionExtension
    {
        public static IServiceCollection AgregarServiciosAplicacion(this IServiceCollection iServices)
        {
            iServices.AddMediatR(configuracion => configuracion.RegisterServicesFromAssembly(Assembly.GetExecutingAssembly()));
            return iServices;
        }
    }
}
