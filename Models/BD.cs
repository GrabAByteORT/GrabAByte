using System.Data.SqlClient;
using Dapper;
using System.Data;

public static class BD
{
    public static string _connectionString = @"Server=localhost;
    DataBase=BDGrabAByte;Trusted_Connection=True";


    public static List<Ingrediente> LevantarIngredientes()
    {
        List<Ingrediente> ListaIngredientes = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "QueryAllIngredientes";
            ListaIngredientes = db.Query<Ingrediente>(sp, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaIngredientes;
    }

    public static List<Receta> LevantarRecetas()
    {
        List<Receta> ListaRecetas = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "QueryAllRecetas";
            ListaRecetas = db.Query<Ingrediente>(sp, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaRecetas;
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
        using(SqlConnection = new SqlConnection(_connectionString))
        {
            string sp = "QueryRecetaPorIngrediente";
            ListaRecetasPorIngrediente = db.Query<Receta>(sp, new {IDIngrediente = idIngrediente}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaRecetasPorIngrediente;
    }

    public static Usuario LevantarUsuario(string nombre, string contrasenia)
    {
        Usuario UsuarioLevantado = null;
        using(SqlConnection = new SqlConnection(_connectionString))
        {
            string sp = "QueryUsuario";
            UsuarioLevantado = db.Query<Usuario>(sp, new {Nombre = nombre, Contrasenia = contrasenia}, commandType: CommandType.StoredProcedure);
        }
        return UsuarioLevantado;
    }

    public static List<Receta> RecetasGuardadas(int idUsuario)
    {
        List<Receta> ListaRecetasSegunUsuario = null;
        using(SqlConnection = new SqlConnection(_connectionString))
        {
            string sp = "QueryGuardados";
            ListaRecetasSegunUsuario = db.Query<Receta>(sp, new {IDUsuario = idUsuario}, commandType: CommandType.StoredProcedure).ToList();
        }
        return ListaRecetasSegunUsuario;
    }
}