using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Usuario
{
    public class ConsultarUsuarioHandler : IRequestHandler<ConsultarUsuario, IList<ConsultarUsuariosModelo>>
    {
        private readonly IUsuarioService _datos;
        public ConsultarUsuarioHandler(IUsuarioService datos)
        {
            _datos = datos;
        }

        public async Task<IList<ConsultarUsuariosModelo>> Handle(ConsultarUsuario request, CancellationToken cancellationToken)
        {
            return await _datos.ConsultarUsuariosAsync();
        }
    
    }
}
