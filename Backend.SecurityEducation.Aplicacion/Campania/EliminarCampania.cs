using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Campania
{
    public class EliminarCampania : IRequest<bool>
    {
        public int CodigoCampania { get; set; }
        public EliminarCampania(int codigoCampania) 
        {
            this.CodigoCampania = codigoCampania;
        }
    }
}
