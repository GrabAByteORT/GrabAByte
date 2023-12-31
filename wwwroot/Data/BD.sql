USE [master]
GO
/****** Object:  Database [BDGrabAByte]    Script Date: 29/11/2023 22:39:14 ******/
CREATE DATABASE [BDGrabAByte]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDGrabAByte', FILENAME = N'D:\SQLServer2017\Feature\MSSQL14.MSSQLSERVER\MSSQL\DATA\BDGrabAByte.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDGrabAByte_log', FILENAME = N'D:\SQLServer2017\Feature\MSSQL14.MSSQLSERVER\MSSQL\DATA\BDGrabAByte_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [BDGrabAByte] SET QUERY_STORE = OFF
GO
USE [BDGrabAByte]
GO
/****** Object:  Table [dbo].[Ingrediente]    Script Date: 29/11/2023 22:39:14 ******/
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
/****** Object:  Table [dbo].[Paso]    Script Date: 29/11/2023 22:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paso](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDReceta] [int] NOT NULL,
	[NumPaso] [int] NOT NULL,
	[Text] [text] NOT NULL,
 CONSTRAINT [PK_Paso] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 29/11/2023 22:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaPublicacion] [datetime] NOT NULL,
	[Descripcion] [text] NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Img] [varchar](300) NOT NULL,
	[Banner] [varchar](300) NOT NULL,
 CONSTRAINT [PK_Receta] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecetasCreadas]    Script Date: 29/11/2023 22:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetasCreadas](
	[IDUsuario] [int] NOT NULL,
	[IDReceta] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecetasGuardadas]    Script Date: 29/11/2023 22:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetasGuardadas](
	[IDReceta] [int] NOT NULL,
	[IDUsuario] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecetasIngredientes]    Script Date: 29/11/2023 22:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetasIngredientes](
	[IDReceta] [int] NOT NULL,
	[IDIngrediente] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 29/11/2023 22:39:14 ******/
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
/****** Object:  Table [dbo].[Valoracion]    Script Date: 29/11/2023 22:39:14 ******/
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
SET IDENTITY_INSERT [dbo].[Paso] ON 

INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (1, 3, 1, N'Abrir el paquete de arroz')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (2, 3, 2, N'Llenar una olla con agua')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (3, 3, 3, N'Herbir el agua')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (4, 3, 4, N'Poner el arroz en el agua y esperar de 15 a 20 minutos')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (5, 3, 5, N'Retirar y servir')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (6, 4, 1, N'Para comenzar a hacer el pure de papa debemos pelar las papas y lavar, para luego proceder a cortarlas en cubos de tamaño mediano, 2 o 3 centímetros esta bien')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (7, 4, 2, N'Colocamos las papas cortas en una cacerola con aguara hervida y sal')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (8, 4, 3, N'Las cocinamos por aproximadamente 20 minutos, nos vamos a dar cuenta cuando esten lista ya que al intentar pincharlas con un tenedor los cubos se van a desarmar')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (9, 4, 4, N'Colamos las papas y procedemos a agregarle la manteca y la leche, revolvemos para homogenizar la mezcla y salpimentamos a gusto ')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (10, 6, 1, N'El primer paso para hervir pasta será poner en el fuego una cazuela con abundante agua, te recomendamos que sea suficientemente grande porque la pasta al cocer siempre aumenta su tamaño. Asimismo, se recomienda añadir un litro de agua por cada 100 gramos de pasta')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (11, 6, 2, N'También será necesario que añadas al agua para hervir pasta un chorrito de aceite de oliva o un poco de mantequilla para evitar así que después la pasta se pegue entre ella. Y, de forma opcional, puedes agregar también una hoja de laurel para darle un toque de sabor')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (13, 6, 3, N'En el momento en que hierva el agua, deberás añadir una pizca de sal; es importante no echarla antes, ya que el agua salada tarda más en cocer. Asimismo, te recomendamos que mantengas el agua tapada para que arranque a hervir antes')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (14, 6, 4, N'Ahora ya ha llegado el momento de agregar la pasta que quieres hervir: espaguetis, macarrones, espirales, tallarines, etc. En el caso de las pastas largas, que parecen no caber en la cazuela, puedes optar por partirlas por la mitad una vez crudas, aunque no será necesario porque una vez mojadas en al agua hirviendo podrás empujarlas para que se doblen')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (15, 6, 5, N'Al añadir la pasta, el agua habrá parado de hervir pero deberás esperar a que vuelva a arrancar el hervor e ir removiendo la pasta para que no se pegue, usando siempre un utensilio de madera y no metálico. El tiempo de cocción de cada tipo de pasta es distinto, aunque la mayoría de ellas indican un tiempo recomendado de cocción en su envoltorio')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (16, 6, 6, N'En el caso de los espaguetis, un truco infalible para saber cuando la pasta está en su punto, al dente, es sacar un espagueti del agua y lanzarlo contra una pared de azulejos o baldosas, muy comunes en las cocinas. Si queda pegado, estará suficientemente hervido, mientras que si cae, tendremos que dejarlo más tiempo')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (17, 6, 7, N'Una vez que la pasta esté hervida -puedes probarla para comprobarlo y estar del todo seguro- deberás escurrirla en la fregadera con la ayuda de un escurridor o colador. Algunos optan por pasarla bajo el grifo de agua fría, aunque así pierde el almidón característico de la pasta, por lo que solo es recomendable para preparar platos fríos como la ensalada de pasta, pero no para mezclarla con salsas')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (18, 7, 1, N'Para comenzar con nuestra receta de brownies de chocolate, vamos a colocar la manteca y el chocolate picados en una sartén, y llevarlos a fuego bien bajo. Lo tapamos y vamos a dejarlo por unos 5 minutos sin tocar. Confíen!')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (19, 7, 2, N'Ahora retirar del fuego y revolver los ingredientes hasta que esté todo derretido e integrado')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (20, 7, 3, N' A parte vamos a batir los 2 huevos con el azúcar hasta que queden bien blancos, esto es clave para que el brownie casero quede bien húmedo')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (21, 7, 4, N'Agregar el chocolate derretido y batir hasta que esté integrado. Sumar las nueces en pedazos grandes o como más les guste')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (22, 7, 5, N'Sumar el harina 0000 tamizada en dos partes e integrar todo como se ve en el video. Es importante batir fuerte antes de pasar el brownie de chocolate al molde')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (23, 7, 6, N'Colocar en una placa y cocinar al horno fuerte (200-220°) por 20 minutos')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (24, 9, 1, N'Poner la plancha a calentar, (no se puede usar la sartén y la plancha debe ser la acanalada)')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (25, 9, 2, N'Cuando la plancha este bien caliente pasar un pedacito de grasa para engrasar y poner el bife de chorizo')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (26, 9, 3, N'No mover el bife durante la cocción y tiene que estar atravesanso las canaletas de la plancha, así queda con las marcas tan bonitas cuando lo servís')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (27, 9, 4, N'No lo des vuelta hasta que veas que en la parte de arriba hay unas gotitas de sangre, entonces lo das vuelta y lo pones transversal a las canaletas de la plancha')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (28, 9, 5, N'Salar del lado que esta cocido y dejar hasta el punto deseado, es un corte que si se cocina mucho se seca, así mi consejo sacarlo a punto, jugoso pero rosadito')
SET IDENTITY_INSERT [dbo].[Paso] OFF
SET IDENTITY_INSERT [dbo].[Receta] ON 

INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (3, N'Arroz', CAST(N'2023-09-11T00:00:00.000' AS DateTime), N'Un simple plato de arroz', N'Guarnición', N'https://images.aws.nestle.recipes/original/cc1ed7245ed521b41e14c8c7ca0fa9f8_foto_arroz.jpg', N'https://www.recetasnestle.com.co/sites/default/files/2021-11/Recetas_Banner_Granos-de-arroz-blanco-y-cuchara-de-palo_1200x384.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (4, N'Pure de papa', CAST(N'2023-09-11T00:00:00.000' AS DateTime), N'Pure de papa con manteca', N'Guarnicion', N'https://images.aws.nestle.recipes/original/422441e37cf5c5d87eb8f86007af488c_GettyImages-1161443547.jpg', N'https://www.allrecipes.com/thmb/pKqN_412bNQGb7GmM8VAuCR5nHQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/1664470850489282388_Mashed-Potatoes-with-Cream-banner-2000-f67fcc47bf714ee29da13fa4e61efcac.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (6, N'Tallarines', CAST(N'2023-09-11T00:00:00.000' AS DateTime), N'Unos simples fideos de paquete', N'Plato Principal/Guarnición', N'https://imagenes.20minutos.es/files/image_1920_1080/uploads/imagenes/2021/09/13/fideos.jpeg', N'https://t4.ftcdn.net/jpg/01/66/13/13/360_F_166131355_hZvpRH9rYgWIDd8ObTBu5eECwusBFPcn.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (7, N'Brownie', CAST(N'2023-09-11T00:00:00.000' AS DateTime), N'Brownies de chocolate', N'Postre', N'https://img.taste.com.au/cy4EAfYe/w1200-h630-cfill/taste/2016/11/classic-chewy-brownie-102727-1.jpeg', N'https://d2v9ipibika81v.cloudfront.net/uploads/sites/38/2017/07/brownies-fb-banner.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (9, N'Bife de Chorizo', CAST(N'2023-09-11T00:00:00.000' AS DateTime), N'Un Bife de Chorizo a la plancha', N'Plato Principal', N'https://saborargento.com.ar/wp-content/uploads/2023/08/Receta-de-Bife-de-Chorizo.jpg', N'https://fastly.4sqi.net/img/general/1398x536/12996904_eQnzDicj_U_HRxt6T5KvpG3v-BGjx6ehjkTTjb5iaOY.jpg')
SET IDENTITY_INSERT [dbo].[Receta] OFF
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (3, 5)
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (7, 5)
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (6, 5)
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (3, 2)
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (7, 2)
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
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([ID], [Nombre], [Contrasenia], [Email], [Foto]) VALUES (1, N'default', N'default', N'default@default', N'default.png')
INSERT [dbo].[Usuario] ([ID], [Nombre], [Contrasenia], [Email], [Foto]) VALUES (2, N'Joaco', N'Joaco123', N'joaco@gmail.com', N'https://yt3.ggpht.com/a/AGF-l79l2HLA10EmUMtOqyzCFtLFQFurF6qX0HaZ9A=s900-c-k-c0xffffffff-no-rj-mo')
INSERT [dbo].[Usuario] ([ID], [Nombre], [Contrasenia], [Email], [Foto]) VALUES (3, N'Agos', N'Agos123', N'agos@gmail.com', N'agos.png')
INSERT [dbo].[Usuario] ([ID], [Nombre], [Contrasenia], [Email], [Foto]) VALUES (4, N'Maxi', N'Maxi123', N'maxi@gmail.com', N'maxi.png')
INSERT [dbo].[Usuario] ([ID], [Nombre], [Contrasenia], [Email], [Foto]) VALUES (5, N'Juli', N'Juli123', N'juli@gmail.com', N'juli.png')
INSERT [dbo].[Usuario] ([ID], [Nombre], [Contrasenia], [Email], [Foto]) VALUES (6, N'a', N'b', N'c@c', N'https://www.65ymas.com/uploads/s1/76/67/78/foto_1_621x621.jpeg')
INSERT [dbo].[Usuario] ([ID], [Nombre], [Contrasenia], [Email], [Foto]) VALUES (7, N'LeoK', N'12345', N'leo@kristal.com', N'leo.JPG')
INSERT [dbo].[Usuario] ([ID], [Nombre], [Contrasenia], [Email], [Foto]) VALUES (9, N'a', N'a', N'a@a.com', N'ab.jpeg')
INSERT [dbo].[Usuario] ([ID], [Nombre], [Contrasenia], [Email], [Foto]) VALUES (10, N'A', N'B', N'A@A', N'11.png')
INSERT [dbo].[Usuario] ([ID], [Nombre], [Contrasenia], [Email], [Foto]) VALUES (1010, N'Caca', N'a', N'a@a', N'https://external-content.duckduckgo.com/iu/?u=http')
INSERT [dbo].[Usuario] ([ID], [Nombre], [Contrasenia], [Email], [Foto]) VALUES (1011, N'Caca', N'b', N'c@c', N'https://external-content.duckduckgo.com/iu/?u=http')
INSERT [dbo].[Usuario] ([ID], [Nombre], [Contrasenia], [Email], [Foto]) VALUES (1012, N'A', N'B', N'C@C', N'https://external-content.duckduckgo.com/iu/?u=http')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Paso]  WITH CHECK ADD  CONSTRAINT [FK_Paso_Receta] FOREIGN KEY([IDReceta])
REFERENCES [dbo].[Receta] ([ID])
GO
ALTER TABLE [dbo].[Paso] CHECK CONSTRAINT [FK_Paso_Receta]
GO
ALTER TABLE [dbo].[RecetasCreadas]  WITH CHECK ADD  CONSTRAINT [FK_RecetasCreadas_Receta] FOREIGN KEY([IDReceta])
REFERENCES [dbo].[Receta] ([ID])
GO
ALTER TABLE [dbo].[RecetasCreadas] CHECK CONSTRAINT [FK_RecetasCreadas_Receta]
GO
ALTER TABLE [dbo].[RecetasCreadas]  WITH CHECK ADD  CONSTRAINT [FK_RecetasCreadas_Usuario] FOREIGN KEY([IDUsuario])
REFERENCES [dbo].[Usuario] ([ID])
GO
ALTER TABLE [dbo].[RecetasCreadas] CHECK CONSTRAINT [FK_RecetasCreadas_Usuario]
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
/****** Object:  StoredProcedure [dbo].[CrearUsuario]    Script Date: 29/11/2023 22:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrearUsuario]
@Nombre varchar(50), @Contrasenia varchar(50), @Email varchar(50), @Foto varchar(50)
AS
BEGIN
	INSERT INTO Usuario (Nombre,Contrasenia,Email,Foto)
	VALUES (@Nombre, @Contrasenia, @Email, @Foto)
END
GO
/****** Object:  StoredProcedure [dbo].[GuardarReceta]    Script Date: 29/11/2023 22:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GuardarReceta]
	@IDUsuario int,
	@IDReceta int
AS
BEGIN
	INSERT INTO RecetasGuardadas (IDUsuario,IDReceta) VALUES (@IDUsuario ,@IDReceta)
END
GO
/****** Object:  StoredProcedure [dbo].[IngresarPasosReceta]    Script Date: 29/11/2023 22:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IngresarPasosReceta]
	-- Add the parameters for the stored procedure here
	@IDReceta int, @NumPaso int, @Text text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO Paso (IDReceta,NumPaso,Text) VALUES (@IDReceta, @NumPaso, @Text)
END
GO
/****** Object:  StoredProcedure [dbo].[PasosReceta]    Script Date: 29/11/2023 22:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PasosReceta]
	-- Add the parameters for the stored procedure here
	@IDReceta int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SELECT * FROM Paso WHERE IDReceta = @IDReceta
END
GO
/****** Object:  StoredProcedure [dbo].[QueryAllIngredientes]    Script Date: 29/11/2023 22:39:14 ******/
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
/****** Object:  StoredProcedure [dbo].[QueryAllRecetas]    Script Date: 29/11/2023 22:39:14 ******/
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
/****** Object:  StoredProcedure [dbo].[QueryGuardados]    Script Date: 29/11/2023 22:39:14 ******/
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
/****** Object:  StoredProcedure [dbo].[QueryIngredientesPorReceta]    Script Date: 29/11/2023 22:39:14 ******/
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
	SELECT Ingrediente.ID, Ingrediente.Nombre From Ingrediente 
	INNER JOIN RecetasIngredientes ON Ingrediente.ID = RecetasIngredientes.IDIngrediente
	Where RecetasIngredientes.IDReceta = @IDReceta

