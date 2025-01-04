using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Usuario
{
    public class ValidarUsuario : IRequest<ConsultaUsuario>
    {
        public string Correo { get; set; }

        public ValidarUsuario(string correo)
        {
            this.Correo = correo;
        }
    }
}
