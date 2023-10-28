using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class GestorEstados : IGestorEstados
    {
        private IBrokerEstados brokerEstados;

        public GestorEstados(IBrokerEstados _brokerEstados)
        {
            brokerEstados = _brokerEstados;
        }

        public List<Estados> Consutar()
        {
            return brokerEstados.Consutar();
        }
    }
}
