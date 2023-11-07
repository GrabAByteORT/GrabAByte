using System;

public class Valoracion
{
    public int ID{get;set;}
    public int IDReceta{get;set;}
<<<<<<< HEAD
    public float Puntaje{get;set;}
=======
    public int Puntaje{get;set;}
    public int Dificultad{get;set;}
    public DateTime Tiempo{get;set;}
>>>>>>> 3ab2d38b22366e16f653310840e58167da0ee93f

    public Valoracion()
    {

    }

<<<<<<< HEAD
    public Valoracion(int id, int idreceta, float puntaje)
=======
    public Valoracion(int id, int idreceta, int puntaje, int dificultad, DateTime tiempo)
>>>>>>> 3ab2d38b22366e16f653310840e58167da0ee93f
    {
        ID = id;
        IDReceta = idreceta;
        Puntaje = puntaje;
<<<<<<< HEAD
=======
        Dificultad = dificultad;
        Tiempo = tiempo;
>>>>>>> 3ab2d38b22366e16f653310840e58167da0ee93f
    }
}