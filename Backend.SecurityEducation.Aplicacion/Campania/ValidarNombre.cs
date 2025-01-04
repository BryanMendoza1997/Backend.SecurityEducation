using Backend.SecurityEducation.Modelo.DTO;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Campania
{
    public class ValidarNombre : IRequest<ValidarFechasModelo>
    {
        public string Nombre { get; set; }

        public ValidarNombre(string nombre)
        {
           Nombre = nombre;
        }
    }
}
