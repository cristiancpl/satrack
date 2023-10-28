using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Tareas : ItemBase
    {
        public int id_categoria { get; set; }
        public int id_estado { get; set; }
        public DateOnly fecha_limite { get; set; }
        public string? descripcion { get; set; }
    }
}
