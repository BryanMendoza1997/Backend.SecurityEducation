using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    public class ConsultarDetalleActividadCuestionarioHandler : IRequestHandler<ConsultarDetalleActividadCuestionario, IList<ConsultarEvaluacionModelo>>
    {
        private readonly IModuloService _datos;
        public ConsultarDetalleActividadCuestionarioHandler(IModuloService datos)
        {
            _datos = datos;
        }

        public async Task<IList<ConsultarEvaluacionModelo>> Handle(ConsultarDetalleActividadCuestionario request, CancellationToken cancellationToken)
        {
            if ( request.CodigoDetalleActividad == 0) throw new Exception("Error en los parametros de entrada");
            return await _datos.ConsultarDetalleCuestionarioAsync(request.CodigoDetalleActividad);
        }
    }
}
