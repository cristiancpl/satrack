using Entidades;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class BrokerEstados : IBrokerEstados
    {

        private string? conexion;

        public BrokerEstados(Conexion _conexion)
        {
            conexion = _conexion.ConexionSatrack;
        }

        public List<Estado> Consutar()
        {
            var estados = new List<Estado>();

            using (var conn = new SqlConnection(conexion))
            {
                var cmd = new SqlCommand("estados_consultar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    estados.Add(new Estado
                    {
                        id = Convert.ToInt32(reader["id"]),
                        nombre = Convert.ToString(reader["nombre"]),
                    });
                }
            }

            return estados;
        }

    }
}
