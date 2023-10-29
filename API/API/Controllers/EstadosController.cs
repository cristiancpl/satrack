using Entidades;
using Microsoft.AspNetCore.Mvc;
using Negocio;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EstadosController : ControllerBase
    {
        private IGestorEstados gestorEstados;

        public EstadosController(IGestorEstados _gestorEstados)
        {
            gestorEstados = _gestorEstados;
        }


        // GET: api/<EstadosController>
        [HttpGet]
        public List<Estado> Get()
        {
            return gestorEstados.Consutar();
        }

    }
}
