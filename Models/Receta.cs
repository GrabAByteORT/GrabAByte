using System;

public class Receta
{
    public int ID{get;set;}
    public string Nombre{get;set;}
    public DateTime FechaPublicacion{get;set;}
    public string Descripcion{get;set;}
    public string Pasos{get;set;}
    public string Tipo{get;set;}

    public Receta()
    {

    }

    public Receta(int id, string nombre, DateTime fechapublicacion, string descripcion, string pasos, string tipo)
    {
        ID = id;
        Nombre = nombre;
        FechaPublicacion = fechapublicacion;
        Descripcion = descripcion;
        Pasos = pasos;
    }
}