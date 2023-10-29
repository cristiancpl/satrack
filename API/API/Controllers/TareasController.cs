using Entidades;
using Microsoft.AspNetCore.Mvc;
using Negocio;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TareasController : ControllerBase
    {

        private IGestorTareas gestorTareas;

        public TareasController(IGestorTareas _gestorTareas)
        {
            gestorTareas = _gestorTareas;
        }

        // GET: api/<TareasController>
        [HttpGet]
        public List<Tarea> Get()
        {
            return gestorTareas.Consutar();
        }

        // GET api/<TareasController>/5
        [HttpGet("{id}")]
        public Tarea Get(int id)
        {
            return gestorTareas.Consutar_id(id);
        }

        // POST api/<TareasController>
        [HttpPost]
        public void Post([FromBody] Tarea tarea)
        {
            gestorTareas.Guardar(tarea);
        }

        // DELETE api/<TareasController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            gestorTareas.Eliminar(id);
        }
    }
}
