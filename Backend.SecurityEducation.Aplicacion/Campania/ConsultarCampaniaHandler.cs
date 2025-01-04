using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Campania
{
    internal class ConsultarCampaniaHandler : IRequestHandler<ConsultarCampania, IList<ConsultarCampaniasModelo>>
    {
        private readonly ICampaniaService _datos;
        public ConsultarCampaniaHandler(ICampaniaService datos)
        {
            _datos = datos;
        }
        public async Task<IList<ConsultarCampaniasModelo>> Handle(ConsultarCampania request, CancellationToken cancellationToken)
        {

            return await _datos.ConsultarCampaniaAsync();
        }
    }
}
