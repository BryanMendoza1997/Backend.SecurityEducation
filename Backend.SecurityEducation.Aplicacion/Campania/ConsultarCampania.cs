using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Campania
{
    public class ConsultarCampania : IRequest<IList<ConsultarCampaniasModelo>>
    {
        public ConsultarCampania() { }
    }
}
