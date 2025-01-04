using Backend.SecurityEducation.Aplicacion.Reporte;
using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Campania
{
    internal class ConsultarReporteEvaluacionHandler : IRequestHandler<ConsultarReporteEvaluacion, IList<ConsultarReporteEvaluacionModelo>>
    {
        private readonly IReporteService _dato;
        public ConsultarReporteEvaluacionHandler(IReporteService datos)
        {
            this._dato = datos;
        }
        public async Task<IList<ConsultarReporteEvaluacionModelo>> Handle(ConsultarReporteEvaluacion request, CancellationToken cancellationToken)
        {
            return await _dato.ConsultarReporteEvaluacionAsync(request.CodigoUsuario, request.CodigoCampania, request.CodigoModulo);
        }
    }
}
