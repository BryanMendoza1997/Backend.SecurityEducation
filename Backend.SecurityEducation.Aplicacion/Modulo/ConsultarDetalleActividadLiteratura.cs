using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    public class ConsultarDetalleActividadLiteratura : IRequest<ConsultarLiteraturaModelo>
    {
        public int CodigoDetalleActividad {  get; set; }

        public ConsultarDetalleActividadLiteratura(int codigoDetalleActividad)
        {
            CodigoDetalleActividad = codigoDetalleActividad;
        }
    }
}
