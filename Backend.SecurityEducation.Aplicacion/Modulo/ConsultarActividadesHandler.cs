using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    public class ConsultarActividadesHandler : IRequestHandler<ConsultarActividades, IList<ConsultarActividadesModelo>>
    {
        private readonly IModuloService _datos;
        public ConsultarActividadesHandler(IModuloService datos)
        {
            _datos = datos;
        }

        public async Task<IList<ConsultarActividadesModelo>> Handle(ConsultarActividades request, CancellationToken cancellationToken)
        {
            if (request.idUsuario == 0 || request.idModulo == 0) throw new Exception("Error en los parametros de entrada");
            return await _datos.ConsultarActividadesAsync(request.idUsuario, request.idModulo);
        }
    }
}
