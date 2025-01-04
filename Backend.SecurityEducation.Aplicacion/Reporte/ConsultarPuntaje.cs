using Backend.SecurityEducation.Modelo.DTO;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Campania
{
    public class ConsultarPuntaje : IRequest<IList<ConsultarMejoresPuntajesModelo>>
    {
        public int CodigoCampania { get; set; }
        public int NumeroRegistros { get; set; }
        public string Categoria { get; set; }
        public ConsultarPuntaje(ObtenerPuntajeDto puntaje) 
        { 
            CodigoCampania = puntaje.CodigoCampania;
            NumeroRegistros = puntaje.NumeroRegistros;
            Categoria = puntaje.Categoria;
        }
    }
}
