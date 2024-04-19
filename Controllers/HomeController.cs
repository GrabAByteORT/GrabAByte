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
        ViewBag.Guardadas = BD.LevantarRecetasGuardadas(BD.UsuarioIngresado.ID);
        ViewBag.Creadas = BD.LevantarRecetasCreadas(BD.UsuarioIngresado.ID); 
        return View();
    }
    public IActionResult ModalSubirReceta(string NombreReceta, List<Ingrediente> ingredientes, List<Paso> Pasos, string Img, string Banner, string Desc, string Tipo)
    {
        ViewBag.volverHome = false;
        ViewBag.perfil = false;
        Receta Rece = new Receta(NombreReceta, DateTime.Today, Desc,Tipo);
        BD.SubirReceta(Rece, ingredientes,Pasos);
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
        List<Receta> ListaRecetas = new List<Receta>();
        ViewBag.volverHome = true;
        ViewBag.perfil = true;
        ViewBag.FotoDePerfil = BD.UsuarioIngresado.Foto;
        ListaRecetas = BD.LevantarRecetasPorNombre(nombre);
        ViewBag.ListaRecetas = ListaRecetas;
        ViewBag.ListaNula = ListaRecetas.Count()==0;
        return View();
    }
    public IActionResult ResultadosIng(string Ingrediente1, string Ingrediente2, string Ingrediente3)
{
    int cantIngredientes = new[] { Ingrediente1, Ingrediente2, Ingrediente3 }.Count(ing => ing != null);
    List<string> ingredientes = new List<string> { Ingrediente1, Ingrediente2, Ingrediente3 };

    ViewBag.volverHome = true;
    ViewBag.perfil = true;
    ViewBag.FotoDePerfil = BD.UsuarioIngresado.Foto;

    List<Receta> SubList = ingredientes
        .SelectMany(ing => BD.LevantarRecetasPorIngrediente(ing))
        .ToList();

    SubList = SacarDuplicados(SubList);

    ViewBag.Listarecetas = SubList.Distinct();
    ViewBag.ListaNula = SubList.Count == 0;
    return View("Resultados");
}

public List<Receta> SacarDuplicados(List<Receta> list)
{
    List<Receta> returnList = new List<Receta>();
    foreach (Receta rec in list)
    {
        if(returnList.Find(elem => elem.ID == rec.ID)==null){
           returnList.Add(rec); 
        }
    }
    return returnList;
}
    public IActionResult DetalleReceta(int IDReceta)
    {
        Receta rec = BD.RecetaPorID(IDReceta);
        ViewBag.volverHome = true;
        ViewBag.perfil = true;
        ViewBag.ListaIngredientes = BD.LevantarIngredientesPorReceta(rec.ID);
        ViewBag.Usuario = BD.UsuarioIngresado;
        ViewBag.IDUsuario = BD.UsuarioIngresado.ID;
        ViewBag.Receta = rec;
        ViewBag.ListaPasos = BD.LevantarPasosPorReceta(rec.ID);
        ViewBag.AlertGuardado = false;
        List<Valoracion>ListaValoraciones = BD.LevantarValoracionPorReceta(rec.ID);
        double sumatiempo = 0;
        double sumapuntaje = 0;
        double sumadificultad = 0;
        int i = 0;
        foreach (Valoracion val in ListaValoraciones)
        {
            sumatiempo += val.Tiempo;
            sumapuntaje += val.Puntaje;
            sumadificultad += val.Dificultad;
            i++;
        }
        if (i != 0)
        {
            ViewBag.Puntaje = sumapuntaje/i;
            ViewBag.Dificultad = sumadificultad/i;
            ViewBag.Tiempo = sumatiempo/i;
            ViewBag.MostrarVal = true;  
        }
        else
        {
            ViewBag.MostrarVal = false;
        }

        return View();
    }
    public IActionResult DetalleRecetaAlerta(int IDReceta)
    {
        Receta rec = BD.RecetaPorID(IDReceta);
        ViewBag.volverHome = true;
        ViewBag.perfil = true;  
        ViewBag.ListaIngredientes = BD.LevantarIngredientesPorReceta(rec.ID);
        ViewBag.Usuario = BD.UsuarioIngresado;
        ViewBag.IDUsuario = BD.UsuarioIngresado.ID;
        ViewBag.Receta = rec;
        ViewBag.ListaPasos = BD.LevantarPasosPorReceta(rec.ID);
        ViewBag.AlertGuardado = true;

        List<Valoracion>ListaValoraciones = BD.LevantarValoracionPorReceta(rec.ID);
        double sumatiempo = 0;
        double sumapuntaje = 0;
        double sumadificultad = 0;
        int i = 0;
        foreach (Valoracion val in ListaValoraciones)
        {
            sumatiempo += val.Tiempo;
            sumapuntaje += val.Puntaje;
            sumadificultad += val.Dificultad;
            i++;
        }
        if (i != 0)
        {
            ViewBag.Puntaje = sumapuntaje/i;
            ViewBag.Dificultad = sumadificultad/i;
            ViewBag.Tiempo = sumatiempo/i;
            ViewBag.MostrarVal = true;  
        }
        else
        {
            ViewBag.MostrarVal = false;
        }
        return View("DetalleReceta");
    }
    public IActionResult Creditos(){
        ViewBag.perfil = true;
        ViewBag.volverHome = true;
        return View();
    }

    public IActionResult Sorprendeme(){
        Random rnd = new Random();
        int random = rnd.Next(0,(BD.ListaRecetas.Count));
        Receta rec = BD.ListaRecetas[random];
        return RedirectToAction("DetalleReceta","Home", new {IDReceta = rec.ID});
    }
    public IActionResult Valoracion(int IDReceta, int Puntaje, int Dificultad, int Tiempo){
        Valoracion val = new Valoracion(IDReceta, Puntaje, Dificultad, Tiempo);
        BD.IngresarValoracion(val);
        return RedirectToAction("DetalleReceta","Home", new {IDReceta = IDReceta});
    }
    public IActionResult LogOut()
    {
        BD.InicializarUsuario();
        return RedirectToAction("Home");
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
