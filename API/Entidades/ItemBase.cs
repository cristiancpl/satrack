namespace Entidades
{
    /// <summary>
    /// Define la información común de un artículo o unidad del sistema perteneciente a
    /// una colección, enumeración o serie.
    /// </summary>
    public class ItemBase
    {

        /// <summary>
        /// Obtiene o establece el identificador interno del ítem.
        /// </summary>
        public int id { get; set; }

        /// <summary>
        /// Obtiene o establece el nombre del ítem.
        /// </summary>
        public string? nombre { get; set; }

    }
}
