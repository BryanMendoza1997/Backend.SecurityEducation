using Backend.SecurityEducation.Modelo.DTO;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Usuario
{
    public class IniciarSesion : IRequest<UsuarioModelo>
    {
        public string Usuario {  get; set; }
        public string Clave { get; set; }

        public string ClaveRSA { get; set; }

        public IniciarSesion (IniciarSesionDto datos, string claveRsa)
        {
            Usuario = datos.Usuario;
            Clave = datos.Clave;
            ClaveRSA = claveRsa;
        }
    }
}
