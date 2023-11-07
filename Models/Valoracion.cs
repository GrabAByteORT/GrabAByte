using System;

public class Valoracion
{
    public int ID{get;set;}
    public int IDReceta{get;set;}
    public float Puntaje{get;set;}

    public Valoracion()
    {

    }

    public Valoracion(int id, int idreceta, float puntaje)
    {
        ID = id;
        IDReceta = idreceta;
        Puntaje = puntaje;
    }
}