END
GO
/****** Object:  StoredProcedure [dbo].[QueryPasosReceta]    Script Date: 29/11/2023 22:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[QueryPasosReceta]
	-- Add the parameters for the stored procedure here
	@IDReceta int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SELECT * FROM Paso WHERE IDReceta = @IDReceta
END
GO
/****** Object:  StoredProcedure [dbo].[QueryRecetaPorIngrediente]    Script Date: 29/11/2023 22:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[QueryRecetaPorIngrediente]
	-- Add the parameters for the stored procedure here
	@NombreIngrediente varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT Receta.ID,Receta.Nombre,Receta.Descripcion,Receta.FechaPublicacion,Receta.Tipo,Receta.Img,Receta.Banner 
	FROM Receta
	INNER JOIN RecetasIngredientes ON Receta.ID = RecetasIngredientes.IDReceta
	WHERE RecetasIngredientes.IDIngrediente = (SELECT ID FROM Ingrediente WHERE Ingrediente.Nombre LIKE '%' + @NombreIngrediente + '%')
END
GO
/****** Object:  StoredProcedure [dbo].[QueryRecetaPorNombre]    Script Date: 29/11/2023 22:39:14 ******/
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
	Select * From Receta Where Nombre LIKE '%' + @Nombre + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[QueryRecetasCreadas]    Script Date: 29/11/2023 22:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[QueryRecetasCreadas]
	@IDUsuario int
AS
BEGIN
	SELECT * FROM Receta 
	INNER JOIN RecetasCreadas ON Receta.ID = RecetasCreadas.IDReceta
	WHERE(RecetasCreadas.IDUsuario = @IDUsuario)
END
GO
/****** Object:  StoredProcedure [dbo].[QueryUsuario]    Script Date: 29/11/2023 22:39:14 ******/
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
/****** Object:  StoredProcedure [dbo].[SubirReceta]    Script Date: 29/11/2023 22:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SubirReceta]
@Nombre varchar(50), @FechaPublicacion datetime, @Descripcion text, @Tipo varchar(50), @Img varchar(50), @Banner varchar(50)
AS
BEGIN
	INSERT INTO Receta (Nombre,FechaPublicacion,Descripcion,Tipo,Img,Banner)
	VALUES (@Nombre, @FechaPublicacion, @Descripcion,@Tipo,@Img,@Banner)
END
GO
USE [master]
GO
ALTER DATABASE [BDGrabAByte] SET  READ_WRITE 
GO
