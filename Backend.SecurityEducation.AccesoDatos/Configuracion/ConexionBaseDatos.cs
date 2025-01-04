using System.Data.SqlClient;

namespace Backend.SecurityEducation.AccesoDatos.Configuracion
{
    public class ConexionBaseDatos
    {
        private readonly string _connectionString;

        public ConexionBaseDatos(string connectionString)
        {
            _connectionString = connectionString;
        }

        public SqlConnection CreateConnection()
        {
            return new SqlConnection(_connectionString);
        }
    }
}
