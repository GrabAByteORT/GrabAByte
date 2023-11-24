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
        bool alert = true;
        if(user != null){
            ret = "Home";
            BD.InicializarUsuario(user);
        }
        else{
            BD.InicializarUsuario();
            ret = "IniciarSesion";
            if(nombre == "default"){alert = false;}
        }
        return RedirectToAction(ret,"Home", alert);
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
            return RedirectToAction("Home","Home");
        }
    }

    public IActionResult Perfil()
    {
        string ret = null;
        if(BD.UsuarioIngresado.Nombre != "default"){
            ret = "Perfil";
        }
        else{
            ret = "IniciarSesion";
        }
        return RedirectToAction(ret,"Home");
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
