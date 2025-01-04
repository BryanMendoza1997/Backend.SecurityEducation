using Backend.SecurityEducation.Infraestructura.Servicios;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Campania
{
    internal class EliminarCampaniaHandler : IRequestHandler<EliminarCampania, bool>
    {
        private readonly ICampaniaService _datos;
        public EliminarCampaniaHandler(ICampaniaService datos)
        {
            _datos = datos;
        }
        public async Task<bool> Handle(EliminarCampania request, CancellationToken cancellationToken)
        {
         
            return await _datos.EliminarCampaniaAsync(request.CodigoCampania);
        }
    }
}
