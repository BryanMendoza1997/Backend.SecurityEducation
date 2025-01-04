using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    public class ConsultarListaModulo : IRequest<IList<ConsultarListaModulos>>
    {
        public ConsultarListaModulo() 
        { 
        }
    }
}
