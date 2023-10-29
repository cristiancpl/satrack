using Datos;
using Entidades;

namespace Negocio
{
    public class GestorCategorias : IGestorCategorias
    {
        private IBrokerCategorias brokerCategorias;

        public GestorCategorias(IBrokerCategorias _brokerCategorias)
        {
                brokerCategorias = _brokerCategorias;
        }

        public List<Categoria> Consutar()
        {
            return brokerCategorias.Consutar();
        }

    }
}
