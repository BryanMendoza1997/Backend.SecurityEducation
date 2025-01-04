using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    public class ConsultarEstadoActividad : IRequest<bool>
    {
        public int IdUsuario {  get; set; }
        public int IdActividad { get; set; }

        public ConsultarEstadoActividad(int IdUsuario, int IdActividad)
        {
            this.IdUsuario = IdUsuario;
            this.IdActividad = IdActividad;
        }
    }
}
