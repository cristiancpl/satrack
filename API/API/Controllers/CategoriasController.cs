using Entidades;
using Microsoft.AspNetCore.Mvc;
using Negocio;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriasController : ControllerBase
    {

        private IGestorCategorias gestorCategorias;

        public CategoriasController(IGestorCategorias _gestorCategorias)
        {
            gestorCategorias = _gestorCategorias;
        }


        // GET: api/<CategoriasController>
        [HttpGet]
        public List<Categoria> Get()
        {
            return gestorCategorias.Consutar();
        }

    }
}
