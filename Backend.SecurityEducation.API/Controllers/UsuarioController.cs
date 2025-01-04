using Backend.SecurityEducation.Aplicacion.Usuario;
using Backend.SecurityEducation.Modelo.DTO;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Backend.SecurityEducation.API.Controllers
{
    public class UsuarioController : ControllerBase
    {
        private readonly ILogger<IdentidadController> _logger;
        private readonly IMediator _mediator;
        private readonly IConfiguration _configuration;
        public UsuarioController(ILogger<IdentidadController> logger, IMediator mediator, IConfiguration configuration)
        {
            _logger = logger;
            _mediator = mediator;
            _configuration = configuration;
        }

        [HttpPost]
        [Route("RegistrarUsuario")]
        public async Task<IActionResult> RegistrarUsuarios([FromBody] UsuarioDto datosUsuario)
        {
            var result = await _mediator.Send(new InsertarUsuario(datosUsuario));
            return Ok(result);
        }

        [HttpGet]
        [Route("IniciarSesion/{usuario}/{clave}")]
        public async Task<IActionResult> ObtenerUsuarios([FromRoute] string usuario, string clave)
        {
            IniciarSesionDto datos = new IniciarSesionDto()
            {
                Usuario = usuario,
                Clave = clave
            };

            if(string.IsNullOrEmpty( _configuration["EncryptionKey"]))
            {
                throw new Exception("Error en el servicio");
            }

            UsuarioModelo result = await _mediator.Send(new IniciarSesion(datos, _configuration["EncryptionKey"]));
            return Ok(result);
        }

        [HttpGet]
        [Route("ValidarUsuario/{correo}")]
        public async Task<IActionResult> ValidarUsuarios([FromRoute] string correo)
        {
            return Ok(await _mediator.Send(new ValidarUsuario(correo)));
        }

        [HttpGet]
        [Route("Usuarios")]
        public async Task<IActionResult> ConsultarUsuarios()
        {
            return Ok(await _mediator.Send(new ConsultarUsuario()));
        }
    }
}
