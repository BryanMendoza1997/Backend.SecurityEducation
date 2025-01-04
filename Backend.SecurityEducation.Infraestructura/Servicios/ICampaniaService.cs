using Backend.SecurityEducation.Modelo.Modelos;

namespace Backend.SecurityEducation.Infraestructura.Servicios
{
    public interface ICampaniaService
    {
        Task<bool> InsertarCampaniaAsync(string nombre, DateTime fechaInicio, DateTime fechaFin, string estado, int modulo);
        Task<ValidarFechasModelo> ValidarFechasAsync(DateTime fechaInicio, DateTime fechaFin);
        Task<IList<ConsultarCampaniasModelo>> ConsultarCampaniaAsync();
        Task<bool> FinalizarCampaniaAsync(int codigoCampania);
        Task<bool> EliminarCampaniaAsync(int codigoCampania);
        Task<ValidarFechasModelo> ValidarNombreAsync(string nombre);
    }
}
