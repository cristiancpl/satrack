using Datos;
using Entidades;

namespace Negocio
{
    public class GestorEstados : IGestorEstados
    {
        private IBrokerEstados brokerEstados;

        public GestorEstados(IBrokerEstados _brokerEstados)
        {
            brokerEstados = _brokerEstados;
        }

        public List<Estado> Consutar()
        {
            return brokerEstados.Consutar();
        }
    }
}
