using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    public class ConsultarRespuestasCorrectasHandler : IRequestHandler<ConsultarRespuestasCorrectas, IList<ObtenerRespuestasModelo>>
    {
        private readonly IModuloService _datos;
        public ConsultarRespuestasCorrectasHandler(IModuloService datos)
        {
            _datos = datos;
        }

        public async Task<IList<ObtenerRespuestasModelo>> Handle(ConsultarRespuestasCorrectas request, CancellationToken cancellationToken)
        {
            return await _datos.ObtenerRespuestasCorrectasAsync( request.idActividad);
        }
    }
}
