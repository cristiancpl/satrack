using Entidades;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class BrokerCategorias : IBrokerCategorias
    {

        private string? conexion;

        public BrokerCategorias(Conexion _conexion)
        {
            conexion = _conexion.ConexionSatrack;
        }

        public List<Categoria> Consutar()
        {
            var categorias = new List<Categoria>();

            using (var conn = new SqlConnection(conexion))
            {
                var cmd = new SqlCommand("categorias_consultar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    categorias.Add(new Categoria
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
