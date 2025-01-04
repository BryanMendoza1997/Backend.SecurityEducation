using Backend.SecurityEducation.Modelo.DTO;
using Backend.SecurityEducation.Modelo.Modelos;

namespace Backend.SecurityEducation.Infraestructura.Servicios
{
    public interface IModuloService
    {
        Task<IList<ConsultarModulosModelo>> ConsultarModulosAsync(int idUsuario);

        Task<IList<ConsultarActividadesModelo>> ConsultarActividadesAsync(int idUsuario, int codigoModulo);

        Task<ConsultarLiteraturaModelo> ConsultarDetalleLiteraturaAsync(int codigoActividad);

        Task<IList<ConsultarEvaluacionModelo>> ConsultarDetalleCuestionarioAsync(int codigoActividad);

        Task<bool> ActualizarProgresoAsync(int codigoActividad, int codigoUsuario, IList<DetallePreguntaRespuestaDto> detalle, int puntaje);

        Task<IList<ObtenerRespuestasModelo>> ObtenerRespuestasCorrectasAsync(int codigoActividad);

        Task<IList<ObtenerRespuestasModelo>> ObtenerRespuestasUsuarioAsync(int idUsuario, int codigoActividad);

        Task<bool> ObtenerEstadoActividadAsync(int idUsuario, int codigoActividad);

        Task<bool> ActualizarProgresoAsync(int codigoActividad, int codigoUsuario);

        Task<IList<ConsultarListaModulos>> ConsultarListaModulosAsync();
    }
}
