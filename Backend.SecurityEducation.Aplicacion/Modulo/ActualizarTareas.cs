using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    public class ActualizarTareas : IRequest<bool>
    {
        public int IdActividad { get; set; }
        public int IdUsuario { get; set; }

        public ActualizarTareas(int idActividad, int idUsuario ) 
        { 
            IdActividad = idActividad;
            IdUsuario = idUsuario;
        }
    }
}
