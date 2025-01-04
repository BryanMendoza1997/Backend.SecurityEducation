using Backend.SecurityEducation.Modelo.DTO;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Reporte
{
    public class ConsultarReporteEvaluacion : IRequest<IList<ConsultarReporteEvaluacionModelo>>
    {
        public int CodigoUsuario { get; set; }
        public int CodigoCampania { get; set; }
        public int CodigoModulo { get; set; }

        public ConsultarReporteEvaluacion(int CodigoUsuario, int CodigoCampania, int CodigoModulo) 
        { 
            this.CodigoUsuario = CodigoUsuario;
            this.CodigoCampania  = CodigoCampania;
            this.CodigoModulo = CodigoModulo;
        }
    }
}
