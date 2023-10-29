using Entidades;

namespace Negocio
{
    public interface IGestorTareas
    {
        List<Tarea> Consutar();

        Tarea Consutar_id(int id);

        int Guardar(Tarea tarea);

        void Eliminar(int id);
    }
}