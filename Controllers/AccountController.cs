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
        }
        else{
            ret = "InicioSesion";
        }
        return RedirectToAction("Home",ret);
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
