using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    public class ConsultarRespuestaUsuario : IRequest<IList<ObtenerRespuestasModelo>>
    {
        public int idActividad { get; set; }

        public int idUsuario { get; set; }

        public ConsultarRespuestaUsuario(int idActividad, int idUsuario)
        {
             this.idActividad = idActividad;
             this.idUsuario = idUsuario;
        }
    }
}
