using Backend.SecurityEducation.AccesoDatos.Interna;
using Backend.SecurityEducation.Modelo.Modelos;

namespace Backend.SecurityEducation.Infraestructura.Servicios
{
    public class CampaniaService : ICampaniaService
    {
        private readonly Campania _campania;
        public CampaniaService(Campania campania)
        {
            this._campania = campania;
        }

        public async Task<bool> InsertarCampaniaAsync(string nombre, DateTime fechaInicio, DateTime fechaFin, string estado, int modulo)
        {
          await _campania.InsertarCampaniaAsync(nombre, fechaInicio, fechaFin, estado, modulo);
          return true;
        }

        public async Task<ValidarFechasModelo> ValidarFechasAsync(DateTime fechaInicio, DateTime fechaFin)
        {
           return await _campania.ValidarFechasAsync(fechaInicio, fechaFin);
        }

        public async Task<IList<ConsultarCampaniasModelo>> ConsultarCampaniaAsync()
        {
            return await _campania.ConsultarCampaniaAsync();
        }

        public async Task<bool> FinalizarCampaniaAsync(int codigoCampania)
        {
            return await _campania.FinalizarCampaniaAsync(codigoCampania, DateTime.Now);
        }

        public async Task<bool> EliminarCampaniaAsync(int codigoCampania)
        {
            return await _campania.EliminarCampaniaAsync(codigoCampania);
        }

        public async Task<ValidarFechasModelo> ValidarNombreAsync(string nombre)
        {
            return await _campania.ValidarNombreAsync(nombre);
        }
    }
}
