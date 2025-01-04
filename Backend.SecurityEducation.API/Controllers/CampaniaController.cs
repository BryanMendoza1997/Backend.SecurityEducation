using Backend.SecurityEducation.Aplicacion.Campania;
using Backend.SecurityEducation.Modelo.DTO;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace Backend.SecurityEducation.API.Controllers
{
    public class CampaniaController : Controller
    {
        private readonly ILogger<IdentidadController> _logger;
        private readonly IMediator _mediator;
        public CampaniaController(ILogger<IdentidadController> logger, IMediator mediator)
        {
            _logger = logger;
            _mediator = mediator;
        }

        [HttpPost]
        [Route("Insertar")]
        public async Task<IActionResult> Insertar([FromBody] InsertarCampaniaDto datos)
        {
            var result = await _mediator.Send(new InsertarCampania(datos));
            return Ok(result);
        }

        [HttpPost]
        [Route("ValidarFechas")]
        public async Task<IActionResult> ValidarFechas([FromBody] ValidarFechasDto datos)
        {
            var result = await _mediator.Send(new ValidarFechas(datos));
            return Ok(result);
        }

        [HttpGet]
        [Route("ValidarNombre/{nombre}")]
        public async Task<IActionResult> ValidarNombre([FromRoute] string nombre)
        {
            var result = await _mediator.Send(new ValidarNombre(nombre));
            return Ok(result);
        }

        [HttpGet]
        [Route("Listar")]
        public async Task<IActionResult> ObtenerCampanias()
        {
            var result = await _mediator.Send(new ConsultarCampania());
            return Ok(result);
        }

        [HttpPost]
        [Route("Finalizar/{codigo}")]
        public async Task<IActionResult> FinalizarCampania([FromRoute] int codigo)
        {
            var result = await _mediator.Send(new FinalizarCampania(codigo));
            return Ok(result);
        }

        [HttpDelete]
        [Route("Eliminar/{codigo}")]
        public async Task<IActionResult> EliminarCampania([FromRoute] int codigo)
        {
            var result = await _mediator.Send(new EliminarCampania(codigo));
            return Ok(result);
        }
    }
}
