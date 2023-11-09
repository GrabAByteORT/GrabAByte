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
            BD.InicializarUsuario(user);
            ret = "Home";
        }
        else{
            ret = "InicioSesion";
            BD.InicializarUsuario();
        }
        return RedirectToAction("Home",ret);
    }
    public IActionResult Registro(string nombre,string contrasenia, string email, string foto)
    {
        Usuario Usu = new Usuario(nombre, contrasenia, email, foto);
        if(Usu == BD.LevantarUsuario(nombre, contrasenia))
        {
            return RedirectToAction("Account","Ingreso", new {nombre = nombre, contrasenia = contrasenia});
        }
        else
        {
            BD.CrearUsuario(Usu);
            return RedirectToAction("Home","Home");
        }
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
