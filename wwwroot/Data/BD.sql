USE [master]
GO
/****** Object:  Database [BDGrabAByte]    Script Date: 24/6/2024 10:56:28 ******/
CREATE DATABASE [BDGrabAByte] ON  PRIMARY 
( NAME = N'BDGrabAByte', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\BDGrabAByte.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BDGrabAByte_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\BDGrabAByte_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BDGrabAByte] SET COMPATIBILITY_LEVEL = 100
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
USE [BDGrabAByte]
GO
/****** Object:  User [UserApp]    Script Date: 24/6/2024 10:56:28 ******/
CREATE USER [UserApp] FOR LOGIN [UserApp] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'UserApp'
GO
sys.sp_addrolemember @rolename = N'db_accessadmin', @membername = N'UserApp'
GO
sys.sp_addrolemember @rolename = N'db_securityadmin', @membername = N'UserApp'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'UserApp'
GO
sys.sp_addrolemember @rolename = N'db_backupoperator', @membername = N'UserApp'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'UserApp'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'UserApp'
GO
sys.sp_addrolemember @rolename = N'db_denydatareader', @membername = N'UserApp'
GO
sys.sp_addrolemember @rolename = N'db_denydatawriter', @membername = N'UserApp'
GO
/****** Object:  Table [dbo].[Ingrediente]    Script Date: 24/6/2024 10:56:28 ******/
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
/****** Object:  Table [dbo].[Paso]    Script Date: 24/6/2024 10:56:28 ******/
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
/****** Object:  Table [dbo].[Receta]    Script Date: 24/6/2024 10:56:28 ******/
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
/****** Object:  Table [dbo].[RecetasCreadas]    Script Date: 24/6/2024 10:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetasCreadas](
	[IDUsuario] [int] NOT NULL,
	[IDReceta] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecetasGuardadas]    Script Date: 24/6/2024 10:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetasGuardadas](
	[IDReceta] [int] NOT NULL,
	[IDUsuario] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecetasIngredientes]    Script Date: 24/6/2024 10:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecetasIngredientes](
	[IDReceta] [int] NOT NULL,
	[IDIngrediente] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 24/6/2024 10:56:28 ******/
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
/****** Object:  Table [dbo].[Valoracion]    Script Date: 24/6/2024 10:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Valoracion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDReceta] [int] NOT NULL,
	[Puntaje] [int] NOT NULL,
	[Dificultad] [int] NOT NULL,
	[Tiempo] [int] NOT NULL,
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
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (16, N'Pan de sándwich')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (17, N'Jamón')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (18, N'Queso')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (19, N'Mantequilla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (20, N'Mayonesa')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (21, N'Mostaza')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (22, N'Tortillas de harina')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (23, N'Carne de res o pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (24, N'Frijoles refritos')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (25, N'Arroz')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (26, N'Queso')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (27, N'Salsa')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (28, N'Guacamole')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (29, N'Crema agria')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (30, N'Placas de lasaña')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (31, N'Carne molida')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (32, N'Salsa de tomate')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (33, N'Queso ricotta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (34, N'Queso mozzarella')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (35, N'Queso parmesano')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (36, N'Espinacas')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (37, N'Ajo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (38, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (39, N'Pimienta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (40, N'Pescado blanco (corvina, lenguado)')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (41, N'Limón')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (42, N'Cebolla roja')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (43, N'Cilantro')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (44, N'Ají o chile')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (45, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (46, N'Pimienta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (47, N'Maíz tostado (opcional)')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (48, N'Pollo entero')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (49, N'Limón')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (50, N'Ajo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (51, N'Aceite de oliva')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (52, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (53, N'Pimienta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (54, N'Romero')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (55, N'Tomillo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (56, N'Pechugas de pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (57, N'Pimiento')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (58, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (59, N'Aceite de oliva')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (60, N'Comino')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (61, N'Chile en polvo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (62, N'Ajo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (63, N'Limón')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (64, N'Tortillas de harina')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (65, N'Lentejas')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (66, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (67, N'Zanahoria')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (68, N'Apio')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (69, N'Tomate')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (70, N'Ajo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (71, N'Caldo de verduras')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (72, N'Pimentón')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (73, N'Comino')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (74, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (75, N'Pimienta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (76, N'Papas')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (77, N'Huevos')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (78, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (79, N'Aceite de oliva')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (80, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (81, N'Pechugas de pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (82, N'Harina')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (83, N'Huevo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (84, N'Pan rallado')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (85, N'Aceite para freír')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (86, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (87, N'Pimienta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (88, N'Aguacate')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (89, N'Tomate')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (90, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (91, N'Cilantro')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (92, N'Limón')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (93, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (94, N'Chile (opcional)')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (95, N'Masa para tamales')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (96, N'Carne de cerdo o pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (97, N'Hoja de maíz')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (98, N'Salsa roja o verde')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (99, N'Caldo de pollo')
GO
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (100, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (101, N'Pimienta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (102, N'Fideos de arroz')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (103, N'Pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (104, N'Camarones')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (105, N'Huevos')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (106, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (107, N'Pimiento')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (108, N'Zanahoria')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (109, N'Aceite de sésamo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (110, N'Salsa de soya')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (111, N'Aceite de ajonjolí')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (112, N'Filete de carne (res, cerdo, pollo)')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (113, N'Aceite de oliva')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (114, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (115, N'Pimienta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (116, N'Ajo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (117, N'Romero')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (118, N'Tomillo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (119, N'Berenjena')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (120, N'Carne molida')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (121, N'Tomate')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (122, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (123, N'Ajo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (124, N'Leche')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (125, N'Harina')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (126, N'Mantequilla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (127, N'Queso rallado')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (128, N'Aceite de oliva')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (129, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (130, N'Pimienta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (131, N'Masa para samosas')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (132, N'Papa')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (133, N'Guisantes')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (134, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (135, N'Cilantro')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (136, N'Comino')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (137, N'Cúrcuma')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (138, N'Cilantro en polvo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (139, N'Garam masala')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (140, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (141, N'Aceite para freír')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (142, N'Masa para gyoza')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (143, N'Carne de cerdo molida')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (144, N'Col china')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (145, N'Cebollino')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (146, N'Jengibre')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (147, N'Salsa de soya')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (148, N'Vinagre de arroz')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (149, N'Aceite de sésamo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (150, N'Pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (151, N'Jamón serrano')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (152, N'Leche')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (153, N'Harina')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (154, N'Huevo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (155, N'Pan rallado')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (156, N'Aceite para freír')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (157, N'Harina')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (158, N'Huevo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (159, N'Papa')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (160, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (161, N'Mantequilla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (162, N'Bacon')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (163, N'Crema agria')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (164, N'Papa')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (165, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (166, N'Huevo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (167, N'Harina')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (168, N'Mantequilla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (169, N'Aceite')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (170, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (171, N'Pimienta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (172, N'Pechugas de pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (173, N'Tomate triturado')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (174, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (175, N'Ajo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (176, N'Jengibre')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (177, N'Yogur griego')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (178, N'Crema')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (179, N'Comino')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (180, N'Cilantro')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (181, N'Pimentón')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (182, N'Pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (183, N'Curry verde tailandés')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (184, N'Leche de coco')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (185, N'Bambú')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (186, N'Pimientos')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (187, N'Berenjena')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (188, N'Albahaca tailandesa')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (189, N'Pasta de miso')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (190, N'Alga kombu')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (191, N'Tofu')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (192, N'Cebolla verde')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (193, N'Caldo dashi')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (194, N'Col china')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (195, N'Rábano picante')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (196, N'Ajo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (197, N'Jengibre')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (198, N'Salsa de pescado')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (199, N'Chile en polvo')
GO
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (200, N'Tomates')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (201, N'Pepino')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (202, N'Pimiento verde')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (203, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (204, N'Ajo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (205, N'Vinagre de vino')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (206, N'Aceite de oliva')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (207, N'Pan')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (208, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (209, N'Pimienta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (210, N'Masa quebrada')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (211, N'Huevos')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (212, N'Crema de leche')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (213, N'Queso rallado')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (214, N'Jamón')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (215, N'Espinacas')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (216, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (217, N'Pimienta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (218, N'Nuez moscada')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (219, N'Pavo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (220, N'Mantequilla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (221, N'Ajo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (222, N'Romero')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (223, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (224, N'Pimienta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (225, N'Vino blanco')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (226, N'Caldo de pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (227, N'Garbanzos')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (228, N'Tahini')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (229, N'Ajo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (230, N'Limón')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (231, N'Comino')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (232, N'Aceite de oliva')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (233, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (234, N'Pimentón')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (235, N'Harina de maíz')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (236, N'Agua')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (237, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (238, N'Queso rallado')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (239, N'Mantequilla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (240, N'Reina pepiada')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (241, N'Chicharrón')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (242, N'Carne de cordero o pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (243, N'Pan pita')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (244, N'Yogur griego')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (245, N'Ajo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (246, N'Limón')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (247, N'Comino')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (248, N'Canela')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (249, N'Pimentón')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (250, N'Aceite de oliva')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (251, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (252, N'Tomates')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (253, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (254, N'Ajo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (255, N'Pimiento rojo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (256, N'Caldo de pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (257, N'Tomate concentrado')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (258, N'Aceite de oliva')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (259, N'Pan tostado')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (260, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (261, N'Pimienta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (262, N'Azúcar')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (263, N'Carne molida')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (264, N'Frijoles rojos')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (265, N'Tomates')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (266, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (267, N'Ajo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (268, N'Pimiento')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (269, N'Chile en polvo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (270, N'Comino')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (271, N'Pimentón')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (272, N'Azúcar')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (273, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (274, N'Pimienta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (275, N'Garbanzos')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (276, N'Cilantro')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (277, N'Perejil')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (278, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (279, N'Ajo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (280, N'Comino')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (281, N'Cilantro en polvo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (282, N'Pimienta de cayena')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (283, N'Harina')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (284, N'Levadura')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (285, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (286, N'Aceite para freír')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (287, N'Fideos ramen')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (288, N'Caldo de pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (289, N'Salsa de soya')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (290, N'Huevo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (291, N'Cebolla verde')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (292, N'Algas nori')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (293, N'Pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (294, N'Brotes de bambú')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (295, N'Salmón')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (296, N'Atún')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (297, N'Jengibre encurtido')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (298, N'Wasabi')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (299, N'Salsa de soya')
GO
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (300, N'Arroz')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (301, N'Azafrán')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (302, N'Pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (303, N'Conejo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (304, N'Judías verdes')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (305, N'Tomate')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (306, N'Caldo de pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (307, N'Aceite de oliva')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (308, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (309, N'Polenta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (310, N'Agua')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (311, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (312, N'Mantequilla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (313, N'Queso parmesano')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (314, N'Berenjena')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (315, N'Calabacín')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (316, N'Pimiento rojo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (317, N'Pimiento amarillo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (318, N'Tomate')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (319, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (320, N'Ajo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (321, N'Aceite de oliva')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (322, N'Tomillo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (323, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (324, N'Pimienta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (325, N'Harina')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (326, N'Levadura')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (327, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (328, N'Aceite de oliva')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (329, N'Tomate')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (330, N'Queso')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (331, N'Orégano')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (332, N'Carne molida')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (333, N'Pan de hamburguesa')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (334, N'Lechuga')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (335, N'Tomate')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (336, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (337, N'Queso')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (338, N'Mayonesa')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (339, N'Mostaza')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (340, N'Pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (341, N'Caldo de pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (342, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (343, N'Zanahoria')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (344, N'Apio')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (345, N'Ajo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (346, N'Perejil')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (347, N'Romero')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (348, N'Sal')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (349, N'Pimienta')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (350, N'Carne de res')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (351, N'Tortillas de maíz')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (352, N'Cilantro')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (353, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (354, N'Aguacate')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (355, N'Queso')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (356, N'Limón')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (357, N'Tortillas de maíz')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (358, N'Pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (359, N'Queso')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (360, N'Salsa roja')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (361, N'Crema')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (362, N'Lechuga')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (363, N'Masa para empanadas')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (364, N'Carne molida')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (365, N'Cebolla')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (366, N'Comino')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (367, N'Pimentón')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (368, N'Aceitunas')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (369, N'Huevo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (370, N'Arroz para sushi')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (371, N'Alga nori')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (372, N'Salmón fresco')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (373, N'Aguacate')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (374, N'Pepino')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (375, N'Vinagre de arroz')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (376, N'Azúcar')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (377, N'Salsa de soya')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (378, N'Lechuga romana')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (379, N'Pollo')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (380, N'Pan tostado')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (381, N'Queso parmesano')
INSERT [dbo].[Ingrediente] ([ID], [Nombre]) VALUES (382, N'Salsa César')
SET IDENTITY_INSERT [dbo].[Ingrediente] OFF
GO
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
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (29, 60, 1, N'Preparar la masa mezclando harina, agua, levadura y sal.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (30, 60, 2, N'Amasar la masa y dejar reposar hasta que duplique su tamaño.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (31, 60, 3, N'Extender la masa y cubrirla con salsa de tomate y ingredientes al gusto.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (32, 60, 4, N'Hornear la pizza a temperatura alta hasta que esté dorada y crujiente.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (33, 61, 1, N'Preparar la carne molida con sal y pimienta, formar hamburguesas y cocinarlas a la parrilla.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (34, 61, 2, N'Tostar los bollos de hamburguesa y montar con lechuga, tomate, queso y aderezos.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (35, 62, 1, N'Hervir agua con pollo, zanahorias, papas, cebolla y ajo.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (36, 62, 2, N'Cocinar hasta que las verduras estén tiernas y el pollo esté cocido.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (37, 62, 3, N'Desmenuzar el pollo y añadirlo de nuevo a la sopa.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (38, 62, 4, N'Sazonar con sal, pimienta y servir caliente.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (39, 63, 1, N'Preparar la carne con especias mexicanas y cocinarla.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (40, 63, 2, N'Calentar las tortillas y rellenarlas con la carne, cebolla, cilantro y salsa.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (41, 63, 3, N'Acompañar con limón y disfrutar.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (42, 64, 1, N'Freír las tortillas y sumergirlas en salsa roja o verde.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (43, 64, 2, N'Rellenar las tortillas con pollo desmenuzado y enrollar.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (44, 64, 3, N'Colocar las enchiladas en una bandeja, cubrir con queso y hornear hasta que el queso se derrita.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (45, 65, 1, N'Preparar la masa con harina, agua, sal y grasa.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (46, 65, 2, N'Rellenar las empanadas con carne, pollo o vegetales.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (47, 65, 3, N'Cerrar las empanadas y sellar los bordes.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (48, 65, 4, N'Hornear las empanadas hasta que estén doradas.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (49, 66, 1, N'Cocinar el arroz y condimentarlo con vinagre de arroz, azúcar y sal.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (50, 66, 2, N'Preparar las tiras de pescado, aguacate, pepino y otros ingredientes.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (51, 66, 3, N'Armar los rollos de sushi utilizando una esterilla de bambú.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (52, 66, 4, N'Cortar los rollos en porciones y servir con salsa de soja y wasabi.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (53, 67, 1, N'Preparar la salsa mezclando ajo, anchoas, jugo de limón, mostaza, yema de huevo y aceite.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (54, 67, 2, N'Cortar la lechuga romana en trozos grandes.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (55, 67, 3, N'Agregar la salsa César a la lechuga y mezclar bien.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (56, 67, 4, N'Agregar crutones y queso parmesano al gusto.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (57, 68, 1, N'Cortar pan baguette en la longitud deseada y abrirlo.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (58, 68, 2, N'Untar mantequilla o mayonesa en ambas mitades del pan.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (59, 68, 3, N'Colocar lonchas de jamón y queso en el pan.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (60, 68, 4, N'Cerrar el sándwich y tostarlo en una sartén hasta que esté dorado y el queso se derrita.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (61, 69, 1, N'Calentar las tortillas y rellenarlas con arroz, frijoles, carne, guacamole y queso.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (62, 69, 2, N'Envolver las tortillas de manera compacta, doblando los extremos.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (63, 69, 3, N'Calentar los burritos enrollados en una sartén hasta que estén crujientes y dorados.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (64, 70, 1, N'Cocinar las láminas de lasaña en agua hirviendo.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (65, 70, 2, N'Preparar la salsa de tomate y la salsa bechamel.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (66, 70, 3, N'En una bandeja para hornear, intercalar capas de pasta, salsa de tomate, queso y carne.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (67, 70, 4, N'Repetir las capas hasta terminar con salsa y queso en la capa superior.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (68, 70, 5, N'Hornear la lasaña a temperatura media hasta que esté burbujeante y dorada.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (69, 71, 1, N'Cortar el pescado en cubos pequeños y marinarlo con jugo de limón y sal.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (70, 71, 2, N'Agregar cebolla roja, tomate, cilantro y ají al gusto.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (71, 71, 3, N'Dejar reposar en el refrigerador hasta que el pescado se cocine con el ácido del limón.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (72, 71, 4, N'Servir el ceviche frío, acompañado de maíz tostado o chips de plátano.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (73, 72, 1, N'Marinar el pollo con limón, ajo, aceite de oliva, sal y pimienta.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (74, 72, 2, N'Colocar el pollo en una bandeja para hornear y rociar con más marinada.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (75, 72, 3, N'Hornear a temperatura media hasta que esté dorado y bien cocido.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (76, 73, 1, N'Cortar el pollo en tiras y cocinarlo en una sartén con cebolla y pimientos.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (77, 73, 2, N'Añadir comino, pimentón, ajo en polvo y otras especias al gusto.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (78, 73, 3, N'Calentar tortillas de harina y rellenarlas con el pollo y las verduras.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (79, 73, 4, N'Servir las fajitas calientes con guarniciones como guacamole y crema agria.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (80, 74, 1, N'Sofreír cebolla, zanahoria y apio en una olla grande.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (81, 74, 2, N'Agregar lentejas y cubrir con caldo de verduras.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (82, 74, 3, N'Cocinar a fuego lento hasta que las lentejas estén tiernas y el guiso espese.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (83, 74, 4, N'Sazonar con sal, pimienta y especias al gusto antes de servir.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (84, 75, 1, N'Freír las papas en rodajas finas hasta que estén doradas y tiernas.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (85, 75, 2, N'Batir los huevos y mezclar con las papas.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (86, 75, 3, N'Calentar aceite en una sartén y verter la mezcla de huevos y papas.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (87, 75, 4, N'Cocinar a fuego lento hasta que la tortilla esté cuajada por un lado, luego voltear y cocinar el otro lado.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (88, 76, 1, N'Marinar el pollo en suero de leche o leche con sal y especias.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (89, 76, 2, N'Mezclar harina, sal, pimienta y otras especias en un plato.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (90, 76, 3, N'Rebozar el pollo en la mezcla de harina y freír en aceite caliente hasta que esté dorado y cocido por dentro.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (91, 77, 1, N'Machacar aguacates en un tazón con un tenedor.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (92, 77, 2, N'Agregar cebolla picada, tomate, cilantro, jugo de limón, sal y chile al gusto.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (93, 77, 3, N'Mezclar bien todos los ingredientes hasta obtener la consistencia deseada.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (94, 78, 1, N'Remojar las hojas de maíz en agua caliente para ablandarlas.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (95, 78, 2, N'Preparar la masa mezclando harina de maíz con cal y agua.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (96, 78, 3, N'Extender la masa sobre las hojas de maíz y rellenar con carne o vegetales.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (97, 78, 4, N'Envolver los tamales y cocinar al vapor durante una hora o hasta que estén cocidos.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (98, 79, 1, N'Remojar los fideos de arroz en agua caliente hasta que estén blandos.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (99, 79, 2, N'Escurrir y saltear los fideos en una sartén con verduras, huevo y salsa de soja.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (100, 79, 3, N'Cocinar hasta que los ingredientes estén bien mezclados y los fideos estén calientes.')
GO
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (101, 80, 1, N'Marinar la carne con aceite de oliva, ajo picado, romero, sal y pimienta.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (102, 80, 2, N'Calentar una parrilla o sartén y cocinar la carne a fuego alto hasta que esté dorada y cocida al gusto.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (103, 80, 3, N'Dejar reposar la carne antes de cortarla en rodajas finas.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (104, 81, 1, N'Calentar caldo dashi en una olla.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (105, 81, 2, N'Agregar pasta de miso al caldo caliente y disolver bien.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (106, 81, 3, N'Incorporar tofu cortado en cubos y algas.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (107, 81, 4, N'Cocinar a fuego lento hasta que el tofu esté caliente y servir.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (108, 82, 1, N'Cocinar berenjenas en rodajas hasta que estén doradas.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (109, 82, 2, N'Preparar una salsa de carne con cebolla, carne picada, tomate y especias.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (110, 82, 3, N'En una bandeja para horno, intercalar capas de berenjena, salsa de carne y bechamel.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (111, 82, 4, N'Hornear la moussaka hasta que la capa superior esté dorada.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (112, 83, 1, N'Licuar tomates, pepino, pimiento, cebolla y ajo hasta obtener una mezcla suave.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (113, 83, 2, N'Agregar aceite de oliva, vinagre, sal y pimienta al gusto y mezclar bien.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (114, 83, 3, N'Refrigerar el gazpacho por al menos una hora antes de servir.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (115, 83, 1, N'Preparar la masa quebrada mezclando harina, mantequilla fría en cubos, sal y agua fría.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (116, 83, 2, N'Forrar un molde para quiche con la masa extendida y pinchar el fondo con un tenedor.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (117, 83, 3, N'Hornear la base de la masa en blanco durante unos minutos para que se asiente.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (118, 83, 4, N'Preparar el relleno batiendo huevos con crema de leche, sal, pimienta y nuez moscada.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (119, 83, 5, N'Agregar ingredientes como queso rallado, jamón, espinacas u otros vegetales al gusto.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (120, 83, 6, N'Verter el relleno sobre la masa precocida y hornear hasta que esté dorado y cuajado.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (121, 83, 7, N'Dejar enfriar un poco antes de cortar y servir caliente o a temperatura ambiente.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (122, 84, 1, N'Untar el pavo con mantequilla de hierbas y condimentar con sal y pimienta.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (123, 84, 2, N'Rellenar el pavo con mezcla de pan, cebolla, apio y hierbas.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (124, 84, 3, N'Colocar el pavo en una bandeja para hornear y asar en el horno a temperatura media hasta que esté dorado y cocido.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (125, 85, 1, N'Procesar garbanzos cocidos, tahini, jugo de limón, ajo y comino en un procesador de alimentos hasta obtener una pasta suave.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (126, 85, 2, N'Agregar agua según sea necesario para obtener la consistencia deseada.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (127, 85, 3, N'Condimentar con sal y servir con un chorrito de aceite de oliva y pimentón.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (128, 86, 1, N'Mezclar harina de maíz con agua y sal hasta obtener una masa suave.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (129, 86, 2, N'Formar las arepas en discos planos y cocinar en una plancha o sartén caliente.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (130, 86, 3, N'Cocinar hasta que estén doradas por ambos lados y huecas por dentro.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (131, 87, 1, N'Marinar el pollo o carne en yogur, ajo, limón, comino, pimentón y otras especias al gusto.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (132, 87, 2, N'Asar la carne marinada en un asador o sartén caliente hasta que esté cocida y dorada.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (133, 87, 3, N'Rebanar la carne y servir en pan de pita con ensaladas y salsa de tahini.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (134, 88, 1, N'Sofreír cebolla y ajo en una olla con aceite de oliva.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (135, 88, 2, N'Agregar tomates picados, caldo de verduras, albahaca y cocinar a fuego lento.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (136, 88, 3, N'Licuar la sopa hasta obtener una textura suave.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (137, 88, 4, N'Calentar la sopa y servir caliente con queso rallado y crutones.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (138, 89, 1, N'Dorar la carne molida en una olla grande con cebolla y ajo.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (139, 89, 2, N'Agregar pimientos, tomates, frijoles y especias como comino, pimentón y chile en polvo.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (140, 89, 3, N'Cocinar a fuego lento hasta que los sabores se mezclen y la carne esté tierna.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (141, 90, 1, N'Procesar garbanzos cocidos, cebolla, ajo, perejil, cilantro, comino y coriandro en un procesador de alimentos hasta obtener una masa.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (142, 90, 2, N'Formar bolitas con la masa de garbanzos y aplastar ligeramente.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (143, 90, 3, N'Freír los falafels en aceite caliente hasta que estén dorados y crujientes por fuera.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (144, 91, 1, N'Hervir agua en una olla y agregar los fideos ramen.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (145, 91, 2, N'Cocinar los fideos según las instrucciones del paquete.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (146, 91, 3, N'Agregar condimentos y especias del paquete o al gusto.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (147, 91, 4, N'Servir caliente, añadiendo huevo, verduras o carne al gusto.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (148, 92, 1, N'Cortar pescado fresco en rodajas finas y uniformes.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (149, 92, 2, N'Servir el sashimi en platos individuales con salsa de soja y wasabi al lado.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (150, 92, 3, N'Decorar con rodajas de limón y hojas de menta.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (151, 93, 1, N'Sofreír azafrán, cebolla y ajo en aceite de oliva en una paellera.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (152, 93, 2, N'Agregar arroz y revolver para que se impregne con los sabores.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (153, 93, 3, N'Incorporar caldo de pescado, azafrán, pimiento rojo, tomate, guisantes y mariscos.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (154, 93, 4, N'Cocinar a fuego lento hasta que el arroz esté tierno y se forme una costra dorada en el fondo.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (155, 94, 1, N'Hervir agua con sal en una olla grande.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (156, 94, 2, N'Agregar lentamente la harina de maíz, revolviendo constantemente para evitar grumos.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (157, 94, 3, N'Cocinar a fuego lento durante unos 30-40 minutos, revolviendo ocasionalmente, hasta que la polenta esté espesa y cremosa.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (158, 95, 1, N'Rebanar berenjenas, calabacines y tomates en rodajas finas.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (159, 95, 2, N'Colocar las rodajas en capas en una bandeja para hornear, alternando los vegetales.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (160, 95, 3, N'Rociar con aceite de oliva, espolvorear hierbas provenzales, sal y pimienta.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (161, 95, 4, N'Hornear hasta que los vegetales estén tiernos y dorados.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (162, 96, 1, N'Preparar la masa con harina, sal, agua y aceite, y dejar reposar.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (163, 96, 2, N'Cocer papas en agua con sal hasta que estén tiernas.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (164, 96, 3, N'Sofreír cebolla con jengibre, ajo y chiles verdes en una sartén caliente.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (165, 96, 4, N'Agregar las papas cocidas y guisantes, y condimentar con garam masala y cilantro.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (166, 96, 5, N'Rellenar los triángulos de masa con la mezcla y freír en aceite caliente hasta que estén dorados.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (167, 97, 1, N'Mezclar carne de cerdo picada con repollo picado, cebollín, ajo y jengibre.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (168, 97, 2, N'Rellenar discos de masa de gyoza con la mezcla y sellar los bordes con agua.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (169, 97, 3, N'Cocinar los gyoza en una sartén con aceite caliente hasta que estén dorados en la base.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (170, 97, 4, N'Agregar agua a la sartén, tapar y cocinar al vapor hasta que el líquido se absorba.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (171, 98, 1, N'Preparar una bechamel espesa con mantequilla, harina y leche caliente.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (172, 98, 2, N'Agregar jamón serrano picado y mezclar bien.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (173, 98, 3, N'Dejar enfriar la masa y formar bolitas con las manos.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (174, 98, 4, N'Rebozar las croquetas en huevo batido y pan rallado.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (175, 98, 5, N'Freír en aceite caliente hasta que estén doradas por fuera.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (176, 99, 1, N'Preparar la masa con harina, huevo, agua y sal, y dejar reposar.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (177, 99, 2, N'Picar cebolla y saltear en mantequilla hasta que esté transparente.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (178, 99, 3, N'Mezclar queso cottage con papas cocidas y aplastadas, y condimentar con sal y pimienta.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (179, 99, 4, N'Estirar la masa y cortar círculos con un cortador, rellenar con la mezcla de queso y papas, y sellar los bordes.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (180, 99, 5, N'Cocinar los pierogi en agua hirviendo con sal hasta que floten, luego dorar en mantequilla.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (181, 100, 1, N'Rallar papas y exprimir para eliminar el exceso de agua.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (182, 100, 2, N'Mezclar las papas con sal, pimienta y mantequilla derretida.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (183, 100, 3, N'Calentar aceite en una sartén y colocar la mezcla de papas, presionando para formar una torta.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (184, 100, 4, N'Cocinar a fuego medio hasta que la base esté dorada y crujiente, luego voltear y dorar el otro lado.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (185, 101, 1, N'Marinar trozos de pollo en yogur, jugo de limón y especias durante al menos 1 hora.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (186, 101, 2, N'Asar el pollo en un horno o sartén hasta que esté cocido y ligeramente dorado.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (187, 101, 3, N'Preparar la salsa con tomate, cebolla, ajo, jengibre y especias como garam masala.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (188, 101, 4, N'Incorporar el pollo asado a la salsa y cocinar a fuego lento durante unos minutos hasta que la salsa espese.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (189, 102, 1, N'Mezclar pasta de curry verde con leche de coco en una olla caliente.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (190, 102, 2, N'Agregar trozos de pollo, berenjena, calabacín y hojas de lima kaffir.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (191, 102, 3, N'Cocinar a fuego medio hasta que el pollo esté cocido y las verduras estén tiernas.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (192, 102, 4, N'Condimentar con salsa de pescado, azúcar y jugo de lima, y servir con arroz al vapor.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (193, 103, 1, N'Cortar col china en trozos y espolvorear con sal, dejar reposar durante varias horas.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (194, 103, 2, N'Enjuagar la col para quitar el exceso de sal, escurrir y secar bien.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (195, 103, 3, N'Mezclar la col con pasta de pimiento rojo, ajo, jengibre rallado y cebollines picados.')
INSERT [dbo].[Paso] ([ID], [IDReceta], [NumPaso], [Text]) VALUES (196, 103, 4, N'Colocar en frascos esterilizados y dejar fermentar a temperatura ambiente durante 1-2 días antes de refrigerar.')
SET IDENTITY_INSERT [dbo].[Paso] OFF
GO
SET IDENTITY_INSERT [dbo].[Receta] ON 

INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (3, N'Arroz', CAST(N'2023-09-11T00:00:00.000' AS DateTime), N'Un simple plato de arroz', N'Guarnición', N'https://images.aws.nestle.recipes/original/cc1ed7245ed521b41e14c8c7ca0fa9f8_foto_arroz.jpg', N'https://www.recetasnestle.com.co/sites/default/files/2021-11/Recetas_Banner_Granos-de-arroz-blanco-y-cuchara-de-palo_1200x384.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (4, N'Pure de papa', CAST(N'2023-09-11T00:00:00.000' AS DateTime), N'Pure de papa con manteca', N'Guarnicion', N'https://images.aws.nestle.recipes/original/422441e37cf5c5d87eb8f86007af488c_GettyImages-1161443547.jpg', N'https://www.allrecipes.com/thmb/pKqN_412bNQGb7GmM8VAuCR5nHQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/1664470850489282388_Mashed-Potatoes-with-Cream-banner-2000-f67fcc47bf714ee29da13fa4e61efcac.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (6, N'Tallarines', CAST(N'2023-09-11T00:00:00.000' AS DateTime), N'Unos simples fideos de paquete', N'Plato Principal/Guarnición', N'https://imagenes.20minutos.es/files/image_1920_1080/uploads/imagenes/2021/09/13/fideos.jpeg', N'https://t4.ftcdn.net/jpg/01/66/13/13/360_F_166131355_hZvpRH9rYgWIDd8ObTBu5eECwusBFPcn.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (7, N'Brownie', CAST(N'2023-09-11T00:00:00.000' AS DateTime), N'Brownies de chocolate', N'Postre', N'https://img.taste.com.au/cy4EAfYe/w1200-h630-cfill/taste/2016/11/classic-chewy-brownie-102727-1.jpeg', N'https://d2v9ipibika81v.cloudfront.net/uploads/sites/38/2017/07/brownies-fb-banner.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (9, N'Bife de Chorizo', CAST(N'2023-09-11T00:00:00.000' AS DateTime), N'Un Bife de Chorizo a la plancha', N'Plato Principal', N'https://saborargento.com.ar/wp-content/uploads/2023/08/Receta-de-Bife-de-Chorizo.jpg', N'https://fastly.4sqi.net/img/general/1398x536/12996904_eQnzDicj_U_HRxt6T5KvpG3v-BGjx6ehjkTTjb5iaOY.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (60, N'Pizza casera', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Deliciosa pizza hecha en casa.', N'Comida', N'https://ristorante-classico.de/de-wAssets/img/adobe-stock/speisen/AdobeStock_60447569.jpeg', N'http://cdn2.cocinadelirante.com/sites/default/files/images/2017/01/pizzapepperonni.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (61, N'Hamburguesa', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Jugosa hamburguesa casera.', N'Comida', N'https://www.labrujula24.com/wp-content/uploads/2023/11/1-5.jpg', N'https://cdn2.cocinadelirante.com/800x600/filters:format(webp):quality(75)/sites/default/files/images/2023/08/recetas-de-hamburguesas-caseras.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (62, N'Sopa de pollo', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Sopa reconfortante de pollo.', N'Sopa', N'https://www.gourmet.cl/wp-content/uploads/2016/09/Consome-Pollo-Web-570x458.jpg', N'https://www.gourmet.cl/wp-content/uploads/2018/04/Foto-editada-1.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (63, N'Tacos', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Tacos tradicionales mexicanos.', N'Comida', N'https://www.pequerecetas.com/wp-content/uploads/2020/10/tacos-mexicanos.jpg', N'https://imgmedia.buenazo.pe/650x358/buenazo/original/2021/05/11/609af78e6d7f3018d307b85e.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (64, N'Enchiladas', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Enchiladas con salsa roja.', N'Comida', N'https://www.gourmet.cl/wp-content/uploads/2021/08/foto-istock-enchilada-tama%C3%B1o-web.jpg', N'https://www.recetasnestle.com.mx/sites/default/files/srh_recipes/7ebe8aaf6c0838d80e5c3471f97ad316.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (65, N'Empanadas', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Empanadas rellenas de carne.', N'Comida', N'https://assets.elgourmet.com/wp-content/uploads/2023/10/EMPANADAS-1-1024x683.jpg.webp', N'https://www.lanacion.com.ar/resizer/v2/empanadas-de-7IXBPJ5JHBDCBHSUDK3CFZ5XHU.jpg?auth=9455e6ab67367ad88ef7cc1b4e5246742b66a926f59d0a7dabaf15bc22919c10&width=880&height=586&quality=70&smart=true')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (66, N'Sushi', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Sushi con ingredientes básicos.', N'Comida', N'https://www.kikkoman.es/fileadmin/_processed_/a/c/csm_941-recipe-page-vegetarian-maki-sushi-three-ways_desktop_b01ae2c632.webp', N'https://s3.abcstatics.com/media/gurme/2023/09/07/s/maki-sushi-casero1-0012-kfDE--940x529@abc.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (67, N'Ensalada César', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Ensalada César clásica.', N'Ensalada', N'https://www.gourmet.cl/wp-content/uploads/2016/09/Ensalada_C%C3%A9sar-web.jpg', N'https://assets.unileversolutions.com/recipes-v3/247685-default.jpg?im=AspectCrop=(1072,804);Resize=(1072,804)')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (68, N'Sándwich de jamón y queso', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Sándwich simple de jamón y queso.', N'Comida', N'https://cocina-familiar.com/wp-content/uploads/2023/04/sandwich-de-huevo-con-jamon-y-queso.jpg', N'https://lacocinadefrabisa.lavozdegalicia.es/wp-content/uploads/2019/09/SANDWICH-DE-JAMON-Y-QUESO-TETILLA-1.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (69, N'Burritos', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Deliciosos burritos.', N'Comida', N'https://www.goya.com/media/4175/easy-black-bean-burritos.jpg?quality=80', N'https://www.hogarmania.com/archivos/202308/burrito-mexicano-848x477x80xX.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (70, N'Lasagna', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Lasagna fácil de preparar.', N'Comida', N'https://newmansown.com/wp-content/uploads/2022/03/Homemade-lasagna.png', N'https://media.diariouno.com.ar/p/8b940dc1da465229d48b7136b519ef50/adjuntos/298/imagenes/009/348/0009348860/1200x0/smart/lasagna-5jpg.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (71, N'Ceviche', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Ceviche fácil y rápido.', N'Comida', N'https://cdn0.recetasgratis.net/es/posts/7/4/1/ceviche_peruano_18147_600.webp', N'https://www.clarin.com/img/2020/02/20/NnQXi0hn_1256x620__1.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (72, N'Pollo asado', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Pollo asado jugoso.', N'Comida', N'https://s1.1zoom.me/big0/82/Roast_Chicken_Cutting_board_545758_1280x958.jpg', N'https://www.aldelis.com/wp-content/uploads/2020/09/pollo-asado_Aldelis.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (73, N'Fajitas de pollo', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Fajitas de pollo con vegetales.', N'Comida', N'https://razafolklorica.com.mx/wp-content/uploads/2021/08/Fajitas-de-pollo-con-verduras-1.jpg', N'https://www.thespruceeats.com/thmb/rrx0sLgbOG71fez9fMlnvcxrfgs=/4600x3067/filters:fill(auto,1)/easy-fajitas-recipe-3052908-hero-01-e4dc09dd6b28488191a9ddf700c7441b.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (74, N'Guiso de lentejas', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Guiso nutritivo de lentejas.', N'Comida', N'https://vinomanos.com/wp-content/uploads/2020/05/Como-hacer-un-guiso-de-lentejas-facil.jpg', N'https://www.cucinare.tv/wp-content/uploads/2020/03/Dise%C3%B1o-sin-t%C3%ADtulo-2020-03-10T110702.992.png')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (75, N'Tortilla española', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Tortilla española clásica.', N'Comida', N'https://www.24kitchen.nl/files/styles/social_media_share/public/2020-08/shutterstock_1722351610.jpg?itok=cPDqzGdj', N'https://mr-pauls-pantry.com/wp-content/uploads/2022/08/Tortilla-1-scaled-e1661827127347.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (76, N'Pollo frito', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Pollo frito crujiente.', N'Comida', N'https://recetacubana.es/wp-content/uploads/2019/10/pollo-frito.jpg', N'https://calisa.com.ar/wp-content/uploads/2022/02/pollo-frito-youtube.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (77, N'Guacamole', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Guacamole fresco y cremoso.', N'Comida', N'https://www.modernhoney.com/wp-content/uploads/2018/06/Authentic-Guacamole-Recipe-1.jpg', N'https://cdn.britannica.com/67/194867-050-8ED3F90C/ingredient-spread-guacamole-Mexican.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (78, N'Tamales', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Tamales fáciles de preparar.', N'Comida', N'https://aliciasmexicangrille.com/wp-content/uploads/2016/12/tamales.jpg', N'https://dashofcolorandspice.com/wp-content/uploads/2020/12/IMG_2124-2048x1365.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (79, N'Fideos de arroz', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Fideos de arroz rápidos.', N'Comida', N'https://paulasapron.com/wp-content/uploads/2023/01/Fideos-de-Arroz-con-Aceite-de-Ajo-Picante-Estilo-Chino-en-10-Minutos_Chili-Oil-Noodles_7-scaled.jpg', N'https://www.cucinare.tv/wp-content/uploads/2022/03/Fideos-de-arroz-1.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (80, N'Carne a la plancha', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Carne jugosa a la plancha.', N'Comida', N'https://buenprovecho.hn/wp-content/uploads/2019/01/iStock-174948482-e1550009150736.jpg', N'https://i.ytimg.com/vi/vZlCLiWxIZc/maxresdefault.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (81, N'Moussaka', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Moussaka fácil y rápida.', N'Comida', N'https://www.recipetineats.com/wp-content/uploads/2020/11/Greek-Moussaka_3-re-edited.jpg?resize=650', N'https://www.cuisineetsentiments.com/images/moussaka_6.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (82, N'Gazpacho', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Gazpacho refrescante.', N'Sopa', N'https://media.defense.gov/2016/Sep/13/2001632605/-1/-1/0/160913-F-XE708-002.JPG', N'https://animalgourmet.com/wp-content/uploads/2023/05/Gazpacho3-scaled.jpeg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (83, N'Quiche', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Quiche de verduras y queso.', N'Comida', N'https://tasteofmissions.com/wp-content/uploads/2021/07/image.jpeg', N'https://www.simplyrecipes.com/thmb/rfneTPyP3cUFVJ06Uqs9p5OkDOk=/3900x0/filters:no_upscale():max_bytes(150000):strip_icc()/Simply-Recipes-Quiche-Lorraine-LEAD-4-bbc2620b4ce444629038f602b6f1b533.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (84, N'Pavo al horno', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Pavo jugoso al horno.', N'Comida', N'https://recetacubana.com/wp-content/uploads/2018/11/pavo-al-horno.jpg', N'https://www.comedera.com/wp-content/uploads/2023/10/pavo-para-thanksgiving.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (85, N'Hummus', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Hummus cremoso.', N'Comida', N'http://www.lilvienna.com/wp-content/uploads/Recipe-quick-hummus-canned-chickpeas-rotated.jpg', N'https://i2.wp.com/www.downshiftology.com/wp-content/uploads/2022/08/Hummus-main-1.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (86, N'Arepas', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Arepas tradicionales.', N'Comida', N'https://www.saluddiez.com/wp-content/uploads/2020/05/96597238_3003298926394313_6182728138549991068_n.jpg', N'https://eldiariony.com/wp-content/uploads/sites/2/2019/12/canva-venezuelan-typical-food-arepa.jpg?quality=80&strip=all')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (87, N'Shawarma casero', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Shawarma casero con salsa.', N'Comida', N'https://eldiariony.com/wp-content/uploads/sites/2/2019/12/canva-venezuelan-typical-food-arepa.jpg?quality=80&strip=all', N'https://www.desidakaar.com/wp-content/uploads/2020/02/shawarma.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (88, N'Sopa de tomate', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Sopa de tomate cremosa.', N'Sopa', N'https://www.justspices.es/media/recipe/sopa-de-tomate-sabrosa.jpg', N'https://enrilemoine.com/wp-content/uploads/2012/03/1IMG_3032-1.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (89, N'Chili con carne', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Chili con carne picante.', N'Comida', N'https://cdn3.tmbi.com/secure/RMS/attachments/37/1200x1200/Hearty-Beef---Bean-Chili_exps85663_THCA2180111B01_10_4bC_RMS.jpg', N'https://www.theanthonykitchen.com/wp-content/uploads/2017/02/Texas-Chili-10.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (90, N'Falafel', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Falafel crujiente y delicioso.', N'Comida', N'https://www.funfoodfrolic.com/wp-content/uploads/2020/12/Falafel-1.jpg', N'https://beat.com.au/wp-content/uploads/2019/07/falafel.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (91, N'Ramen instantáneo', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Ramen rápido y fácil.', N'Comida', N'https://bi.im-g.pl/im/cc/73/17/z24589004IH,Ramen.jpg', N'https://www.mashed.com/img/gallery/the-absolute-best-ramen-in-the-us/l-intro-1651587313.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (92, N'Sashimi', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Sashimi fresco.', N'Comida', N'https://assets.afcdn.com/recipe/20130823/47534_w1944h1242c1cx2464cy1632.jpg', N'http://2.bp.blogspot.com/-lrQV8poxW4Q/To4D2PsgQlI/AAAAAAAAB8M/IP1env_A-fg/s1600/Yamato+sashimi2.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (93, N'Paella', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Paella tradicional española.', N'Comida', N'https://images.ctfassets.net/3s5io6mnxfqz/34NyUGqALQMx49gcHBWzIa/4678333ae7f54314afbd6c3f3b5e8e69/image1.jpg', N'https://assets.afcdn.com/recipe/20130823/47534_w1944h1242c1cx2464cy1632.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (94, N'Polenta', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Polenta cremosa.', N'Comida', N'https://unareceta.com/wp-content/uploads/2016/10/polenta.jpg', N'https://assets.afcdn.com/recipe/20131009/54018_w1944h1242c1cx1416cy1761.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (95, N'Ratatouille', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Ratatouille de verduras.', N'Comida', N'https://cdn2.cocinadelirante.com/sites/default/files/images/2016/12/ratatouille.jpg', N'https://bishopsorchards.com/wp-content/uploads/2018/03/bigstock-Ratatouille-229335424.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (96, N'Samosas', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Samosas crujientes.', N'Comida', N'https://www.dipitt.com/wp-content/uploads/2021/03/Samosa-Banner-1200x788.jpg', N'https://www.detroitnews.com/gcdn/presto/2019/01/28/PDTN/a7823205-60b2-47c8-b5d1-41108ed31bf2-FOOD-SAMOSAS-3-SL.jpg?crop=5999,3374,x0,y626&width=3200&height=1800&format=pjpg&auto=webp')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (97, N'Gyoza', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Gyozas rellenas de carne.', N'Comida', N'https://www.chopstickchronicles.com/wp-content/uploads/2020/09/Gyoza-Update-2020-2-1024x1024.jpg', N'https://cdn.tasteatlas.com/Images/Dishes/3c16ad904018488f8c363413d356cacc.jpg?mw=2000')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (98, N'Croquetas', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Croquetas crujientes.', N'Comida', N'https://www.camarero10.com/wp-content/uploads/2020/09/croquetas-jamon.jpg', N'https://img.menzig.es/a/1000/1605-h2.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (99, N'Pierogi', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Pierogi rellenos de patata.', N'Comida', N'https://lp-cms-production.imgix.net/image_browser/Pierogi_Poland2_S.jpg?auto=format&fit=crop&sharp=10&vib=20&ixlib=react-8.6.4&w=850&q=20&dpr=5', N'https://cdn.momsdish.com/wp-content/uploads/2021/05/Pierogi13-2048x1365.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (100, N'Rosti', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Rosti de patata.', N'Comida', N'https://cdn.apartmenttherapy.info/image/upload/f_auto,q_auto:eco,c_fill,g_auto,w_1500/k%2FPhoto%2FRecipes%2F2020-12-rosti%2Fk-photo-2020-12-rosti-2', N'https://www.cucinare.tv/wp-content/uploads/2020/04/R%C3%B6sti.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (101, N'Pollo tikka masala', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Pollo tikka masala cremoso.', N'Comida', N'https://www.deliciosi.com/images/1600/1688/pollo-tikka-masala.jpg', N'https://www.yorokobu.es/src/uploads/2018/09/pollo-tikka-masala.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (102, N'Curry verde', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Curry verde tailandés.', N'Comida', N'https://www.yorokobu.es/src/uploads/2018/09/pollo-tikka-masala.jpg', N'https://www.simplyrecipes.com/thmb/2Sy-Fxb67brtPwVw3j3tEE9aiTs=/1600x1067/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2016__08__2016-09-05-Green-Curry-8-0ae982ea53514675b3dc552ed130e62f.jpg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (103, N'Sopa miso', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Sopa miso tradicional.', N'Sopa', N'https://1.bp.blogspot.com/-jRPFY07GIAs/X1Jq4T4JVeI/AAAAAAAAEgA/qavMc9BAVbEprCVN3mZIx2WrBwn9Z87CACLcBGAsYHQ/s16000/sopa-de-miso-tradicional.jpg', N'https://www.lavanguardia.com/uploads/2019/04/13/5e9978ede8fd8.jpeg')
INSERT [dbo].[Receta] ([ID], [Nombre], [FechaPublicacion], [Descripcion], [Tipo], [Img], [Banner]) VALUES (104, N'Kimchi', CAST(N'2024-06-24T00:00:00.000' AS DateTime), N'Kimchi coreano fermentado.', N'Comida', N'https://www.thespruceeats.com/thmb/dl6MiZYqkGye44Q2qn4LkP_IgCA=/4368x2912/filters:fill(auto,1)/kimchi-dish-served-on-a-white-plate-173021127-588b8a945f9b5874ee55f535.jpg', N'https://www.maangchi.com/wp-content/uploads/2015/04/kimchi3.jpg')
SET IDENTITY_INSERT [dbo].[Receta] OFF
GO
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (3, 5)
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (7, 5)
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (6, 5)
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (3, 2)
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (7, 2)
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (6, 2)
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (9, 2)
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (4, 3)
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (7, 3)
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (6, 3)
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (3, 3)
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (7, 4)
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (7, 1013)
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (6, 1013)
INSERT [dbo].[RecetasGuardadas] ([IDReceta], [IDUsuario]) VALUES (9, 5)
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
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (60, 1)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (60, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (60, 3)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (61, 15)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (61, 16)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (61, 17)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (61, 18)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (61, 19)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (61, 20)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (61, 21)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (62, 48)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (62, 49)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (62, 50)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (62, 51)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (62, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (62, 7)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (63, 22)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (63, 23)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (63, 24)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (64, 22)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (64, 23)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (64, 32)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (64, 26)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (65, 63)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (65, 1)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (65, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (65, 3)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (66, 370)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (66, 371)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (66, 372)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (66, 373)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (66, 375)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (67, 378)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (67, 21)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (67, 23)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (68, 16)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (68, 17)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (68, 18)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (68, 19)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (68, 20)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (68, 21)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (69, 22)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (69, 23)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (69, 24)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (69, 25)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (69, 26)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (69, 27)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (69, 28)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (69, 29)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (70, 30)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (70, 31)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (70, 32)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (70, 33)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (70, 34)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (70, 35)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (70, 36)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (70, 37)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (70, 38)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (70, 39)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (71, 40)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (71, 41)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (71, 42)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (71, 43)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (71, 44)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (71, 45)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (71, 46)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (72, 48)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (72, 49)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (72, 50)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (72, 51)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (72, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (72, 7)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (72, 54)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (72, 55)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (73, 56)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (73, 57)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (73, 58)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (73, 59)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (73, 60)
GO
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (73, 61)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (73, 62)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (73, 63)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (74, 65)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (74, 66)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (74, 67)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (74, 68)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (74, 69)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (74, 70)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (74, 71)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (74, 72)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (74, 73)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (74, 38)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (74, 39)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (75, 76)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (75, 77)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (75, 78)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (75, 79)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (75, 38)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (76, 81)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (76, 82)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (76, 83)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (76, 84)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (76, 85)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (76, 38)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (76, 39)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (77, 88)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (77, 89)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (77, 90)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (77, 91)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (77, 92)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (77, 38)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (77, 94)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (78, 95)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (78, 96)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (78, 97)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (78, 98)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (78, 99)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (78, 38)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (78, 39)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (79, 102)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (79, 103)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (79, 104)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (79, 105)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (79, 106)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (79, 107)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (79, 108)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (79, 109)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (79, 110)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (79, 111)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (80, 112)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (80, 113)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (80, 38)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (80, 39)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (80, 116)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (80, 117)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (80, 118)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (81, 119)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (81, 31)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (81, 121)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (81, 122)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (81, 123)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (81, 124)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (81, 125)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (81, 126)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (81, 127)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (81, 113)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (81, 38)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (81, 39)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (82, 202)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (82, 203)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (82, 204)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (82, 205)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (82, 206)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (82, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (82, 91)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (82, 42)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (83, 211)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (83, 212)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (83, 213)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (83, 17)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (83, 215)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (83, 38)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (83, 39)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (84, 219)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (84, 220)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (84, 221)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (84, 54)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (84, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (84, 39)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (84, 224)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (84, 99)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (85, 227)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (85, 228)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (85, 229)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (85, 42)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (85, 230)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (85, 60)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (85, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (85, 94)
GO
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (86, 235)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (86, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (86, 238)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (86, 239)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (87, 240)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (87, 241)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (87, 243)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (87, 244)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (87, 245)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (87, 230)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (87, 60)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (87, 94)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (88, 257)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (88, 113)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (88, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (88, 91)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (88, 42)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (89, 263)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (89, 264)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (89, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (89, 265)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (89, 266)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (89, 67)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (89, 70)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (89, 60)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (89, 71)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (89, 72)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (89, 39)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (90, 275)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (90, 76)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (90, 77)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (90, 78)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (90, 113)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (90, 60)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (90, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (90, 39)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (91, 287)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (91, 288)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (91, 110)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (91, 105)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (91, 291)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (92, 295)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (92, 296)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (93, 299)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (93, 300)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (93, 301)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (93, 302)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (93, 34)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (93, 304)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (93, 305)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (93, 99)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (93, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (93, 39)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (94, 309)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (94, 3)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (94, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (94, 312)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (94, 313)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (95, 314)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (95, 315)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (95, 316)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (95, 317)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (95, 305)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (95, 66)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (95, 67)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (95, 68)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (95, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (95, 39)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (96, 131)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (96, 132)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (96, 133)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (96, 66)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (96, 91)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (96, 60)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (96, 136)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (96, 138)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (96, 139)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (96, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (96, 85)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (97, 142)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (97, 143)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (97, 144)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (97, 145)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (97, 146)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (97, 147)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (97, 148)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (97, 149)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (98, 150)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (98, 151)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (98, 212)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (98, 213)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (98, 17)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (98, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (98, 39)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (99, 157)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (99, 158)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (99, 132)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (99, 66)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (99, 312)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (99, 2)
GO
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (99, 39)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (100, 159)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (100, 78)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (100, 161)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (100, 113)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (100, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (100, 39)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (101, 172)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (101, 60)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (101, 61)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (101, 62)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (101, 63)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (101, 64)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (101, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (101, 39)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (102, 182)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (102, 183)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (102, 184)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (102, 185)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (102, 186)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (102, 187)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (102, 188)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (102, 2)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (102, 39)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (103, 189)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (103, 3)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (103, 190)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (103, 191)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (104, 196)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (104, 197)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (104, 198)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (104, 199)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (104, 202)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (104, 69)
INSERT [dbo].[RecetasIngredientes] ([IDReceta], [IDIngrediente]) VALUES (104, 91)
GO
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
INSERT [dbo].[Usuario] ([ID], [Nombre], [Contrasenia], [Email], [Foto]) VALUES (1013, N'Alan', N'Alan123', N'alan@alan.com', N'https://i.pinimg.com/550x/18/b9/ff/18b9ffb2a8a791d')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Valoracion] ON 

INSERT [dbo].[Valoracion] ([ID], [IDReceta], [Puntaje], [Dificultad], [Tiempo]) VALUES (1, 4, 2, 3, 5)
INSERT [dbo].[Valoracion] ([ID], [IDReceta], [Puntaje], [Dificultad], [Tiempo]) VALUES (3, 6, 5, 5, 10)
INSERT [dbo].[Valoracion] ([ID], [IDReceta], [Puntaje], [Dificultad], [Tiempo]) VALUES (4, 6, 1, 1, 5)
INSERT [dbo].[Valoracion] ([ID], [IDReceta], [Puntaje], [Dificultad], [Tiempo]) VALUES (5, 3, 5, 5, 10)
INSERT [dbo].[Valoracion] ([ID], [IDReceta], [Puntaje], [Dificultad], [Tiempo]) VALUES (6, 3, 1, 1, 5)
INSERT [dbo].[Valoracion] ([ID], [IDReceta], [Puntaje], [Dificultad], [Tiempo]) VALUES (7, 7, 4, 2, 30)
INSERT [dbo].[Valoracion] ([ID], [IDReceta], [Puntaje], [Dificultad], [Tiempo]) VALUES (8, 7, 2, 5, 15)
INSERT [dbo].[Valoracion] ([ID], [IDReceta], [Puntaje], [Dificultad], [Tiempo]) VALUES (9, 9, 5, 2, 1)
INSERT [dbo].[Valoracion] ([ID], [IDReceta], [Puntaje], [Dificultad], [Tiempo]) VALUES (14, 6, 5, 5, 10)
INSERT [dbo].[Valoracion] ([ID], [IDReceta], [Puntaje], [Dificultad], [Tiempo]) VALUES (15, 6, 5, 2, 15)
SET IDENTITY_INSERT [dbo].[Valoracion] OFF
GO
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
/****** Object:  StoredProcedure [dbo].[CrearUsuario]    Script Date: 24/6/2024 10:56:28 ******/
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
/****** Object:  StoredProcedure [dbo].[GuardarReceta]    Script Date: 24/6/2024 10:56:28 ******/
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
/****** Object:  StoredProcedure [dbo].[IngresarPasosReceta]    Script Date: 24/6/2024 10:56:28 ******/
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
/****** Object:  StoredProcedure [dbo].[IngresarValoracion]    Script Date: 24/6/2024 10:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[IngresarValoracion]
	-- Add the parameters for the stored procedure here
	@IDReceta int, @Puntaje int, @Dificultad int, @Tiempo int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO Valoracion (IDReceta,Puntaje,Dificultad, Tiempo) VALUES (@IDReceta, @Puntaje, @Dificultad, @Tiempo)
END
GO
/****** Object:  StoredProcedure [dbo].[PasosReceta]    Script Date: 24/6/2024 10:56:28 ******/
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
/****** Object:  StoredProcedure [dbo].[QueryAllIngredientes]    Script Date: 24/6/2024 10:56:28 ******/
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
/****** Object:  StoredProcedure [dbo].[QueryAllRecetas]    Script Date: 24/6/2024 10:56:28 ******/
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
/****** Object:  StoredProcedure [dbo].[QueryGuardados]    Script Date: 24/6/2024 10:56:28 ******/
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
/****** Object:  StoredProcedure [dbo].[QueryIngredientesPorReceta]    Script Date: 24/6/2024 10:56:28 ******/
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
/****** Object:  StoredProcedure [dbo].[QueryPasosReceta]    Script Date: 24/6/2024 10:56:28 ******/
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
/****** Object:  StoredProcedure [dbo].[QueryRecetaPorIngrediente]    Script Date: 24/6/2024 10:56:28 ******/
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
	WHERE RecetasIngredientes.IDIngrediente IN (SELECT ID FROM Ingrediente WHERE Ingrediente.Nombre LIKE '%' + @NombreIngrediente + '%')
END
GO
/****** Object:  StoredProcedure [dbo].[QueryRecetaPorNombre]    Script Date: 24/6/2024 10:56:28 ******/
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
/****** Object:  StoredProcedure [dbo].[QueryRecetasCreadas]    Script Date: 24/6/2024 10:56:28 ******/
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
/****** Object:  StoredProcedure [dbo].[QueryUsuario]    Script Date: 24/6/2024 10:56:28 ******/
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
/****** Object:  StoredProcedure [dbo].[QueryValoracionPorReceta]    Script Date: 24/6/2024 10:56:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[QueryValoracionPorReceta]
	-- Add the parameters for the stored procedure here
	@IDReceta int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * From Valoracion 
	Where Valoracion.IDReceta = @IDReceta

END
GO
/****** Object:  StoredProcedure [dbo].[SubirReceta]    Script Date: 24/6/2024 10:56:28 ******/
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
