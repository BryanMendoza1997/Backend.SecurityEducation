using Backend.SecurityEducation.Infraestructura.Servicios;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    internal class ConsultarEstadoActividadHandler : IRequestHandler<ConsultarEstadoActividad, bool>
    {
        private readonly IModuloService _datos;
        public ConsultarEstadoActividadHandler(IModuloService datos)
        {
            _datos = datos;
        }

        public async Task<bool> Handle(ConsultarEstadoActividad request, CancellationToken cancellationToken)
        {
            if (request.IdActividad == 0) throw new Exception("Error en los parametros de entrada");
            return await _datos.ObtenerEstadoActividadAsync(request.IdUsuario, request.IdActividad);
        }
    }
}
