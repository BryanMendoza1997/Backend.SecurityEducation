using Backend.SecurityEducation.AccesoDatos.Configuracion;
using Backend.SecurityEducation.Modelo.Modelos;
using Dapper;
using System.Data.SqlClient;

namespace Backend.SecurityEducation.AccesoDatos.Interna
{
    public class Campania
    {
        private readonly ConexionBaseDatos _conexion;

        public Campania(ConexionBaseDatos conexion)
        {
            _conexion = conexion;

        }

        public async Task<bool> InsertarCampaniaAsync(string nombre, DateTime fechaInicio, DateTime fechaFin, string estado, int modulo)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_nombre", nombre);
                parameters.Add("@i_fecha_inicio", fechaInicio);
                parameters.Add("@i_fecha_fin", fechaFin);
                parameters.Add("@i_modulo", modulo);
                parameters.Add("@i_estado", estado);

                // Ejecutar el procedimiento almacenado sin esperar un resultado
                await connection.ExecuteAsync("spi_campania", parameters, commandType: System.Data.CommandType.StoredProcedure);

                return true;
            }
        }

        public async Task<ValidarFechasModelo> ValidarFechasAsync(DateTime fechaInicio, DateTime fechaFin)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_fecha_inicio", fechaInicio);
                parameters.Add("@i_fecha_fin", fechaFin);

               return  await connection.QueryFirstOrDefaultAsync<ValidarFechasModelo>("sp_validar_fechas_campania", parameters, commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public async Task<IList<ConsultarCampaniasModelo>> ConsultarCampaniaAsync()
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();

                IEnumerable<ConsultarCampaniasModelo> campanias = await connection.QueryAsync<ConsultarCampaniasModelo>("sps_campania", parameters, commandType: System.Data.CommandType.StoredProcedure);
                return campanias.ToList();
            }
        }

        public async Task<bool> FinalizarCampaniaAsync(int codigoCampania, DateTime fechaFin)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_id_campania", codigoCampania);
                parameters.Add("@i_fecha_fin", fechaFin);


                // Ejecutar el procedimiento almacenado sin esperar un resultado
                await connection.ExecuteAsync("spu_campania", parameters, commandType: System.Data.CommandType.StoredProcedure);

                return true;
            }
        }

        public async Task<bool> EliminarCampaniaAsync(int codigoCampania)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_id_campania", codigoCampania);


                // Ejecutar el procedimiento almacenado sin esperar un resultado
                await connection.ExecuteAsync("spd_campania", parameters, commandType: System.Data.CommandType.StoredProcedure);

                return true;
            }
        }

        public async Task<ValidarFechasModelo> ValidarNombreAsync(string nombre)
        {
            using (SqlConnection connection = _conexion.CreateConnection())
            {
                await connection.OpenAsync();

                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("@i_nombre", nombre);

                return await connection.QueryFirstOrDefaultAsync<ValidarFechasModelo>("sp_validar_nombre_campania", parameters, commandType: System.Data.CommandType.StoredProcedure);
            }
        }
    }
}
