using Backend.SecurityEducation.Modelo.DTO;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    public class ActualizarProgreso : IRequest<RespuestaCalificacionModelo>
    {
        public IList<DetallePreguntaRespuestaDto> ListaPreguntaRespuesta { get; set; }

        public int idActividad { get; set; }

        public int idUsuario { get; set; }

        public ActualizarProgreso(PreguntaRespuestaDto respuesta, int idUsuario)
        {
            this.ListaPreguntaRespuesta = respuesta.ListaPreguntaRespuesta;
            this.idActividad = respuesta.idActividad;
            this.idUsuario=idUsuario;
        }
    }
}
