using System;

public class Valoracion
{
    public int ID{get;set;}
    public int IDReceta{get;set;}
    public int Puntaje{get;set;}
    public int Dificultad{get;set;}
    public int Tiempo{get;set;}

    public Valoracion()
    {

    }

    public Valoracion(int id, int idreceta, int puntaje, int dificultad, int tiempo)
    {
        ID = id;
        IDReceta = idreceta;
        Puntaje = puntaje;
        Dificultad = dificultad;
        Tiempo = tiempo;
    }

    public Valoracion(int idreceta, int puntaje, int dificultad, int tiempo)
    {
        IDReceta = idreceta;
        Puntaje = puntaje;
        Dificultad = dificultad;
        Tiempo = tiempo;
    }
}