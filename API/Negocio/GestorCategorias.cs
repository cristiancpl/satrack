using Datos;
using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class GestorCategorias : IGestorCategorias
    {
        private IBrokerCategorias brokerCategorias;

        public GestorCategorias(IBrokerCategorias _brokerCategorias)
        {
                brokerCategorias = _brokerCategorias;
        }

        public List<Categorias> Consutar()
        {
            return brokerCategorias.Consutar();
        }

    }
}
