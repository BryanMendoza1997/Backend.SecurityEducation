using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    public class ConsultarDetalleActividadLiteraturaHandler : IRequestHandler<ConsultarDetalleActividadLiteratura, ConsultarLiteraturaModelo>
    {
        private readonly IModuloService _datos;
        public ConsultarDetalleActividadLiteraturaHandler(IModuloService datos)
        {
            _datos = datos;
        }

        public async Task<ConsultarLiteraturaModelo> Handle(ConsultarDetalleActividadLiteratura request, CancellationToken cancellationToken)
        {
            if ( request.CodigoDetalleActividad == 0) throw new Exception("Error en los parametros de entrada");
            return await _datos.ConsultarDetalleLiteraturaAsync(request.CodigoDetalleActividad);
        }
    }
}
