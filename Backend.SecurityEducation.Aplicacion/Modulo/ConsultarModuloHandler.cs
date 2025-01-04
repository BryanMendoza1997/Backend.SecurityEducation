using Backend.SecurityEducation.Aplicacion.Usuario;
using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    public class ConsultarModuloHandler : IRequestHandler<ConsultarModulo, IList<ConsultarModulosModelo>>
    {
        private readonly IModuloService _datos;
        public ConsultarModuloHandler(IModuloService datos)
        {
            _datos = datos;
        }

        public async Task<IList<ConsultarModulosModelo>> Handle(ConsultarModulo request, CancellationToken cancellationToken)
        {
            return await _datos.ConsultarModulosAsync(request.IdUsuario);
        }
    }
}
