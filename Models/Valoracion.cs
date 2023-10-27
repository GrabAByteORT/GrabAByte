using System;

public class Valoracion
{
    public int ID{get;set;}
    public int IDReceta{get;set;}
    public float Valoracion{get;set;}

    public Valoracion()
    {

    }

    public Valoracion(int id, int idreceta, float valoracion)
    {
        ID = id;
        IDReceta = idreceta;
        Valoracion = valoracion;
    }
}