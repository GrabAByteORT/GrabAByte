using System;

public class Paso
{
    public int ID{get;set;}
    public int IDReceta{get;set;}
    public int NumPaso{get;set;}
    public string Text{get;set;}

    public Paso()
    {
        
    }

    public Paso(int id, int idReceta, int numPaso, string text)
    {
        ID = id;
        IDReceta = idReceta;
        NumPaso = numPaso;
        Text = text;
    } 
}