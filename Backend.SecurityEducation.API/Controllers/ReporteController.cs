using Backend.SecurityEducation.Aplicacion.Campania;
using Backend.SecurityEducation.Aplicacion.Reporte;
using Backend.SecurityEducation.Modelo.DTO;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Backend.SecurityEducation.API.Controllers
{
    public class ReporteController : Controller
    {
        private readonly ILogger<IdentidadController> _logger;
        private readonly IMediator _mediator;
        public ReporteController(ILogger<IdentidadController> logger, IMediator mediator)
        {
            _logger = logger;
            _mediator = mediator;
        }

        [HttpPost]
        [Route("Puntajes")]
        public async Task<IActionResult> ConsultarPuntajes([FromBody] ObtenerPuntajeDto datos)
        {
            var result = await _mediator.Send(new ConsultarPuntaje(datos));
            return Ok(result);
        }

        [HttpGet]
        [Route("Reporte/Actividades/{codigoCampania}")]
        public async Task<IActionResult> ConsultarPuntajes([FromRoute] int codigoCampania)
        {
            var result = await _mediator.Send(new ConsultarActividadesFaltantes(codigoCampania));
            return Ok(result);
        }

        [HttpGet]
        [Route("Historial/Progreso/{codigoUsuario}")]
        public async Task<IActionResult> ConsultarHistorialProgresoUsuario([FromRoute] int codigoUsuario)
        {
            var result = await _mediator.Send(new ConsultarHistorialProgreso(codigoUsuario));
            return Ok(result);
        }

        [HttpGet]
        [Route("Reporte/Evaluacion/{codigoUsuario}/{codigoCampania}/{codigoModulo}")]
        public async Task<IActionResult> ConsultarReporteEvaluacionUsuario([FromRoute] int codigoUsuario, int codigoCampania, int codigoModulo)
        {
            var result = await _mediator.Send(new ConsultarReporteEvaluacion(codigoUsuario, codigoCampania, codigoModulo));
            return Ok(result);
        }
    }
}
