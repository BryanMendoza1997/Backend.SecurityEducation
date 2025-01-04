using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Campania
{
    public class ConsultarActividadesFaltantes : IRequest<IList<ConsultarReporteActividadesModelo>>
    {
        public int CodigoCampania { get; set; }
        public ConsultarActividadesFaltantes(int CodigoCampania) 
        {
            this.CodigoCampania = CodigoCampania;
        }
    }
}
