using System;

public class Ingrediente
{
    public int ID{get;set;}
    public string Nombre{get;set;}

    public Ingrediente()
    {
        
    }

    public Ingrediente(int id, string nombre)
    {
        ID = id;
        Nombre = nombre;
    } 
}