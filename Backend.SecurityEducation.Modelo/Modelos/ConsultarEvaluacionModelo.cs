namespace Backend.SecurityEducation.Modelo.Modelos
{
    public class ConsultarEvaluacionModelo
    {
        public int CodigoEvaluacion {get; set;}
        public int CodigoPregunta { get; set;}
        public string? Pregunta { get; set;}
        public string? TipoPregunta { get; set;}
        public int Seccion { get; set;}
        public int Orden {  get; set;}
        public string? Respuestas { get; set;}
    }
}
