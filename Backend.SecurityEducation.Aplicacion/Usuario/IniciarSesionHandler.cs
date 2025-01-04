using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Usuario
{
    public class IniciarSesionHandler : IRequestHandler<IniciarSesion, UsuarioModelo>
    {
        private readonly IUsuarioService _datos;
        public IniciarSesionHandler(IUsuarioService datos)
        {
            _datos = datos;
        }

        public async Task<UsuarioModelo> Handle(IniciarSesion request, CancellationToken cancellationToken)
        {
            return await _datos.IniciarSesion(request.Usuario, request.Clave, request.ClaveRSA);
        }
    }
}
