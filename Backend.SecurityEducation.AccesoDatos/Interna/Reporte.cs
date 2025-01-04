using Backend.SecurityEducation.AccesoDatos.Configuracion;
using Backend.SecurityEducation.Modelo.Modelos;
using Dapper;
using System.Data.SqlClient;

namespace Backend.SecurityEducation.AccesoDatos.Interna
{
    public class Reporte
    {
        private readonly ConexionBaseDatos _conexion;

        public Reporte(ConexionBaseDatos conexion)
        {
            _conexion = conexion;

        }

        public async Task<IList<ConsultarMejoresPuntajesModelo>> ConsultarMejoresPuntajesAsync(int codigoCampania, int numeroRegistros, string tipoConsulta)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_id_campania", codigoCampania);
                parameters.Add("@i_numero_participantes", numeroRegistros);
                parameters.Add("@i_tipo", tipoConsulta);

                IEnumerable<ConsultarMejoresPuntajesModelo> participantes = await connection.QueryAsync<ConsultarMejoresPuntajesModelo>("sps_mejores_puntajes", parameters, commandType: System.Data.CommandType.StoredProcedure);
                return participantes.ToList();
            }
        }

        public async Task<IList<ConsultarReporteActividadesModelo>> ConsultarReporteActividadesAsync(int codigoCampania)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_codigo_campania", codigoCampania);

                IEnumerable<ConsultarReporteActividadesModelo> reporte = await connection.QueryAsync<ConsultarReporteActividadesModelo>("sps_reporte_actividades", parameters, commandType: System.Data.CommandType.StoredProcedure);
                return reporte.ToList();
            }
        }

        public async Task<IList<HistorialProgresoUsuarioModelo>> HistorialCampaniaAsync(int codigoUsuario)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_usuario", codigoUsuario);

                IEnumerable<HistorialProgresoUsuarioModelo> reporte = await connection.QueryAsync<HistorialProgresoUsuarioModelo>("sps_usuario_historial_progreso", parameters, commandType: System.Data.CommandType.StoredProcedure);
                return reporte.ToList();
            }
        }

        public async Task<IList<ConsultarReporteEvaluacionModelo>> ReporteEvaluacionAsync(int codigoUsuario, int codigoCampania, int codigoModulo)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@id_usuario", codigoUsuario);
                parameters.Add("@id_campania", codigoCampania);
                parameters.Add("@id_modulo", codigoModulo);

                IEnumerable<ConsultarReporteEvaluacionModelo> reporte = await connection.QueryAsync<ConsultarReporteEvaluacionModelo>("sps_reporte_evaluacion", parameters, commandType: System.Data.CommandType.StoredProcedure);
                return reporte.ToList();
            }
        }
    }
}
