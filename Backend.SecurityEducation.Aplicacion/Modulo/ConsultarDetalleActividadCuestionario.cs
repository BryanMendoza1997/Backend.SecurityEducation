using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    public class ConsultarDetalleActividadCuestionario : IRequest<IList<ConsultarEvaluacionModelo>>
    {
        public int CodigoDetalleActividad {  get; set; }

        public ConsultarDetalleActividadCuestionario(int codigoDetalleActividad)
        {
            CodigoDetalleActividad = codigoDetalleActividad;
        }
    }
}
