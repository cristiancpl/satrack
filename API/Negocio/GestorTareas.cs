using Datos;
using Entidades;
using Newtonsoft.Json;

namespace Negocio
{
    public class GestorTareas : IGestorTareas
    {
        private IBrokerTareas brokerTareas;

        public GestorTareas(IBrokerTareas _brokerTareas)
        {
            brokerTareas = _brokerTareas;
        }

        public List<Tarea> Consutar()
        {
            return brokerTareas.Consutar();
        }

        public Tarea Consutar_id(int id)
        {
            return brokerTareas.Consutar_id(id);
        }

        public int Guardar(Tarea tarea)
        {
            return brokerTareas.Guardar(JsonConvert.SerializeObject(tarea));
        }

        public void Eliminar(int id)
        {
            brokerTareas.Eliminar(id);
        }

    }
}
