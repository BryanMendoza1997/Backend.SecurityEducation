using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Backend.SecurityEducation.Modelo.Modelos
{
    public class ConsultarModulosModelo
    {
        public int Codigo { get; set; }

        public string Nombre { get; set; }

        public string Descripcion { get; set; }

        public string Imagen { get; set; }

        public string Ruta { get; set; }

        public double progreso { get; set; }
    }
}
