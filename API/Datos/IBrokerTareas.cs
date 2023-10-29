using Entidades;

namespace Datos
{
    public interface IBrokerTareas
    {
        List<Tarea> Consutar();

        Tarea Consutar_id(int id);

        int Guardar(string json);

        void Eliminar(int id);
    }
}