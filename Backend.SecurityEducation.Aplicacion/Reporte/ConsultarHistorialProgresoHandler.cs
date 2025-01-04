using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Reporte
{
    public class ConsultarHistorialProgresoHandler : IRequestHandler<ConsultarHistorialProgreso, IList<HistorialProgresoUsuarioModelo>>
    {
        private readonly IReporteService _dato;
        public ConsultarHistorialProgresoHandler(IReporteService datos)
        {
            this._dato = datos;
        }
        public async Task<IList<HistorialProgresoUsuarioModelo>> Handle(ConsultarHistorialProgreso request, CancellationToken cancellationToken)
        {
            return await _dato.ConsultarHistorialProgresoAsync(request.CodigoUsuario);
        }
    
    }
}
