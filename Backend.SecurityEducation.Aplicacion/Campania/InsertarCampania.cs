using Backend.SecurityEducation.Modelo.DTO;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Campania
{
    public class InsertarCampania : IRequest<bool>
    {
        public string Nombre { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public List<int> ListaModulos { get; set; }
        public string Estado { get; set; }
        public InsertarCampania(InsertarCampaniaDto datosCampania) 
        { 
            Nombre = datosCampania.Nombre;
            FechaFin = datosCampania.FechaFin;
            FechaInicio = datosCampania.FechaInicio;
            ListaModulos = datosCampania.ListaModulos;
            Estado = datosCampania.Estado;
        }
    }
}
