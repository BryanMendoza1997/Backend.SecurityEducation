namespace Backend.SecurityEducation.Modelo.Modelos
{
    public class UsuarioModelo : RespuestaGeneralModelo
    {
        public string Rol { get; set; }
        public string Nombre { get; set; }
        public string Correo { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Usuario { get; set; }
        public string CodigoUsuario { get; set; }
        public string Token {  get; set; }
    }
}
