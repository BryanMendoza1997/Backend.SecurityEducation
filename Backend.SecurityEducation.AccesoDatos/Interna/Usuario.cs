using Backend.SecurityEducation.AccesoDatos.Configuracion;
using Backend.SecurityEducation.Modelo.DTO;
using Backend.SecurityEducation.Modelo.Modelos;
using Dapper;
using System.Data.SqlClient;

namespace Backend.SecurityEducation.AccesoDatos.Interna
{
    public class Usuario
    {
        private readonly ConexionBaseDatos _conexion;

        public Usuario(ConexionBaseDatos conexion)
        {
            _conexion = conexion;
        }

        public async Task<RespuestaGeneralModelo> RegistrarUsuarioAsync(UsuarioDto datosUsuario, string salt)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                // Crear los parámetros dinámicos
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_nombre", datosUsuario.Nombre);
                parameters.Add("@i_correo", datosUsuario.Correo);
                parameters.Add("@i_fecha_nacimiento", datosUsuario.FechaNacimiento.Date);
                parameters.Add("@i_pais", datosUsuario.Pais);
                parameters.Add("@i_ocupacion", datosUsuario.Ocupacion);
                parameters.Add("@i_clave", datosUsuario.Clave);
                parameters.Add("@i_salt", salt);

                RespuestaGeneralModelo usuario = await connection.QueryFirstOrDefaultAsync<RespuestaGeneralModelo>("spi_usuario",parameters,commandType: System.Data.CommandType.StoredProcedure);
                return usuario;
            }
        }

        public async Task<string> ObtenerLlaveAsync(string usuario)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_usuario", usuario);

                ObtenerSaltModelo datos = await connection.QueryFirstOrDefaultAsync<ObtenerSaltModelo>("sps_usuario_salt", parameters, commandType: System.Data.CommandType.StoredProcedure);
                return datos.Codigo ?? string.Empty;
            }
        }

        public async Task<UsuarioModelo> IniciarSesionAsync(string usuario, string clave)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_usuario", usuario);
                parameters.Add("@i_clave", clave);

                UsuarioModelo datosUsuario = await connection.QueryFirstOrDefaultAsync<UsuarioModelo>("sps_iniciar_sesion_usuario", parameters, commandType: System.Data.CommandType.StoredProcedure);
                return datosUsuario;
            }
        }

        public async Task<ConsultaUsuario> ValidarUsuarioAsync(string correo)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_correo", correo);

                ConsultaUsuario respuesta = await connection.QueryFirstOrDefaultAsync<ConsultaUsuario>("sps_existe_usuario", parameters, commandType: System.Data.CommandType.StoredProcedure);
                return respuesta;
            }
        }

        public async Task<IList<int>> ConsultarUsuariosAsync()
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();

                IEnumerable<int> usuario = await connection.QueryAsync<int>("sps_usuarios", parameters, commandType: System.Data.CommandType.StoredProcedure);
                return usuario.ToList();
            }
        }

        public async Task<bool> InicializarActividadesAsync(int codigoUsuario)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_usuario", codigoUsuario);

                await connection.ExecuteAsync("spi_inicializar_usuario_actividad", parameters, commandType: System.Data.CommandType.StoredProcedure);
                return true;
            }
        }

        public async Task<IList<ConsultarUsuariosModelo>> ObtenerUsuariosAsync()
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();

                IEnumerable<ConsultarUsuariosModelo> usuario = await connection.QueryAsync<ConsultarUsuariosModelo>("sps_datos_usuario", parameters, commandType: System.Data.CommandType.StoredProcedure);
                return usuario.ToList();
            }
        }
    }
}
