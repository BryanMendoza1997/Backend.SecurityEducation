using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Campania
{
    public class FinalizarCampania : IRequest<bool>
    {
        public int CodigoCampania { get; set; }
        public FinalizarCampania(int codigoCampania) 
        {
            this.CodigoCampania = codigoCampania;
        }
    }
}
