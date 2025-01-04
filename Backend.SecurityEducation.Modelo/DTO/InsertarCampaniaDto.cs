namespace Backend.SecurityEducation.Modelo.DTO
{
    public class InsertarCampaniaDto
    {
        public string Nombre { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public List<int> ListaModulos { get; set; }
        public string Estado { get; set; }
    }
}
