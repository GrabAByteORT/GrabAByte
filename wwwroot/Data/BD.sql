USE [master]
GO
/****** Object:  Database [BDGrabAByte]    Script Date: 31/10/2023 11:56:56 ******/
CREATE DATABASE [BDGrabAByte]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDGrabAByte', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BDGrabAByte.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDGrabAByte_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BDGrabAByte_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BDGrabAByte] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDGrabAByte].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDGrabAByte] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDGrabAByte] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDGrabAByte] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDGrabAByte] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDGrabAByte] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDGrabAByte] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDGrabAByte] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDGrabAByte] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDGrabAByte] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDGrabAByte] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDGrabAByte] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDGrabAByte] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDGrabAByte] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDGrabAByte] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDGrabAByte] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDGrabAByte] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDGrabAByte] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDGrabAByte] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDGrabAByte] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDGrabAByte] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDGrabAByte] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDGrabAByte] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDGrabAByte] SET RECOVERY FULL 
GO
ALTER DATABASE [BDGrabAByte] SET  MULTI_USER 
GO
ALTER DATABASE [BDGrabAByte] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDGrabAByte] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDGrabAByte] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDGrabAByte] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDGrabAByte] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BDGrabAByte', N'ON'
GO
ALTER DATABASE [BDGrabAByte] SET QUERY_STORE = OFF
GO
USE [BDGrabAByte]
GO
/****** Object:  User [alumno]    Script Date: 31/10/2023 11:56:56 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Ingrediente]    Script Date: 31/10/2023 11:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingrediente](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ingrediente] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 31/10/2023 11:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaPublicacion] [datetime] NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Pasos] [text] NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Receta] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecetasGuardadas]    Script Date: 31/10/2023 11:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetasGuardadas](
	[IDReceta] [int] NOT NULL,
	[IDUsuario] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecetasIngredientes]    Script Date: 31/10/2023 11:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetasIngredientes](
	[IDReceta] [int] NOT NULL,
	[IDIngrediente] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 31/10/2023 11:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Contrasenia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Valoracion]    Script Date: 31/10/2023 11:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Valoracion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDReceta] [int] NOT NULL,
	[Valoracion] [int] NOT NULL,
	[Dificultad] [int] NOT NULL,
	[Tiempo] [datetime] NOT NULL,
 CONSTRAINT [PK_Valoracion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RecetasGuardadas]  WITH CHECK ADD  CONSTRAINT [FK_RecetasGuardadas_Receta] FOREIGN KEY([IDReceta])
REFERENCES [dbo].[Receta] ([ID])
GO
ALTER TABLE [dbo].[RecetasGuardadas] CHECK CONSTRAINT [FK_RecetasGuardadas_Receta]
GO
ALTER TABLE [dbo].[RecetasGuardadas]  WITH CHECK ADD  CONSTRAINT [FK_RecetasGuardadas_Usuario] FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[Usuario] ([ID])
GO
ALTER TABLE [dbo].[RecetasGuardadas] CHECK CONSTRAINT [FK_RecetasGuardadas_Usuario]
GO
ALTER TABLE [dbo].[RecetasIngredientes]  WITH CHECK ADD  CONSTRAINT [FK_RecetasIngredientes_Ingrediente] FOREIGN KEY([IDIngrediente])
REFERENCES [dbo].[Ingrediente] ([ID])
GO
ALTER TABLE [dbo].[RecetasIngredientes] CHECK CONSTRAINT [FK_RecetasIngredientes_Ingrediente]
GO
ALTER TABLE [dbo].[RecetasIngredientes]  WITH CHECK ADD  CONSTRAINT [FK_RecetasIngredientes_Receta] FOREIGN KEY([IDReceta])
REFERENCES [dbo].[Receta] ([ID])
GO
ALTER TABLE [dbo].[RecetasIngredientes] CHECK CONSTRAINT [FK_RecetasIngredientes_Receta]
GO
ALTER TABLE [dbo].[Valoracion]  WITH CHECK ADD  CONSTRAINT [FK_Valoracion_Receta] FOREIGN KEY([IDReceta])
REFERENCES [dbo].[Receta] ([ID])
GO
ALTER TABLE [dbo].[Valoracion] CHECK CONSTRAINT [FK_Valoracion_Receta]
GO
/****** Object:  StoredProcedure [dbo].[CrearUsuario]    Script Date: 31/10/2023 11:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrearUsuario]
@Nombre varchar(50), @Contrasenia varchar(50)
AS
BEGIN
	INSERT INTO Usuario (Nombre,Contrasenia)
	VALUES (@Nombre, @Contrasenia)
END
GO
/****** Object:  StoredProcedure [dbo].[IngresarValoracion]    Script Date: 31/10/2023 11:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IngresarValoracion]
	@IDReceta int,
	@Valoracion float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Valoracion (IDReceta, Valoracion) Values (@IDReceta, @Valoracion)
END
GO
/****** Object:  StoredProcedure [dbo].[QueryAllIngredientes]    Script Date: 31/10/2023 11:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[QueryAllIngredientes]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Ingrediente
END
GO
/****** Object:  StoredProcedure [dbo].[QueryAllRecetas]    Script Date: 31/10/2023 11:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[QueryAllRecetas]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Receta
END
GO
/****** Object:  StoredProcedure [dbo].[QueryGuardados]    Script Date: 31/10/2023 11:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[QueryGuardados]
	-- Add the parameters for the stored procedure here
	@IDUsuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From RecetasGuardadas Where IDUsuario = @IDUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[QueryIngredientesPorReceta]    Script Date: 31/10/2023 11:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[QueryIngredientesPorReceta]
	-- Add the parameters for the stored procedure here
	@IDReceta int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT IDIngrediente From RecetasIngredientes Where IDReceta = @IDReceta
END
GO
/****** Object:  StoredProcedure [dbo].[QueryRecetaPorIngrediente]    Script Date: 31/10/2023 11:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[QueryRecetaPorIngrediente]
	-- Add the parameters for the stored procedure here
	@IDIngrediente int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT IDReceta From RecetasIngredientes Where IDIngrediente = @IDIngrediente
END
GO
/****** Object:  StoredProcedure [dbo].[QueryUsuario]    Script Date: 31/10/2023 11:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[QueryUsuario]
	-- Add the parameters for the stored procedure here
	@Nombre varchar(50),
	@Contrasenia varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * From Usuario Where Nombre = @Nombre AND Contrasenia = @Contrasenia
END
GO
/****** Object:  StoredProcedure [dbo].[SubirReceta]    Script Date: 31/10/2023 11:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SubirReceta]
@Nombre varchar(50), @FechaPublicacion datetime, @Descripcion text, @Pasos text, @Tipo varchar(50)
AS
BEGIN
	INSERT INTO Receta (Nombre,FechaPublicacion,Descripcion,Pasos,Tipo)
	VALUES (@Nombre, @FechaPublicacion, @Descripcion, @Pasos, @Tipo)
END
GO
USE [master]
GO
ALTER DATABASE [BDGrabAByte] SET  READ_WRITE 
GO
