USE [master]
GO
/****** Object:  Database [BDGrabAByte]    Script Date: 9/11/2023 08:55:35 ******/
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
/****** Object:  User [alumno]    Script Date: 9/11/2023 08:55:35 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Ingrediente]    Script Date: 9/11/2023 08:55:35 ******/
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
/****** Object:  Table [dbo].[Receta]    Script Date: 9/11/2023 08:55:35 ******/
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
	[Img] [varchar](50) NOT NULL,
	[Banner] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Receta] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecetasGuardadas]    Script Date: 9/11/2023 08:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetasGuardadas](
	[IDReceta] [int] NOT NULL,
	[IDUsuario] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecetasIngredientes]    Script Date: 9/11/2023 08:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetasIngredientes](
	[IDReceta] [int] NOT NULL,
	[IDIngrediente] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 9/11/2023 08:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Contrasenia] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Foto] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Valoracion]    Script Date: 9/11/2023 08:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Valoracion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDReceta] [int] NOT NULL,
	[Puntaje] [int] NOT NULL,
	[Dificultad] [int] NOT NULL,
	[Tiempo] [time](0) NOT NULL,
 CONSTRAINT [PK_Valoracion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ingrediente] ON 

INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (1, N'Arroz')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (2, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (3, N'Agua')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (4, N'Papa')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (5, N'Manteca')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (6, N'Leche')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (7, N'Pimienta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (8, N'Tallarines')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (9, N'Aceite de Oliva')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (10, N'Chocolate')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (11, N'Huevo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (12, N'Azucar')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (13, N'Nuez Picada')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (14, N'Harina')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (15, N'Bife de Chorizo')
SET IDENTITY_INSERT [dbo].[Ingrediente] OFF
GO
SET IDENTITY_INSERT [dbo].[Receta] ON 

INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Pasos], [Tipo], [Img], [Banner]) VALUES (3, N'Arroz', CAST(N'2023-09-11T00:00:00.000' AS DateTime), N'Un simple plato de arroz', N'1. Abrir el paquete de arroz 2. Llenar una olla con agua 3. Herbir el agua 4. Poner el arroz en el agua y esperar de 15 a 20 minutos 6. Retirar y servir', N'Guarnición', N'arroz.png', N'bannerarroz.png')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Pasos], [Tipo], [Img], [Banner]) VALUES (4, N'Pure de papa', CAST(N'2023-09-11T00:00:00.000' AS DateTime), N'Pure de papa con manteca', N'1.Para comenzar a hacer el pure de papa debemos pelar las papas y lavar, para luego proceder a cortarlas en cubos de tamaño mediano, 2 o 3 centímetros esta bien 2. Colocamos las papas cortas en una cacerola con aguara hervida y sal 3. Las cocinamos por aproximadamente 20 minutos, nos vamos a dar cuenta cuando esten lista ya que al intentar pincharlas con un tenedor los cubos se van a desarmar 4. Colamos las papas y procedemos a agregarle la manteca y la leche, revolvemos para homogenizar la mezcla y salpimentamos a gusto ', N'Guarnicion', N'pure.png', N'bannerpure.png')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Pasos], [Tipo], [Img], [Banner]) VALUES (6, N'Tallarines', CAST(N'2023-09-11T00:00:00.000' AS DateTime), N'Unos simples fideos de paquete', N'1. El primer paso para hervir pasta será poner en el fuego una cazuela con abundante agua, te recomendamos que sea suficientemente grande porque la pasta al cocer siempre aumenta su tamaño. Asimismo, se recomienda añadir un litro de agua por cada 100 gramos de pasta 2. También será necesario que añadas al agua para hervir pasta un chorrito de aceite de oliva o un poco de mantequilla para evitar así que después la pasta se pegue entre ella. Y, de forma opcional, puedes agregar también una hoja de laurel para darle un toque de sabor 3. En el momento en que hierva el agua, deberás añadir una pizca de sal; es importante no echarla antes, ya que el agua salada tarda más en cocer. Asimismo, te recomendamos que mantengas el agua tapada para que arranque a hervir antes 4. Ahora ya ha llegado el momento de agregar la pasta que quieres hervir: espaguetis, macarrones, espirales, tallarines, etc. En el caso de las pastas largas, que parecen no caber en la cazuela, puedes optar por partirlas por la mitad una vez crudas, aunque no será necesario porque una vez mojadas en al agua hirviendo podrás empujarlas para que se doblen 5. Al añadir la pasta, el agua habrá parado de hervir pero deberás esperar a que vuelva a arrancar el hervor e ir removiendo la pasta para que no se pegue, usando siempre un utensilio de madera y no metálico. El tiempo de cocción de cada tipo de pasta es distinto, aunque la mayoría de ellas indican un tiempo recomendado de cocción en su envoltorio 6. En el caso de los espaguetis, un truco infalible para saber cuando la pasta está en su punto, al dente, es sacar un espagueti del agua y lanzarlo contra una pared de azulejos o baldosas, muy comunes en las cocinas. Si queda pegado, estará suficientemente hervido, mientras que si cae, tendremos que dejarlo más tiempo 7. Una vez que la pasta esté hervida -puedes probarla para comprobarlo y estar del todo seguro- deberás escurrirla en la fregadera con la ayuda de un escurridor o colador. Algunos optan por pasarla bajo el grifo de agua fría, aunque así pierde el almidón característico de la pasta, por lo que solo es recomendable para preparar platos fríos como la ensalada de pasta, pero no para mezclarla con salsas', N'Plato Principal/Guarnición', N'fideos.png', N'bannerfideos.png')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Pasos], [Tipo], [Img], [Banner]) VALUES (7, N'Brownie', CAST(N'2023-09-11T00:00:00.000' AS DateTime), N'Brownies de chocolate', N'1. Para comenzar con nuestra receta de brownies de chocolate, vamos a colocar la manteca y el chocolate picados en una sartén, y llevarlos a fuego bien bajo. Lo tapamos y vamos a dejarlo por unos 5 minutos sin tocar. Confíen! 2. Ahora retirar del fuego y revolver los ingredientes hasta que esté todo derretido e integrado 3. A parte vamos a batir los 2 huevos con el azúcar hasta que queden bien blancos, esto es clave para que el brownie casero quede bien húmedo 4. Agregar el chocolate derretido y batir hasta que esté integrado. Sumar las nueces en pedazos grandes o como más les guste 2. Sumar el harina 0000 tamizada en dos partes e integrar todo como se ve en el video. Es importante batir fuerte antes de pasar el brownie de chocolate al molde 6. Colocar en una placa y cocinar al horno fuerte (200-220°) por 20 minutos', N'Postre', N'brownie.png', N'bannerbrownie.png')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Pasos], [Tipo], [Img], [Banner]) VALUES (9, N'Bife de Chorizo', CAST(N'2023-09-11T00:00:00.000' AS DateTime), N'Un Bife de Chorizo a la plancha', N'1. Poner la plancha a calentar, (no se puede usar la sartén y la plancha debe ser la acanalada) 2. Cuando la plancha este bien caliente pasar un pedacito de grasa para engrasar y poner el bife de chorizo 3. No mover el bife durante la cocción y tiene que estar atravesanso las canaletas de la plancha, así queda con las marcas tan bonitas cuando lo servís 4. No lo des vuelta hasta que veas que en la parte de arriba hay unas gotitas de sangre, entonces lo das vuelta y lo pones transversal a las canaletas de la plancha 5. Salar del lado que esta cocido y dejar hasta el punto deseado, es un corte que si se cocina mucho se seca, así mi consejo sacarlo a punto, jugoso pero rosadito', N'Plato Principal', N'bife.png', N'bannerbife.png')
SET IDENTITY_INSERT [dbo].[Receta] OFF
GO
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (3, 1)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (3, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (3, 3)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (4, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (4, 4)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (4, 5)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (4, 6)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (4, 7)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (6, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (6, 3)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (6, 5)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (6, 8)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (6, 9)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (7, 5)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (7, 10)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (7, 11)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (7, 12)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (7, 13)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (7, 14)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (9, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (9, 15)
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([ID], [Nombre], [Contrasenia], [Email], [Foto]) VALUES (1, N'default', N'default', N'default@default', N'default.png')
INSERT [dbo].[Usuario] ([ID], [Nombre], [Contrasenia], [Email], [Foto]) VALUES (2, N'Joaco', N'Joaco123', N'joaco@gmail.com', N'joaco.png')
INSERT [dbo].[Usuario] ([ID], [Nombre], [Contrasenia], [Email], [Foto]) VALUES (3, N'Agos', N'Agos123', N'agos@gmail.com', N'agos.png')
INSERT [dbo].[Usuario] ([ID], [Nombre], [Contrasenia], [Email], [Foto]) VALUES (4, N'Maxi', N'Maxi123', N'maxi@gmail.com', N'maxi.png')
INSERT [dbo].[Usuario] ([ID], [Nombre], [Contrasenia], [Email], [Foto]) VALUES (5, N'Juli', N'Juli123', N'juli@gmail.com', N'juli.png')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
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
/****** Object:  StoredProcedure [dbo].[CrearUsuario]    Script Date: 9/11/2023 08:55:35 ******/
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
/****** Object:  StoredProcedure [dbo].[QueryAllIngredientes]    Script Date: 9/11/2023 08:55:35 ******/
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
/****** Object:  StoredProcedure [dbo].[QueryAllRecetas]    Script Date: 9/11/2023 08:55:35 ******/
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
/****** Object:  StoredProcedure [dbo].[QueryGuardados]    Script Date: 9/11/2023 08:55:35 ******/
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
/****** Object:  StoredProcedure [dbo].[QueryIngredientesPorReceta]    Script Date: 9/11/2023 08:55:35 ******/
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
/****** Object:  StoredProcedure [dbo].[QueryRecetaPorIngrediente]    Script Date: 9/11/2023 08:55:35 ******/
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
/****** Object:  StoredProcedure [dbo].[QueryRecetaPorNombre]    Script Date: 9/11/2023 08:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[QueryRecetaPorNombre]
	-- Add the parameters for the stored procedure here
	@Nombre varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * From Receta Where Nombre LIKE '@Nombre%' OR Nombre LIKE '%@Nombre' OR Nombre LIKE '%@Nombre%'
END
GO
/****** Object:  StoredProcedure [dbo].[QueryUsuario]    Script Date: 9/11/2023 08:55:35 ******/
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
/****** Object:  StoredProcedure [dbo].[SubirReceta]    Script Date: 9/11/2023 08:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SubirReceta]
@Nombre varchar(50), @FechaPublicacion datetime, @Descripcion text, @Pasos text, @Tipo varchar(50), @Img varchar(50), @Banner varchar(50)
AS
BEGIN
	INSERT INTO Receta (Nombre,FechaPublicacion,Descripcion,Pasos,Tipo,Img,Banner)
	VALUES (@Nombre, @FechaPublicacion, @Descripcion, @Pasos, @Tipo,@Img,@Banner)
END
GO
USE [master]
GO
ALTER DATABASE [BDGrabAByte] SET  READ_WRITE 
GO

CREATE PROCEDURE [dbo].[SubirIngrediente]
@NombreIngrediente varchar(50), @IDReceta int
AS
BEGIN
	IF((SELECT Nombre FROM Ingrediente WHERE Nombre = @NombreIngrediente) IS NULL)
	BEGIN
	INSERT INTO Ingrediente(Nombre)
	VALUES(@NombreIngrediente)
	END
	INSERT INTO RecetasIngredientes(IDReceta, IDIngrediente)
	VALUES(@IDReceta, (SELECT ID FROM Ingrediente WHERE Nombre = @NombreIngrediente))
END
GO
USE [master]
GO
ALTER DATABASE [BDGrabAByte] SET  READ_WRITE 
GO