using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Modulo
{
    public class ConsultarActividades : IRequest<IList<ConsultarActividadesModelo>>
    {
        public int idUsuario { get; set; }
        public int idModulo { get; set;}

        public ConsultarActividades (int idUsuario, int idModulo)
        {
            this.idModulo = idModulo;
            this.idUsuario = idUsuario;
        }
    }
}
