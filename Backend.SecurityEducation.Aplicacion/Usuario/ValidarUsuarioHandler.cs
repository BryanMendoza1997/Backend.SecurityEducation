using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Usuario
{
    public class ValidarUsuarioHandler : IRequestHandler<ValidarUsuario, ConsultaUsuario>
    {
        private readonly IUsuarioService _datos;
        public ValidarUsuarioHandler(IUsuarioService datos)
        {
            _datos = datos;
        }

        public async Task<ConsultaUsuario> Handle(ValidarUsuario request, CancellationToken cancellationToken)
        {
            if (!(request.Correo.Length > 0)) throw new Exception("Error no se recibio el valor de entrada");
            return await _datos.ValidarUsuarioAsync(request.Correo);
        }
    }
}
