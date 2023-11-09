using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using GrabAByte.Models;

namespace GrabAByte.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        BD.LevantarRecetas();
        BD.LevantarIngredientes();
        BD.InicializarUsuario();
        return RedirectToAction("Home","Home");
    }
    public IActionResult Home()
    {
        Random rnd = new Random();
        int random = rnd.Next(0,(BD.ListaRecetas.Count-3));
        ViewBag.RecetasDestacadas = BD.ListaRecetas.GetRange(random,4);
        ViewBag.FotoDePerfil = BD.UsuarioIngresado.Foto;

        return View();
    }
    public IActionResult IniciarSesion()
    {
        return View();
    }
    public IActionResult Registro()
    {
        return View();
    }
    public IActionResult Perfil()
    {
        ViewBag.Usuario = BD.UsuarioIngresado;  
        return View();
    }
    public IActionResult BusquedaIngredientes()
    {
        ViewBag.FotoDePerfil = BD.UsuarioIngresado.Foto;
        return View();
    }
    
    public IActionResult BusquedaRecetas()
    {
        ViewBag.FotoDePerfil = BD.UsuarioIngresado.Foto;
        return View();
    }
    public IActionResult Resultados(string nombre)
    {
        ViewBag.FotoDePerfil = BD.UsuarioIngresado.Foto;
        ViewBag.ListaRecetas = BD.LevantarRecetasPorNombre(nombre);
        return View();
    }
    public IActionResult Resultados(List<Ingrediente> ingredientes)
    {
        ViewBag.FotoDePerfil = BD.UsuarioIngresado.Foto;
        for(int i = 0; i<ingredientes.Count; i++)
        {
            ViewBag.ListaRecetas += BD.LevantarRecetasPorIngrediente(ingredientes[i].ID);
        }
        
        return View();
    }
    public IActionResult DetalleReceta(Receta receta)
    {
        ViewBag.ListaIngredientes = BD.LevantarIngredientesPorReceta(receta.ID);
        ViewBag.FotoDePerfil = BD.UsuarioIngresado.Foto;
        ViewBag.Receta = receta;
        return View();
    }
    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
    

}
