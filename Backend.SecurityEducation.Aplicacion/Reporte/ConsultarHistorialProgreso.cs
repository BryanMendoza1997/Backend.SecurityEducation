using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Reporte
{
    public class ConsultarHistorialProgreso : IRequest<IList<HistorialProgresoUsuarioModelo>>
    {
        public int CodigoUsuario { get; set; }
        public ConsultarHistorialProgreso(int CodigoUsuario)
        {
            this.CodigoUsuario = CodigoUsuario;
        }
    
    }
}
