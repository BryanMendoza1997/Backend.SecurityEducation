using Backend.SecurityEducation.Modelo.Modelos;

namespace Backend.SecurityEducation.Infraestructura.Servicios
{
    public interface IReporteService
    {
        Task<IList<ConsultarMejoresPuntajesModelo>> ConsultarMejoresPuntajesAsync(int codigoCampania, int numeroRegistros, string tipoConsulta);
        Task<IList<ConsultarReporteActividadesModelo>> ConsultarReporteActividadesAsync(int codigoCampania);
        Task<IList<HistorialProgresoUsuarioModelo>> ConsultarHistorialProgresoAsync(int codigoUsuario);
        Task<IList<ConsultarReporteEvaluacionModelo>> ConsultarReporteEvaluacionAsync(int codigoUsuario, int codigoCampania, int codigoModulo);
    }
}
