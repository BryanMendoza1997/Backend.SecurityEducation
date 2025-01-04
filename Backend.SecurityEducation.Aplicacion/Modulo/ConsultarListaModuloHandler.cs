using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    public class ConsultarListaModuloHandler : IRequestHandler<ConsultarListaModulo, IList<ConsultarListaModulos>>
    {
        private readonly IModuloService _datos;
        public ConsultarListaModuloHandler(IModuloService datos)
        {
            _datos = datos;
        }

        public async Task<IList<ConsultarListaModulos>> Handle(ConsultarListaModulo request, CancellationToken cancellationToken)
        {
            return await _datos.ConsultarListaModulosAsync();
        }
    }
}
