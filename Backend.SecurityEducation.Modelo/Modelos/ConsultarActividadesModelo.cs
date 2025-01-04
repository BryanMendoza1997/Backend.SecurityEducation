namespace Backend.SecurityEducation.Modelo.Modelos
{
    public class ConsultarActividadesModelo
    {
        public int Codigo {  get; set; }
        public string Actividad { get; set; }
        public bool Estado { get; set; }
        public DateTime ?Fecha { get; set; }
        public string Modulo { get; set; }
        public string Ruta { get; set; }
    }
}
