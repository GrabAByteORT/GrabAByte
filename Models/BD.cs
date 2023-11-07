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

    public static List<Receta> LevantarRecetasPorIngrediente(int idIngrediente)
    {
        List<Receta> ListaRecetasPorIngrediente = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "QueryRecetaPorIngrediente";
            ListaRecetasPorIngrediente = db.Query<Receta>(sp, new {IDIngrediente = idIngrediente}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaRecetasPorIngrediente;
    }

    public static Usuario LevantarUsuario(string nombre, string contrasenia)
    {
        Usuario UsuarioLevantado = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "QueryUsuario";
            UsuarioLevantado = db.QueryFirstOrDefault<Usuario>(sp, new {Nombre = nombre, Contrasenia = contrasenia}, commandType: CommandType.StoredProcedure);
        }
        return UsuarioLevantado;
    }

    public static List<Receta> LevantarRecetasGuardadas(int idUsuario)
    {
        List<Receta> ListaRecetasSegunUsuario = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "QueryGuardados";
            ListaRecetasSegunUsuario = db.Query<Receta>(sp, new {IDUsuario = idUsuario}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaRecetasSegunUsuario;
    }

    public static void IngresarValoracion(Valoracion Val)
    {
        string sp = "IngresarValoracion";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sp, new {IDReceta = Val.ID, Valoracion = Val.Puntaje}, commandType: CommandType.StoredProcedure);
        }
    }

    public static void CrearUsuario(Usuario Usu)
    {
        string sp = "CrearUsuario";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sp, new{Nombre = Usu.Nombre, Contrasenia = Usu.Contrasenia},  commandType: CommandType.StoredProcedure);
        }
    }

    public static void SubirReceta(Receta Rece)
    {
        string sp = "SubirReceta";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sp, new{Nombre = Rece.Nombre, FechaPublicacion = Rece.FechaPublicacion, Descripcion = Rece.Descripcion, Pasos = Rece.Pasos, Tipo = Rece.Tipo});
        }
    }
}