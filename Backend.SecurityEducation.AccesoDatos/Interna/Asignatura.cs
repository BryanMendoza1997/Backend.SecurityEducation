using Backend.SecurityEducation.AccesoDatos.Configuracion;
using Backend.SecurityEducation.Modelo.Modelos;
using Dapper;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Net.Http.Headers;

namespace Backend.SecurityEducation.AccesoDatos.Interna
{
    public class Asignatura
    {
        private readonly ConexionBaseDatos _conexion;

        public Asignatura(ConexionBaseDatos conexion)
        {
            _conexion = conexion;

        }

        public async Task<IList<ConsultarModulosModelo>> ConsultarModulosAsync(int idUsuario)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_usuario", idUsuario);

                IEnumerable<ConsultarModulosModelo> usuario = await connection.QueryAsync<ConsultarModulosModelo>("sps_modulos_usuario", parameters, commandType: System.Data.CommandType.StoredProcedure);
                return usuario.ToList();
            }
        }

        public async Task<IList<ConsultarListaModulos>> ConsultarListaModulosAsync()
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();

                IEnumerable<ConsultarListaModulos> usuario = await connection.QueryAsync<ConsultarListaModulos>("sps_modulos", parameters, commandType: System.Data.CommandType.StoredProcedure);
                return usuario.ToList();
            }
        }

        public async Task<IList<ConsultarActividadesModelo>> ActividadesModulosAsync(int idUsuario, int codigoModulo)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_usuario", idUsuario);
                parameters.Add("@i_modulo", codigoModulo);

                IEnumerable<ConsultarActividadesModelo> usuario = await connection.QueryAsync<ConsultarActividadesModelo>("sps_actividades_modulo", parameters, commandType: System.Data.CommandType.StoredProcedure);
                return usuario.ToList();
            }
        }

        public async Task<string> ConsultarTipoActividadAsync(int codigoActividad)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_actividad", codigoActividad);

                string actividad = await connection.QueryFirstOrDefaultAsync<string>("sps_tipo_actividad", parameters, commandType: System.Data.CommandType.StoredProcedure);
                return actividad ?? string.Empty;
            }
        }
        public async Task<dynamic> ConsultarDetalleActividadAsync(int codigoActividad, string tipoActividad)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_actividad", codigoActividad);
                parameters.Add("@i_nombre_actividad", tipoActividad);
                ConsultarLiteraturaModelo actividad = new ConsultarLiteraturaModelo();
                IEnumerable<ConsultarEvaluacionModelo> evaluacion;
                if (tipoActividad.Equals("literatura", StringComparison.CurrentCultureIgnoreCase) || tipoActividad.Equals("ejemplo", StringComparison.CurrentCultureIgnoreCase))
                {
                    actividad = await connection.QueryFirstOrDefaultAsync<ConsultarLiteraturaModelo>("sps_detalle_actividad", parameters, commandType: System.Data.CommandType.StoredProcedure) ?? new ConsultarLiteraturaModelo();
                    return actividad ?? new ConsultarLiteraturaModelo();
                }
                else if(tipoActividad.Equals("Cuestionario", StringComparison.CurrentCultureIgnoreCase))
                {
                    evaluacion = await connection.QueryAsync<ConsultarEvaluacionModelo>("sps_detalle_actividad", parameters, commandType: System.Data.CommandType.StoredProcedure);
                    return evaluacion.ToList();
                }
                return actividad;
            }
        }

        public async Task<bool> ActualizarProgresoAsync(int codigoActividad, int codigoUsuario, string respuesta, int puntaje)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_usuario", codigoUsuario);
                parameters.Add("@i_actividad", codigoActividad);
                parameters.Add("@i_respuesta", respuesta);
                parameters.Add("@i_puntaje", puntaje);

                // Ejecutar el procedimiento almacenado sin esperar un resultado
                await connection.ExecuteAsync("spu_actualizar_progreso", parameters, commandType: System.Data.CommandType.StoredProcedure);

                return true;
            }
        }

        public async Task<IList<ObtenerRespuestasModelo>> ObtenerRespuestasAsync(int codigoActividad)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_actividad", codigoActividad);

                // Ejecutar el procedimiento almacenado sin esperar un resultado
               IEnumerable<ObtenerRespuestasModelo> evaluacion = await connection.QueryAsync<ObtenerRespuestasModelo>("sps_obtener_respuestas", parameters, commandType: System.Data.CommandType.StoredProcedure);

                return evaluacion.ToList();
            }
        }

        public async Task<IList<ObtenerRespuestasModelo>> ObtenerRespuestasUsuarioAsync(int codigoActividad, int codigoUsuario)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_usuario", codigoUsuario);
                parameters.Add("@i_actividad", codigoActividad);

                IEnumerable<ObtenerRespuestasModelo> evaluacion = await connection.QueryAsync<ObtenerRespuestasModelo>("sps_obtener_respuestas_usuario", parameters, commandType: System.Data.CommandType.StoredProcedure);

                return evaluacion.ToList();
            }
        }

        public async Task<bool> ObtenerEstadoActividadAsync(int codigoActividad, int codigoUsuario)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                // Configurando parámetros
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_usuario", codigoUsuario, DbType.Int32, ParameterDirection.Input);
                parameters.Add("@i_actividad", codigoActividad, DbType.Int32, ParameterDirection.Input);
                parameters.Add("@o_estado", dbType: DbType.Boolean, direction: ParameterDirection.Output);

                // Ejecutando el procedimiento almacenado
                await connection.ExecuteAsync("sps_estado_actividad", parameters, commandType: CommandType.StoredProcedure);

                // Obteniendo el parámetro de salida
                bool estado = parameters.Get<bool>("@o_estado");
                return estado;
            }
        }
    }
}
