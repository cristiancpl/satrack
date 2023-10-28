using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace Datos
{
    public class BrokerCategorias : IBrokerCategorias
    {

        private string? conexion;

        public BrokerCategorias(Conexion _conexion)
        {
            conexion = _conexion.ConexionSatrack;
        }

        public List<Categorias> Consutar()
        {
            var categorias = new List<Categorias>();

            using (var conn = new SqlConnection(conexion))
            {
                var cmd = new SqlCommand("categorias_consultar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    categorias.Add(new Categorias
                    {
                        id = Convert.ToInt32(reader["id"]),
                        nombre = Convert.ToString(reader["nombre"]),
                    });
                }
            }

            return categorias;
        }

    }
}
