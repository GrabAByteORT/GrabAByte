using System.Data.SqlClient;
using Dapper;
using System.Data;

public static class BD
{
    public static string _connectionString = @"Server=localhost;
    DataBase=BDGrabAByte;Trusted_Connection=True";

    public static List<Receta> ListaRecetas {get;set;}
    public static List<Ingrediente> ListaIngredientes {get;set;}
    public static Usuario UsuarioIngresado{get;set;}

    public static void InicializarUsuario()
    {
        UsuarioIngresado = LevantarUsuario("default","default");
    }
    public static void InicializarUsuario(Usuario usuario)
    {
        UsuarioIngresado = usuario;
    }
    public static void LevantarIngredientes()
    {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "QueryAllIngredientes";
            ListaIngredientes = db.Query<Ingrediente>(sp, commandType: CommandType.StoredProcedure).ToList();
        }
    }

    public static void LevantarRecetas()
    {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "QueryAllRecetas";
            ListaRecetas = db.Query<Receta>(sp, commandType: CommandType.StoredProcedure).ToList();
        }
    }

    public static List<Ingrediente> LevantarIngredientesPorReceta(int idReceta)
    {
        List<Ingrediente> ListaIngredientesPorReceta = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "QueryIngredientesPorReceta";
            ListaIngredientesPorReceta = db.Query<Ingrediente>(sp, new {IDReceta = idReceta}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaIngredientesPorReceta;
    }

    public static List<Receta> LevantarRecetasPorIngrediente(string NombreIngrediente)
    {
        List<Receta> ListaRecetasPorIngrediente = new List<Receta>();
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "QueryRecetaPorIngrediente";
            ListaRecetasPorIngrediente = db.Query<Receta>(sp, new {NombreIngrediente = NombreIngrediente}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaRecetasPorIngrediente;
    }

    public static List<Receta> LevantarRecetasPorNombre(string nombre)
    {
        List<Receta> ListaRecetasPorNombre = new List<Receta>();
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "QueryRecetaPorNombre";
            ListaRecetasPorNombre = db.Query<Receta>(sp, new{Nombre = nombre}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaRecetasPorNombre;
    }

    public static Usuario LevantarUsuario(string nombre, string contrasenia)
    {
        Usuario Usuario;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "QueryUsuario";
            Usuario = db.QueryFirstOrDefault<Usuario>(sp, new {Nombre = nombre, Contrasenia = contrasenia}, commandType: CommandType.StoredProcedure);
        }
        return Usuario;
    }

    public static List<Receta> LevantarRecetasGuardadas(int idUsuario)
    {
        List<int> ListaRecetasSegunUsuario = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "QueryGuardados";
            ListaRecetasSegunUsuario = db.Query<int>(sp, new {IDUsuario = idUsuario}, commandType: CommandType.StoredProcedure).ToList();
        }
        List<Receta> ListaRecetasGuardadas = new List<Receta>();
        foreach(int ID in ListaRecetasSegunUsuario){
            bool encontrado = false;
            int i = 0;
            while(!encontrado){
                if(ListaRecetas[i].ID == ID){
                    ListaRecetasGuardadas.Add(ListaRecetas[i]);
                    encontrado = true;
                }
                i++;
            }
        }
        return ListaRecetasGuardadas;
    }

    public static void IngresarValoracion(Valoracion Val)
    {
        string sp = "IngresarValoracion";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sp, new {IDReceta = Val.IDReceta, Puntaje = Val.Puntaje, Dificultad = Val.Dificultad, Tiempo = Val.Tiempo}, commandType: CommandType.StoredProcedure);
        }
    }

    public static void CrearUsuario(Usuario Usu)
    {
        string sp = "CrearUsuario";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sp, new{Nombre = Usu.Nombre, Contrasenia = Usu.Contrasenia, Email = Usu.Email, Foto = Usu.Foto},  commandType: CommandType.StoredProcedure);
        }
    }

    public static void SubirReceta(Receta Rece, List<Ingrediente> Ingrediente, List<Paso> Pasos)
    {
        string sp = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            sp = "SubirReceta";
            db.Execute(sp, new{Nombre = Rece.Nombre, FechaPublicacion = Rece.FechaPublicacion, Descripcion = Rece.Descripcion, Tipo = Rece.Tipo, Img = Rece.Img, Banner = Rece.Banner});
            sp = "SubirIngrediente";
            for(int i = 0; i > Ingrediente.Count; i++)
            {
                db.Execute(sp, new{NombreIngrediente = Ingrediente[i].Nombre, IDReceta = Rece.ID});
            }
            sp = "IngresarPasosReceta";
            for(int i = 0; i > Pasos.Count; i++)
            {
                db.Execute(sp, new{IDReceta = Rece.ID, NumPaso = Pasos[i].NumPaso, Text = Pasos[i].Text});
            }
        }
    }

    public static List<Paso> LevantarPasosPorReceta(int IDReceta)
    {
        List<Paso> ListaPasosPorReceta = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "QueryPasosReceta";
            ListaPasosPorReceta = db.Query<Paso>(sp, new {IDReceta = IDReceta}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaPasosPorReceta;
    }
}