using System; 

public class Usuario
{
    public int ID{get;set;}
    public string Nombre{get;set;}
    public string Contrasenia{get;set;}

    public Usuario()
    {

    }

    public Usuario(int id, string nombre, string contra)
    {
        ID = id;
        Nombre = nombre;
        Contrasenia = contra;   
    }
}