using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Campania
{
    internal class ConsultarActividadesFaltantesHandler : IRequestHandler<ConsultarActividadesFaltantes, IList<ConsultarReporteActividadesModelo>>
    {
        private readonly IReporteService _dato;
        public ConsultarActividadesFaltantesHandler(IReporteService datos)
        {
            this._dato = datos;
        }
        public async Task<IList<ConsultarReporteActividadesModelo>> Handle(ConsultarActividadesFaltantes request, CancellationToken cancellationToken)
        {
            return await _dato.ConsultarReporteActividadesAsync(request.CodigoCampania);
        }
    }
}
