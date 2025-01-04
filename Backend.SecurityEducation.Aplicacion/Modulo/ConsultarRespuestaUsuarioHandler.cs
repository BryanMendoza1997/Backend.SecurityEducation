using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    public class ConsultarRespuestaUsuarioHandler: IRequestHandler<ConsultarRespuestaUsuario, IList<ObtenerRespuestasModelo>>
    {
        private readonly IModuloService _datos;
        public ConsultarRespuestaUsuarioHandler(IModuloService datos)
        {
            _datos = datos;
        }

        public async Task<IList<ObtenerRespuestasModelo>> Handle(ConsultarRespuestaUsuario request, CancellationToken cancellationToken)
        {
            return await _datos.ObtenerRespuestasUsuarioAsync(request.idUsuario, request.idActividad);
        }
    }
}
