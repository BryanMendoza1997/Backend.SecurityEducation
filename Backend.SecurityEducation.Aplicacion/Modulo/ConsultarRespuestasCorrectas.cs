using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    public class ConsultarRespuestasCorrectas : IRequest<IList<ObtenerRespuestasModelo>>
    {
        public int idActividad { get; set; }

        public ConsultarRespuestasCorrectas(int idActividad)
        {
             this.idActividad = idActividad;
        }
    }
}
