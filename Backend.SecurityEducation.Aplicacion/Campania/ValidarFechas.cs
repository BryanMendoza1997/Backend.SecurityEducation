using Backend.SecurityEducation.Modelo.DTO;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Campania
{
    public class ValidarFechas : IRequest<ValidarFechasModelo>
    {
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }

        public ValidarFechas(ValidarFechasDto oValidarFechas)
        {
            FechaInicio = oValidarFechas.FechaInicio;
            FechaFin = oValidarFechas.FechaFin;
        }
    }
}
