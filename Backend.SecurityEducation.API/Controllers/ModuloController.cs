using Backend.SecurityEducation.Aplicacion.Modulo;
using Backend.SecurityEducation.Modelo.DTO;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace Backend.SecurityEducation.API.Controllers
{
    public class ModuloController : ControllerBase
    {
        private readonly ILogger<IdentidadController> _logger;
        private readonly IMediator _mediator;
        public ModuloController(ILogger<IdentidadController> logger, IMediator mediator)
        {
            _logger = logger;
            _mediator = mediator;
        }

        [HttpGet]
        [Authorize]
        [Route("Listar/Modulos")]
        public async Task<IActionResult> ObtenerModulos()
        {
            // Recupera los claims desde el token
            var claimsIdentity = HttpContext.User.Identity as ClaimsIdentity;
            var codigoUsuarioClaim = string.Empty;

            if (claimsIdentity != null)
            {
                codigoUsuarioClaim = claimsIdentity.FindFirst(ClaimTypes.Dsa)?.Value;
            }
            else
            {
                throw new Exception("Error en el token");
            }
            var result = await _mediator.Send(new ConsultarModulo(int.Parse(codigoUsuarioClaim)));
            return Ok(result);
        }

        [HttpGet]
        [Route("Listar/ModulosGenerales")]
        public async Task<IActionResult> ObtenerListaModulos()
        {
            var result = await _mediator.Send(new ConsultarListaModulo());
            return Ok(result);
        }

        [HttpGet]
        [Authorize]
        [Route("Modulo/{idmodulo}")]
        public async Task<IActionResult> ObtenerActividades([FromRoute] int idmodulo)
        {
            // Recupera los claims desde el token
            var claimsIdentity = HttpContext.User.Identity as ClaimsIdentity;
            var codigoUsuarioClaim = string.Empty;

            if (claimsIdentity != null)
            {
                codigoUsuarioClaim = claimsIdentity.FindFirst(ClaimTypes.Dsa)?.Value;
            }
            else
            {
                throw new Exception("Error en el token");
            }
            var result = await _mediator.Send(new ConsultarActividades(int.Parse(codigoUsuarioClaim), idmodulo));
            return Ok(result);
        }

        [HttpGet]
        [Route("Detalle/Actividad/{idactividad}")]
        public async Task<IActionResult> ObtenerDetalleActividades([FromRoute] int idactividad)
        {
            var result = await _mediator.Send(new ConsultarDetalleActividadLiteratura(idactividad));
            return Ok(result);
        }

        [HttpGet]
        [Route("Detalle/Actividad/Cuestionario/{idactividad}")]
        public async Task<IActionResult> ObtenerDetalleActividadCuestionario([FromRoute] int idactividad)
        {
            var result = await _mediator.Send(new ConsultarDetalleActividadCuestionario(idactividad));
            return Ok(result);
        }

        [HttpPost]
        [Authorize]
        [Route("Actualizar/Progreso")]
        public async Task<IActionResult> ActualizarProgreso([FromBody] PreguntaRespuestaDto respuesta )
        {
            // Recupera los claims desde el token
            var claimsIdentity = HttpContext.User.Identity as ClaimsIdentity;
            var codigoUsuarioClaim = string.Empty;

            if (claimsIdentity != null)
            {
                codigoUsuarioClaim = claimsIdentity.FindFirst(ClaimTypes.Dsa)?.Value;
            }
            else
            {
                throw new Exception("Error en el token");
            }

            var result = await _mediator.Send(new ActualizarProgreso(respuesta, int.Parse(codigoUsuarioClaim)));
            return Ok(result);
        }

        [HttpGet]
        [Authorize]
        [Route("Actualizar/Tareas/{idactividad}")]
        public async Task<IActionResult> ActualizarTarea([FromRoute] int idactividad)
        {
            // Recupera los claims desde el token
            var claimsIdentity = HttpContext.User.Identity as ClaimsIdentity;
            var codigoUsuarioClaim = string.Empty;

            if (claimsIdentity != null)
            {
                codigoUsuarioClaim = claimsIdentity.FindFirst(ClaimTypes.Dsa)?.Value;
            }
            else
            {
                throw new Exception("Error en el token");
            }

            var result = await _mediator.Send(new ActualizarTareas(idactividad, int.Parse(codigoUsuarioClaim)));
            return Ok(result);
        }

        [HttpGet]
        [Authorize]
        [Route("Respuestas/Usuario/{idactividad}")]
        public async Task<IActionResult> ObtenerRespuestasUsuario([FromRoute] int idactividad)
        {
            // Recupera los claims desde el token
            var claimsIdentity = HttpContext.User.Identity as ClaimsIdentity;
            var codigoUsuarioClaim = string.Empty;

            if (claimsIdentity != null)
            {
                codigoUsuarioClaim = claimsIdentity.FindFirst(ClaimTypes.Dsa)?.Value;
            }
            else
            {
                throw new Exception("Error en el token");
            }

            var result = await _mediator.Send(new ConsultarRespuestaUsuario(idactividad, int.Parse(codigoUsuarioClaim)));
            return Ok(result);
        }

        [HttpGet]
        [Authorize]
        [Route("Respuestas/Correctas/{idactividad}")]
        public async Task<IActionResult> ObtenerRespuestasCorrectas([FromRoute] int idactividad)
        {
            // Recupera los claims desde el token
            var claimsIdentity = HttpContext.User.Identity as ClaimsIdentity;
            var codigoUsuarioClaim = string.Empty;

            if (claimsIdentity != null)
            {
                codigoUsuarioClaim = claimsIdentity.FindFirst(ClaimTypes.Dsa)?.Value;
            }
            else
            {
                throw new Exception("Error en el token");
            }

            var result = await _mediator.Send(new ConsultarRespuestasCorrectas(idactividad));
            return Ok(result);
        }

        [HttpGet]
        [Authorize]
        [Route("Estado/Actividad/{idactividad}")]
        public async Task<IActionResult> ObtenerEstadoActividad([FromRoute] int idactividad)
        {
            // Recupera los claims desde el token
            var claimsIdentity = HttpContext.User.Identity as ClaimsIdentity;
            var codigoUsuarioClaim = string.Empty;

            if (claimsIdentity != null)
            {
                codigoUsuarioClaim = claimsIdentity.FindFirst(ClaimTypes.Dsa)?.Value;
            }
            else
            {
                throw new Exception("Error en el token");
            }

            var result = await _mediator.Send(new ConsultarEstadoActividad(int.Parse(codigoUsuarioClaim), idactividad));
            return Ok(result);
        }

    }
} 
