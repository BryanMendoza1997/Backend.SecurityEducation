using Backend.SecurityEducation.AccesoDatos.Interna;
using Backend.SecurityEducation.Modelo.DTO;
using Backend.SecurityEducation.Modelo.Modelos;
using Newtonsoft.Json;

namespace Backend.SecurityEducation.Infraestructura.Servicios
{
    public class ModuloService : IModuloService
    {
        private readonly Asignatura _modulo;
        public ModuloService(Asignatura asignatura) {
        this._modulo = asignatura;
        }

        public async Task<IList<ConsultarModulosModelo>> ConsultarModulosAsync(int idUsuario)
        {
            return await _modulo.ConsultarModulosAsync(idUsuario);
        }

        public async Task<IList<ConsultarListaModulos>> ConsultarListaModulosAsync()
        {
            return await _modulo.ConsultarListaModulosAsync();
        }

        public async Task<IList<ConsultarActividadesModelo>> ConsultarActividadesAsync(int idUsuario, int codigoModulo)
        {
            return await _modulo.ActividadesModulosAsync(idUsuario, codigoModulo);

        }

        public async Task<ConsultarLiteraturaModelo> ConsultarDetalleLiteraturaAsync(int codigoActividad)
        {
            string tipoActividad = await _modulo.ConsultarTipoActividadAsync(codigoActividad);
            if(string.IsNullOrEmpty(tipoActividad))
            {
                throw new Exception("Error en los parametros de entrada");
            }
            ConsultarLiteraturaModelo literatura = await _modulo.ConsultarDetalleActividadAsync(codigoActividad, tipoActividad.ToLower());
            return literatura;
        }

        public async Task<IList<ConsultarEvaluacionModelo>> ConsultarDetalleCuestionarioAsync(int codigoActividad)
        {
            string tipoActividad = await _modulo.ConsultarTipoActividadAsync(codigoActividad);
            if (string.IsNullOrEmpty(tipoActividad))
            {
                throw new Exception("Error en los parametros de entrada");
            }
            return await _modulo.ConsultarDetalleActividadAsync(codigoActividad, tipoActividad.ToLower()); 
        }

        /// <summary>
        /// Actualiza las tareas que tienen que ver solo con la evaluacion
        /// </summary>
        /// <param name="codigoActividad">Codigo de la actividad que se completo</param>
        /// <param name="codigoUsuario">Codigo del usuario</param>
        /// <param name="detalle">Respuestas seleccionadas por el usuario</param>
        /// <param name="puntaje">Numero de aciertos</param>
        /// <returns>Booleano que indica si la transaccion fue exitosa</returns>
        public async Task<bool> ActualizarProgresoAsync(int codigoActividad, int codigoUsuario, IList<DetallePreguntaRespuestaDto> detalle, int puntaje)
        {
            string respuestas = JsonConvert.SerializeObject(detalle);
            await _modulo.ActualizarProgresoAsync(codigoActividad, codigoUsuario, respuestas, puntaje);
            return true;
        }

        /// <summary>
        /// Actualiza las tareas que no tienen que ver con la evaluacion
        /// </summary>
        /// <param name="codigoActividad">Codigo de la actividad que se completo</param>
        /// <param name="codigoUsuario">Codigo del usuario</param>
        /// <returns>Booleano que indica si la transaccion fue exitosa</returns>
        public async Task<bool> ActualizarProgresoAsync(int codigoActividad, int codigoUsuario)
        {
            await _modulo.ActualizarProgresoAsync(codigoActividad, codigoUsuario, string.Empty, -1);
            return true;
        }

        public async Task<IList<ObtenerRespuestasModelo>> ObtenerRespuestasCorrectasAsync(int codigoActividad)
        {
           return await _modulo.ObtenerRespuestasAsync(codigoActividad);
        }

        public async Task<IList<ObtenerRespuestasModelo>> ObtenerRespuestasUsuarioAsync(int idUsuario, int codigoActividad)
        {
            return await _modulo.ObtenerRespuestasUsuarioAsync(codigoActividad, idUsuario);
        }

        public async Task<bool> ObtenerEstadoActividadAsync(int idUsuario, int codigoActividad)
        {
            return await _modulo.ObtenerEstadoActividadAsync(codigoActividad, idUsuario);
        }
    }
}
