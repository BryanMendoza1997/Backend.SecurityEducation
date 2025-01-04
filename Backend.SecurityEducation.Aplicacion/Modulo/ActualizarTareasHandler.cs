using Backend.SecurityEducation.Infraestructura.Servicios;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    internal class ActualizarTareasHandler : IRequestHandler<ActualizarTareas, bool>
    {
        private readonly IModuloService _datos;
        public ActualizarTareasHandler(IModuloService datos)
        {
            _datos = datos;
        }

        public async Task<bool> Handle(ActualizarTareas request, CancellationToken cancellationToken)
        {
            if (request.IdActividad == 0) throw new Exception("Error en los parametros de entrada");
            return await _datos.ActualizarProgresoAsync(request.IdActividad, request.IdUsuario);
        }
    }
}
