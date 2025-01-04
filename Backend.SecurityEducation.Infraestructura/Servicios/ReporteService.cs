using Backend.SecurityEducation.AccesoDatos.Interna;
using Backend.SecurityEducation.Modelo.Modelos;

namespace Backend.SecurityEducation.Infraestructura.Servicios
{
    public class ReporteService : IReporteService
    {
        private readonly Reporte _reporte;
        public ReporteService(Reporte reporte)
        {
            this._reporte = reporte;
        }
        public async Task<IList<ConsultarMejoresPuntajesModelo>> ConsultarMejoresPuntajesAsync(int codigoCampania, int numeroRegistros, string tipoConsulta)
        {
           return await _reporte.ConsultarMejoresPuntajesAsync(codigoCampania, numeroRegistros, tipoConsulta);
        }
        public async Task<IList<ConsultarReporteActividadesModelo>> ConsultarReporteActividadesAsync(int codigoCampania)
        {
            return await _reporte.ConsultarReporteActividadesAsync(codigoCampania);
        }

        public async Task<IList<HistorialProgresoUsuarioModelo>> ConsultarHistorialProgresoAsync(int codigoUsuario)
        {
            return await _reporte.HistorialCampaniaAsync(codigoUsuario);
        }

        public async Task<IList<ConsultarReporteEvaluacionModelo>> ConsultarReporteEvaluacionAsync(int codigoUsuario, int codigoCampania, int codigoModulo)
        {
            return await _reporte.ReporteEvaluacionAsync(codigoUsuario, codigoCampania, codigoModulo);
        }
    }
}
