using System.ComponentModel.DataAnnotations;

namespace Backend.SecurityEducation.Modelo.DTO
{
    public class IniciarSesionDto
    {
        [Required(ErrorMessage = "Obligatorio")]
        [EmailAddress(ErrorMessage = "Formato Incorrecto")]
        public string Usuario { get; set; }

        [Required(ErrorMessage = "Obligatorio")]
        public string Clave { get; set; }
    }
}
