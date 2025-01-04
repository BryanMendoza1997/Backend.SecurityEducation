using Backend.SecurityEducation.Modelo.DTO;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Usuario
{
    public class InsertarUsuario : IRequest<RespuestaGeneralModelo>
    {
        public string Nombre { get; set; }
        public string Correo { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Pais { get; set; }
        public string Ocupacion { get; set; }
        public string Clave { get; set; }

        public InsertarUsuario (UsuarioDto usuario)
        {
            Nombre = usuario.Nombre;
            Correo = usuario.Correo;
            FechaNacimiento = usuario.FechaNacimiento;
            Pais = usuario.Pais;
            Ocupacion = usuario.Ocupacion;
            Clave = usuario.Clave;
        }
    }
}
