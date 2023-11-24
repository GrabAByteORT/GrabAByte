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
        ViewBag.perfil = true;
        ViewBag.volverHome = false;
        return View();
    }
    public IActionResult IniciarSesion(bool alert)
    {
        ViewBag.volverHome = true;
        ViewBag.perfil = false;
        ViewBag.User = alert;
        return View();
    }
    public IActionResult Registro()
    {
        ViewBag.volverHome = true;
        ViewBag.perfil = false;
        return View();
    }
    public IActionResult Perfil()
    {
        ViewBag.volverHome = true;
        ViewBag.perfil = false;
        ViewBag.Usuario = BD.UsuarioIngresado;  
        return View();
    }
    public IActionResult ModalSubirReceta(string NombreReceta, List<Ingrediente> ingredientes, string Img, string Banner, string Pasos, string Desc, string Tipo)
    {
        ViewBag.volverHome = false;
        ViewBag.perfil = false;
        Receta Rece = new Receta(NombreReceta, DateTime.Today, Desc, Pasos,Tipo);
        BD.SubirReceta(Rece, ingredientes);
        return null;
    }

    public IActionResult BusquedaIngredientes()
    {
        ViewBag.volverHome = true;
        ViewBag.perfil = true;
        ViewBag.FotoDePerfil = BD.UsuarioIngresado.Foto;
        return View();
    }
    
    public IActionResult BusquedaRecetas()
    {
        ViewBag.volverHome = true;
        ViewBag.perfil = true;
        ViewBag.FotoDePerfil = BD.UsuarioIngresado.Foto;
        return View();
    }
    public IActionResult Resultados(string nombre)
    {
        ViewBag.volverHome = true;
        ViewBag.perfil = true;
        ViewBag.FotoDePerfil = BD.UsuarioIngresado.Foto;
        ViewBag.ListaRecetas = BD.LevantarRecetasPorNombre(nombre);
        return View();
    }
    public IActionResult ResultadosIng(string Ingrediente1, string Ingrediente2, string Ingrediente3)
    {
        List<string> ingredientes = new List<string>();
        ingredientes.Add(Ingrediente1);
        ingredientes.Add(Ingrediente2);
        ingredientes.Add(Ingrediente3);
        ViewBag.volverHome = true;
        ViewBag.perfil = true;
        ViewBag.FotoDePerfil = BD.UsuarioIngresado.Foto;
        List<Receta> ListaRecetas = new List<Receta>();
        foreach(string ing in ingredientes)
        {
            List<Receta> SubList = BD.LevantarRecetasPorIngrediente(ing);
            foreach(Receta rec in SubList)
            {
                ListaRecetas.Add(rec);
            }
        }
        ViewBag.Listarecetas = ListaRecetas;
        
        return View("Resultados");
    }
    public IActionResult DetalleReceta(Receta rec)
    {
        ViewBag.volverHome = true;
        ViewBag.perfil = true;
        ViewBag.ListaIngredientes = BD.LevantarIngredientesPorReceta(rec.ID);
        ViewBag.FotoDePerfil = BD.UsuarioIngresado.Foto;
        ViewBag.Receta = rec;
        return View();
    }

    public IActionResult Creditos(){
        ViewBag.perfil = true;
        ViewBag.volverHome = true;
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
