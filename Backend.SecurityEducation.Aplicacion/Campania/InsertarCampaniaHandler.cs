using Backend.SecurityEducation.Infraestructura.Servicios;
using MediatR;

namespace Backend.SecurityEducation.Aplicacion.Campania
{
    public class InsertarCampaniaHandler : IRequestHandler<InsertarCampania, bool>
    {
        private readonly ICampaniaService _datos;
        private readonly IUsuarioService _usuario;
        public InsertarCampaniaHandler(ICampaniaService datos, IUsuarioService usuario)
        {
            _datos = datos;
            _usuario = usuario;
        }
        public async Task<bool> Handle(InsertarCampania request, CancellationToken cancellationToken)
        {
            if (request.FechaInicio.Date.CompareTo(DateTime.Today) == 0)
            {
                request.Estado = "Activa";
               
            }
            else
            {
                request.Estado = "Pendiente";
            }

            for (int i = 0; i < request.ListaModulos.Count; i++)
            {
                await _datos.InsertarCampaniaAsync(request.Nombre, request.FechaInicio, request.FechaFin, request.Estado, request.ListaModulos[i]);
            }

            // Ejecutar la tarea en un hilo separado
            _ = Task.Run(async () =>
            {
                IList<int> usuarios = await _usuario.ObtenerUsuariosAsync();
                for (int i = 0; i < usuarios.Count; i++)
                {
                    await _usuario.InicializarActividadesAsync(usuarios[i]);
                }
            });

            return true;
        }
    }
}
