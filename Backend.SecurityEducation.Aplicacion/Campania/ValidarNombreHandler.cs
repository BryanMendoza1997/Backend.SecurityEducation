using Backend.SecurityEducation.Infraestructura.Servicios;
using Backend.SecurityEducation.Modelo.Modelos;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Campania
{
    public class ValidarNombreHandler : IRequestHandler<ValidarNombre, ValidarFechasModelo>
    {
        private readonly ICampaniaService _datos;
        public ValidarNombreHandler(ICampaniaService datos)
        {
            _datos = datos;
        }
        public async Task<ValidarFechasModelo> Handle(ValidarNombre request, CancellationToken cancellationToken)
        {
            if (!string.IsNullOrEmpty(request.Nombre))
            {
                return await _datos.ValidarNombreAsync(request.Nombre);
            }
            return new ValidarFechasModelo() { respuesta = true };
            
        }
    }
}
