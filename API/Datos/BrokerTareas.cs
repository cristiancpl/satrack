using Entidades;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class BrokerTareas : IBrokerTareas
    {
        private string? conexion;

        public BrokerTareas(Conexion _conexion)
        {
            conexion = _conexion.ConexionSatrack;
        }

        public List<Tarea> Consutar()
        {
            var tareas = new List<Tarea>();

            using (var conn = new SqlConnection(conexion))
            {
                var cmd = new SqlCommand("tareas_consultar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    tareas.Add(LeerTareaBaseDatos(reader));
                }
            }

            return tareas;
        }


        public Tarea Consutar_id(int id)
        {
            var tarea = new Tarea();

            using (var conn = new SqlConnection(conexion))
            {
                var cmd = new SqlCommand("tareas_consultar_id", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    tarea = LeerTareaBaseDatos(reader);
                }
            }

            return tarea;
        }

        private static Tarea LeerTareaBaseDatos(SqlDataReader reader)
        {
            return new Tarea
            {
                id = Convert.ToInt32(reader["id"]),
                nombre = Convert.ToString(reader["nombre"]),
                categoria = new ItemBase
                {
                    id = Convert.ToInt32(reader["id_categoria"]),
                    nombre = Convert.ToString(reader["nombre_categoria"]),
                },
                estado = new ItemBase
                {
                    id = Convert.ToInt32(reader["id_estado"]),
                    nombre = Convert.ToString(reader["nombre_estado"]),
                },
                fecha_limite = Convert.ToDateTime(reader["fecha_limite"]),
                descripcion = Convert.ToString(reader["descripcion"]),
            };
        }

        public int Guardar(string json)
        {
            using (var conn = new SqlConnection(conexion))
            {
                var cmd = new SqlCommand("tareas_merge_json", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Json", json);
                conn.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }


        public void Eliminar(int id)
        {
            using (var conn = new SqlConnection(conexion))
            {
                var cmd = new SqlCommand("tareas_eliminar", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }




    }
}
