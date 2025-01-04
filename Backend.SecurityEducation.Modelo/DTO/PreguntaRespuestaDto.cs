namespace Backend.SecurityEducation.Modelo.DTO
{
    public class PreguntaRespuestaDto
    {
        public IList<DetallePreguntaRespuestaDto> ListaPreguntaRespuesta {  get; set; }

        public int idActividad { get; set; }
    }
}
