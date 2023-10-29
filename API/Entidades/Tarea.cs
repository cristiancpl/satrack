namespace Entidades
{
    public class Tarea : ItemBase
    {
        public ItemBase? categoria { get; set; }
        public ItemBase? estado { get; set; }
        public DateTime fecha_limite { get; set; }
        public string? descripcion { get; set; }
    }
}
