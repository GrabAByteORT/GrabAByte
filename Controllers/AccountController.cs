using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using GrabAByte.Models;

namespace GrabAByte.Controllers;

public class AccountController : Controller
{
    private readonly ILogger<AccountController> _logger;

    public IActionResult Ingreso(string nombre, string contraseña)
    {
        Usuario user = BD.LevantarUsuario(nombre,contraseña);
        string ret;
        if(user != null){
            ret = "Home";
            BD.InicializarUsuario(user);
        }
        else{
            BD.InicializarUsuario();
            ret = "IniciarSesion";
        }
        return RedirectToAction(ret,"Home", true);
    }
    public IActionResult Registro(string nombre,string contrasenia, string email, string foto)
    {
        Usuario Usu = new Usuario(nombre, contrasenia, email, foto);
        if(Usu == BD.LevantarUsuario(nombre, contrasenia))
        {
            return RedirectToAction("Ingreso","Account", new {nombre = nombre, contrasenia = contrasenia});
        }
        else
        {
            BD.CrearUsuario(Usu);
            BD.InicializarUsuario(Usu);
            return RedirectToAction("Home","Home");
        }
    }

    public IActionResult Perfil()
    {
        string ret = null;
        bool alert = false;
        if(BD.UsuarioIngresado.Nombre != "default"){
            ret = "Perfil";
        }
        else{
            ret = "IniciarSesion";
        }
        return RedirectToAction(ret,"Home",alert);
    }
    public IActionResult GuardarReceta(int IDReceta, int IDUsuario){
        List<Receta> Guardadas = BD.LevantarRecetasGuardadas(IDUsuario);
        bool esta = false;
        foreach(Receta rec in Guardadas)
        {
            if(rec.ID == IDReceta){esta = true;}
        }
        if(!esta)
        {
            BD.GuardarReceta(IDUsuario, IDReceta);
        }
        return RedirectToAction("DetalleRecetaAlerta", "Home", new {IDReceta = IDReceta});
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
