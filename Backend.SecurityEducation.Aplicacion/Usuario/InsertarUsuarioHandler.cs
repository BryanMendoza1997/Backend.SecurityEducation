using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Usuario
{
    public class InsertarUsuarioHandler : IRequestHandler<InsertarUsuario, RespuestaGeneralModelo>
    {
        private readonly IUsuarioService _datos;
        public InsertarUsuarioHandler(IUsuarioService datos)
        {
            _datos = datos;
        }

        public async Task<RespuestaGeneralModelo> Handle(InsertarUsuario request, CancellationToken cancellationToken)
        {
            return await _datos.InsertarUsuarioAsync(request.Nombre, request.Correo, request.FechaNacimiento, request.Ocupacion,request.Pais,request.Clave);
        }
    }
}
