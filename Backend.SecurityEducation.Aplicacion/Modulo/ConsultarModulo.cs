using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    public class ConsultarModulo : IRequest<IList<ConsultarModulosModelo>>
    {
        public int IdUsuario { get; set; }

        public ConsultarModulo(int IdUsuario) 
        { 
            this.IdUsuario = IdUsuario;
        }
    }
}
