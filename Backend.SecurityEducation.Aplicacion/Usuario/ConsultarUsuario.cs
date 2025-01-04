using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Usuario
{
    public class ConsultarUsuario : IRequest<IList<ConsultarUsuariosModelo>>
    {
        public ConsultarUsuario()
        {
        }
    }
}
