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
    public class BrokerEstados : IBrokerEstados
    {

        private string? conexion;

        public BrokerEstados(Conexion _conexion)
        {
            conexion = _conexion.ConexionSatrack;
        }

        public List<Estados> Consutar()
        {
            var estados = new List<Estados>();

            using (var conn = new SqlConnection(conexion))
            {
                var cmd = new SqlCommand("estados_consultar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    estados.Add(new Estados
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
