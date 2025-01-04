using Backend.SecurityEducation.Modelo.DTO;
using Backend.SecurityEducation.Modelo.Modelos;

namespace Backend.SecurityEducation.Infraestructura.Servicios
{
    public interface IUsuarioService
    {
        Task<RespuestaGeneralModelo> InsertarUsuarioAsync(string nombre, string correo, DateTime fechaNacimiento, string ocupacion, string pais, string clave);
        Task<UsuarioModelo> IniciarSesion(string usuario, string clave, string claveRsa);
        Task<ConsultaUsuario> ValidarUsuarioAsync(string correo);
        Task<IList<int>> ObtenerUsuariosAsync();
        Task<bool> InicializarActividadesAsync(int codigoUsuario);
        Task<IList<ConsultarUsuariosModelo>> ConsultarUsuariosAsync();
    }
}
