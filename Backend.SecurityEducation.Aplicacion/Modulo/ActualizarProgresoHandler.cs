using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    public class ActualizarProgresoHandler : IRequestHandler<ActualizarProgreso, RespuestaCalificacionModelo>
    {
        private readonly IModuloService _datos;
        public ActualizarProgresoHandler(IModuloService datos)
        {
            _datos = datos;
        }

        public async Task<RespuestaCalificacionModelo> Handle(ActualizarProgreso request, CancellationToken cancellationToken)
        {

            IList<ObtenerRespuestasModelo> respuestasCorrectas = await _datos.ObtenerRespuestasCorrectasAsync(request.idActividad);
            
            int nota = 0;
            
            for (int i = 0; i < request.ListaPreguntaRespuesta.Count; i++) 
            {
                for (int j = 0; j < respuestasCorrectas.Count; j++)
                {
                    if (request.ListaPreguntaRespuesta[i].CodigoRespuesta == respuestasCorrectas[j].CodigoRespuesta)
                    {
                        nota = nota + 1;
                    }
                }
            }

            if (request != null)
            {
                await _datos.ActualizarProgresoAsync(request.idActividad, request.idUsuario, request.ListaPreguntaRespuesta, nota);
            }
            else
            {
                throw new Exception("Error parametros de entrada");
            }


            return new RespuestaCalificacionModelo
            {
                Nota = nota,
                Respuestas = respuestasCorrectas
            };




        }
    }
}
