using System; 

public class Usuario
{
    public int ID{get;set;}
    public string Nombre{get;set;}
    public string Contrasenia{get;set;}
    public string Email{get;set;}
    public string Foto{get;set;}

    public Usuario()
    {

    }

    public Usuario(int id, string nombre, string contra, string email, string foto)
    {
        ID = id;
        Nombre = nombre;
        Contrasenia = contra; 
        Email = email;
        Foto = foto;
    }
    public Usuario(string nombre, string contra, string email, string foto)
    {
        Nombre = nombre;
        Contrasenia = contra; 
        Email = email;
        Foto = foto;
    }
}