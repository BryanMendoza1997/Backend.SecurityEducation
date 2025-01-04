using Backend.SecurityEducation.Infraestructura.Servicios;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Campania
{
    internal class FinalizarCampaniaHandler : IRequestHandler<FinalizarCampania, bool>
    {
        private readonly ICampaniaService _datos;
        public FinalizarCampaniaHandler(ICampaniaService datos)
        {
            _datos = datos;
        }
        public async Task<bool> Handle(FinalizarCampania request, CancellationToken cancellationToken)
        {
         
            return await _datos.FinalizarCampaniaAsync(request.CodigoCampania);
        }
    }
}
