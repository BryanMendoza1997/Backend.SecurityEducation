using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Campania
{
    public class ValidarFechasHandler : IRequestHandler<ValidarFechas, ValidarFechasModelo>
    {
        private readonly ICampaniaService _datos;
        public ValidarFechasHandler(ICampaniaService datos)
        {
            _datos = datos;
        }
        public async Task<ValidarFechasModelo> Handle(ValidarFechas request, CancellationToken cancellationToken)
        {
            return await _datos.ValidarFechasAsync(request.FechaInicio, request.FechaFin);
        }
    }
}
