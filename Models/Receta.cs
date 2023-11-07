using System;

public class Receta
{
    public int ID{get;set;}
    public string Nombre{get;set;}
    public DateTime FechaPublicacion{get;set;}
    public string Descripcion{get;set;}
    public string Pasos{get;set;}
    public string Tipo{get;set;}
    public string Img{get;set;}
    public string Banner{get;set;}

    public Receta()
    {

    }

<<<<<<< HEAD
    public Receta(int id, string nombre, DateTime fechapublicacion, string descripcion, string pasos)
=======
    public Receta(int id, string nombre, DateTime fechapublicacion, string descripcion, string pasos, string tipo)
>>>>>>> 3ab2d38b22366e16f653310840e58167da0ee93f
    {
        ID = id;
        Nombre = nombre;
        FechaPublicacion = fechapublicacion;
        Descripcion = descripcion;
        Pasos = pasos;
    }
}