using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Campania
{
    internal class ConsultarPuntajeHandler : IRequestHandler<ConsultarPuntaje, IList<ConsultarMejoresPuntajesModelo>>
    {
        private readonly IReporteService _dato;
        public ConsultarPuntajeHandler(IReporteService datos)
        {
            this._dato = datos;
        }
        public async Task<IList<ConsultarMejoresPuntajesModelo>> Handle(ConsultarPuntaje request, CancellationToken cancellationToken)
        {
            if(request.CodigoCampania == 0)
            {
                request.Categoria = "GLOBAL";
            }
            return await _dato.ConsultarMejoresPuntajesAsync(request.CodigoCampania, request.NumeroRegistros, request.Categoria);
        }
    }
}
