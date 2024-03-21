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
        List<string> ingredientes = new List<string>();
        ingredientes.Add(Ingrediente1);
        ingredientes.Add(Ingrediente2);
        ingredientes.Add(Ingrediente3);
        ViewBag.volverHome = true;
        ViewBag.perfil = true;
        ViewBag.FotoDePerfil = BD.UsuarioIngresado.Foto;
        List<Receta> ListaRecetas = new List<Receta>();
        List<Receta> SubListOut = new List<Receta>();
        List<Receta> ListaRecetasRepetidas = new List<Receta>();
        for (int i = 0; i < ingredientes.Count(); i++)
        {
            List<Receta> SubList = new List<Receta>();
            List<Receta> ListaResult = BD.LevantarRecetasPorIngrediente(ingredientes[i]);
            foreach (Receta rec in ListaResult)
            {
                SubList.Add(rec);
            }
            if(i == 0)
            {
                SubListOut = SubList;
                ListaRecetasRepetidas = SubList;
            }
            else
            {
                for (int j = 0; j < SubListOut.Count(); j++)
                {
                
                    bool esta = false;
                    foreach(Receta rece in SubList)
                    {
                    if(rece.ID == SubListOut[j].ID)
                    {
                        esta = true;
                    }
                    }
                    if(!esta)
                    {
                        ListaRecetasRepetidas.Remove(SubListOut[j]);
                    }
                }
            }
        }
        
        foreach(Receta rec in ListaRecetasRepetidas)
            {
                bool esta = false;
                foreach(Receta rece in ListaRecetas)
                {
                    if(rece.ID == rec.ID)
                    {
                        esta = true;
                    }
                }
                if(!esta)
                {
                    ListaRecetas.Add(rec);
                }

            }
        ViewBag.Listarecetas = ListaRecetas.Distinct();
        ViewBag.ListaNula = ListaRecetas.Count()==0;
        return View("Resultados");
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
        return RedirectToAction("DetalleReceta","Home", rec.ID);
    }
    public IActionResult Valoracion(int IDReceta, int Puntaje, int Dificultad, int Tiempo){
        Valoracion val = new Valoracion(0,IDReceta, Puntaje, Dificultad, Tiempo);
        BD.IngresarValoracion(val);
        return RedirectToAction("DetalleReceta","Home", IDReceta);
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
