using System.ComponentModel.DataAnnotations;

namespace Backend.SecurityEducation.Modelo.DTO
{
    public class UsuarioDto
    {
        [Required(ErrorMessage = "Obligatorio")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "Obligatorio")]
        [EmailAddress(ErrorMessage = "Formato Incorrecto")]
        public string Correo { get; set; }

        public DateTime FechaNacimiento { get; set; }

        public string Pais { get; set; }

        public string Ocupacion { get; set; }

        [Required(ErrorMessage = "Obligatorio")]
        public string Clave { get; set; }

    }
}
