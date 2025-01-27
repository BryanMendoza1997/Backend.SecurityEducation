USE [master]
GO
/****** Object:  Database [SecurityEducationDB]    Script Date: 3/1/2025 22:57:35 ******/
CREATE DATABASE [SecurityEducationDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SecurityEducationDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SecurityEducationDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SecurityEducationDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SecurityEducationDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SecurityEducationDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SecurityEducationDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SecurityEducationDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SecurityEducationDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SecurityEducationDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SecurityEducationDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SecurityEducationDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SecurityEducationDB] SET  MULTI_USER 
GO
ALTER DATABASE [SecurityEducationDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SecurityEducationDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SecurityEducationDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SecurityEducationDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SecurityEducationDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SecurityEducationDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SecurityEducationDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [SecurityEducationDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SecurityEducationDB]
GO
/****** Object:  Table [dbo].[actividad]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actividad](
	[ac_id] [int] IDENTITY(1,1) NOT NULL,
	[ac_nombre] [nvarchar](200) NULL,
	[ac_descripcion] [nvarchar](400) NULL,
	[ac_estado] [bit] NULL,
	[ti_id] [int] NULL,
	[mo_id] [int] NULL,
 CONSTRAINT [PK_actividad] PRIMARY KEY CLUSTERED 
(
	[ac_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[campania]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[campania](
	[cam_id] [int] IDENTITY(1,1) NOT NULL,
	[cam_nombre] [nvarchar](200) NOT NULL,
	[cam_fecha_inicio] [date] NOT NULL,
	[cam_fecha_fin] [date] NOT NULL,
	[cam_estado] [nvarchar](50) NULL,
	[cam_desactivar] [bit] NULL,
 CONSTRAINT [PK_campania] PRIMARY KEY CLUSTERED 
(
	[cam_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[campania_modulo]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[campania_modulo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cam_id] [int] NOT NULL,
	[mo_id] [int] NOT NULL,
 CONSTRAINT [PK_campania_modulo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[certificado]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[certificado](
	[ce_id] [int] IDENTITY(1,1) NOT NULL,
	[ce_usuario_id] [int] NOT NULL,
	[ce_certificado] [nvarchar](max) NOT NULL,
	[ce_codigo] [nvarchar](max) NOT NULL,
	[ce_fecha_emision] [datetime] NULL,
 CONSTRAINT [PK_certificado] PRIMARY KEY CLUSTERED 
(
	[ce_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_actividad]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_actividad](
	[de_id] [int] IDENTITY(1,1) NOT NULL,
	[ac_id] [int] NOT NULL,
	[de_contenido] [nvarchar](max) NULL,
	[de_estado] [bit] NULL,
	[de_plantilla] [nchar](10) NULL,
 CONSTRAINT [PK_detalle_actividad] PRIMARY KEY CLUSTERED 
(
	[de_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_progreso_evaluacion]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_progreso_evaluacion](
	[dp_id] [int] IDENTITY(1,1) NOT NULL,
	[pro_id] [int] NOT NULL,
	[pre_id] [int] NOT NULL,
	[resp_id] [int] NOT NULL,
	[dp_estado] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_detalle_progreso_evaluacion] PRIMARY KEY CLUSTERED 
(
	[dp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evaluacion]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evaluacion](
	[eva_id] [int] IDENTITY(1,1) NOT NULL,
	[de_id] [int] NOT NULL,
	[eva_estado] [bit] NULL,
	[eva_fecha_creacion] [datetime] NULL,
 CONSTRAINT [PK_evaluacion] PRIMARY KEY CLUSTERED 
(
	[eva_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[log_procedimiento_almacenado]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[log_procedimiento_almacenado](
	[id_log] [int] IDENTITY(1,1) NOT NULL,
	[log_numero] [int] NULL,
	[log_severidad] [int] NULL,
	[los_procedimiento] [nvarchar](max) NULL,
	[log_linea] [int] NULL,
	[log_mensaje] [nvarchar](max) NULL,
 CONSTRAINT [PK_log_procedimiento_almacenado] PRIMARY KEY CLUSTERED 
(
	[id_log] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modulo]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modulo](
	[mo_id] [int] IDENTITY(1,1) NOT NULL,
	[mo_nombre] [nvarchar](200) NOT NULL,
	[mo_descripcion] [nvarchar](400) NULL,
	[mo_estado] [bit] NULL,
	[mo_fecha_creacion] [datetime] NULL,
	[mo_imagen] [nvarchar](max) NULL,
	[mo_ruta] [nvarchar](200) NULL,
 CONSTRAINT [PK_modulo] PRIMARY KEY CLUSTERED 
(
	[mo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[pe_id] [int] IDENTITY(1,1) NOT NULL,
	[pe_nombre] [nvarchar](200) NOT NULL,
	[pe_correo] [nvarchar](200) NOT NULL,
	[pe_fecha_nacimiento] [date] NULL,
	[pe_pais] [nvarchar](100) NULL,
	[pe_ocupacion] [nvarchar](200) NULL,
 CONSTRAINT [PK_persona] PRIMARY KEY CLUSTERED 
(
	[pe_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pregunta]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pregunta](
	[pre_id] [int] IDENTITY(1,1) NOT NULL,
	[pre_pregunta] [nvarchar](max) NULL,
	[eva_id] [int] NULL,
	[tip_pre_id] [int] NULL,
	[sec_id] [int] NULL,
	[pre_orden] [int] NULL,
 CONSTRAINT [PK_pregunta] PRIMARY KEY CLUSTERED 
(
	[pre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[progreso]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[progreso](
	[pro_id] [int] IDENTITY(1,1) NOT NULL,
	[us_id] [int] NOT NULL,
	[ac_id] [int] NOT NULL,
	[cam_id] [int] NULL,
	[pro_estado] [bit] NULL,
	[pro_fecha_finalizacion] [datetime] NULL,
	[pro_respuesta] [nvarchar](max) NULL,
	[pro_puntaje] [int] NULL,
 CONSTRAINT [PK_progreso] PRIMARY KEY CLUSTERED 
(
	[pro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[respuesta]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[respuesta](
	[resp_id] [int] IDENTITY(1,1) NOT NULL,
	[pre_id] [int] NOT NULL,
	[resp_respuesta] [nvarchar](max) NULL,
	[resp_orden] [int] NULL,
	[resp_correcta] [bit] NULL,
 CONSTRAINT [PK_respuesta] PRIMARY KEY CLUSTERED 
(
	[resp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[ro_id] [int] IDENTITY(1,1) NOT NULL,
	[ro_nombre] [nvarchar](100) NULL,
	[ro_descripcion] [nvarchar](100) NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[ro_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[seccion]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[seccion](
	[sec_id] [int] IDENTITY(1,1) NOT NULL,
	[sec_nombre] [nvarchar](300) NULL,
 CONSTRAINT [PK_seccion] PRIMARY KEY CLUSTERED 
(
	[sec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_actividad]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_actividad](
	[ti_id] [int] IDENTITY(1,1) NOT NULL,
	[ti_nombre] [nvarchar](200) NULL,
 CONSTRAINT [PK_tipo_actividad] PRIMARY KEY CLUSTERED 
(
	[ti_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_pregunta]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_pregunta](
	[tip_pre_id] [int] IDENTITY(1,1) NOT NULL,
	[tip_pre_descripcion] [nvarchar](100) NULL,
	[tip_pre_neumonico] [nchar](10) NULL,
 CONSTRAINT [PK_tipo_pregunta] PRIMARY KEY CLUSTERED 
(
	[tip_pre_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[us_id] [int] IDENTITY(1,1) NOT NULL,
	[us_alias] [nvarchar](100) NOT NULL,
	[us_clave] [nvarchar](max) NOT NULL,
	[ro_id] [int] NOT NULL,
	[us_estado] [bit] NULL,
	[us_numero_intentos] [int] NULL,
	[pe_id] [int] NULL,
	[us_salt] [nvarchar](max) NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[us_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[actividad] ON 

INSERT [dbo].[actividad] ([ac_id], [ac_nombre], [ac_descripcion], [ac_estado], [ti_id], [mo_id]) VALUES (1, N'Contraseña Segura', N'Literatura', 1, 1, 1)
INSERT [dbo].[actividad] ([ac_id], [ac_nombre], [ac_descripcion], [ac_estado], [ti_id], [mo_id]) VALUES (2, N'Contraseña Segura', N'Ejemplo', 1, 2, 1)
INSERT [dbo].[actividad] ([ac_id], [ac_nombre], [ac_descripcion], [ac_estado], [ti_id], [mo_id]) VALUES (3, N'Contraseña Segura', N'Cuestionario', 1, 3, 1)
INSERT [dbo].[actividad] ([ac_id], [ac_nombre], [ac_descripcion], [ac_estado], [ti_id], [mo_id]) VALUES (4, N'Contraseña Segura', N'Ejercicio o Caso de Estudio', 1, 4, 1)
INSERT [dbo].[actividad] ([ac_id], [ac_nombre], [ac_descripcion], [ac_estado], [ti_id], [mo_id]) VALUES (5, N'Phishing', N'Literatura', 1, 1, 2)
INSERT [dbo].[actividad] ([ac_id], [ac_nombre], [ac_descripcion], [ac_estado], [ti_id], [mo_id]) VALUES (6, N'Phishing', N'Ejemplo', 1, 2, 2)
INSERT [dbo].[actividad] ([ac_id], [ac_nombre], [ac_descripcion], [ac_estado], [ti_id], [mo_id]) VALUES (7, N'Phishing', N'Cuestionario', 1, 3, 2)
INSERT [dbo].[actividad] ([ac_id], [ac_nombre], [ac_descripcion], [ac_estado], [ti_id], [mo_id]) VALUES (8, N'Phishing', N'Ejercicio o Caso de Estudio', 1, 4, 2)
INSERT [dbo].[actividad] ([ac_id], [ac_nombre], [ac_descripcion], [ac_estado], [ti_id], [mo_id]) VALUES (9, N'Seguridad en Redes Públicas', N'Literatura', 1, 1, 3)
INSERT [dbo].[actividad] ([ac_id], [ac_nombre], [ac_descripcion], [ac_estado], [ti_id], [mo_id]) VALUES (10, N'Seguridad en Redes Públicas', N'Ejemplo', 1, 2, 3)
INSERT [dbo].[actividad] ([ac_id], [ac_nombre], [ac_descripcion], [ac_estado], [ti_id], [mo_id]) VALUES (11, N'Seguridad en Redes Públicas', N'Cuestionario', 1, 3, 3)
INSERT [dbo].[actividad] ([ac_id], [ac_nombre], [ac_descripcion], [ac_estado], [ti_id], [mo_id]) VALUES (12, N'Seguridad en Redes Públicas', N'Ejercicio o Caso de Estudio', 1, 4, 3)
SET IDENTITY_INSERT [dbo].[actividad] OFF
GO
SET IDENTITY_INSERT [dbo].[campania] ON 

INSERT [dbo].[campania] ([cam_id], [cam_nombre], [cam_fecha_inicio], [cam_fecha_fin], [cam_estado], [cam_desactivar]) VALUES (20, N'Campaña 1 2024 ', CAST(N'2024-01-01' AS Date), CAST(N'2024-03-31' AS Date), N'Finalizada', 1)
INSERT [dbo].[campania] ([cam_id], [cam_nombre], [cam_fecha_inicio], [cam_fecha_fin], [cam_estado], [cam_desactivar]) VALUES (21, N'Campaña 2 2024', CAST(N'2024-05-01' AS Date), CAST(N'2024-08-31' AS Date), N'Finalizada', 1)
INSERT [dbo].[campania] ([cam_id], [cam_nombre], [cam_fecha_inicio], [cam_fecha_fin], [cam_estado], [cam_desactivar]) VALUES (22, N'Campaña 3 2024', CAST(N'2024-10-01' AS Date), CAST(N'2024-12-31' AS Date), N'Finalizada', 1)
INSERT [dbo].[campania] ([cam_id], [cam_nombre], [cam_fecha_inicio], [cam_fecha_fin], [cam_estado], [cam_desactivar]) VALUES (23, N'Campaña 1 2025', CAST(N'2025-01-02' AS Date), CAST(N'2025-03-31' AS Date), N'Activa', 1)
SET IDENTITY_INSERT [dbo].[campania] OFF
GO
SET IDENTITY_INSERT [dbo].[campania_modulo] ON 

INSERT [dbo].[campania_modulo] ([id], [cam_id], [mo_id]) VALUES (51, 20, 1)
INSERT [dbo].[campania_modulo] ([id], [cam_id], [mo_id]) VALUES (52, 20, 2)
INSERT [dbo].[campania_modulo] ([id], [cam_id], [mo_id]) VALUES (53, 20, 3)
INSERT [dbo].[campania_modulo] ([id], [cam_id], [mo_id]) VALUES (54, 21, 1)
INSERT [dbo].[campania_modulo] ([id], [cam_id], [mo_id]) VALUES (55, 21, 2)
INSERT [dbo].[campania_modulo] ([id], [cam_id], [mo_id]) VALUES (56, 21, 3)
INSERT [dbo].[campania_modulo] ([id], [cam_id], [mo_id]) VALUES (57, 22, 1)
INSERT [dbo].[campania_modulo] ([id], [cam_id], [mo_id]) VALUES (58, 22, 2)
INSERT [dbo].[campania_modulo] ([id], [cam_id], [mo_id]) VALUES (59, 22, 3)
INSERT [dbo].[campania_modulo] ([id], [cam_id], [mo_id]) VALUES (60, 23, 1)
INSERT [dbo].[campania_modulo] ([id], [cam_id], [mo_id]) VALUES (61, 23, 2)
INSERT [dbo].[campania_modulo] ([id], [cam_id], [mo_id]) VALUES (62, 23, 3)
SET IDENTITY_INSERT [dbo].[campania_modulo] OFF
GO
SET IDENTITY_INSERT [dbo].[detalle_actividad] ON 

INSERT [dbo].[detalle_actividad] ([de_id], [ac_id], [de_contenido], [de_estado], [de_plantilla]) VALUES (1, 1, N'{ "titulo": "¿Qué es una contraseña segura?", "subtitulo": "", "parrafos": [ { "titulo":"", "parrafo": "Imagina que tienes un diario secreto donde escribes tus pensamientos más importantes. Para evitar que alguien lo lea, pones un candado con una clave que solo tú conoces. Esa clave es como una contraseña. Pero, ¿qué pasaría si alguien adivina tu clave fácilmente? ¡Podrían leer tu diario!", "orden": "1" }, { "titulo":"", "parrafo": "Por eso, es importante tener una contraseña segura. Una contraseña segura es una clave que nadie más puede adivinar fácilmente. Para que sea segura, debe cumplir algunas reglas:", "orden": "2" }, { "titulo":"", "parrafo": "Por ejemplo, una mala contraseña sería: 123456 o password, porque son fáciles de adivinar. Una buena contraseña sería algo como <strong>C0ntr@s3ñA_2024</strong>, porque es difícil de adivinar y cumple las reglas.", "orden": "3" } ], "lista": [ { "descripcion": "Debe ser larga: Entre más larga, mejor. Al menos 8 letras, números y símbolos es lo recomendado.", "orden": "1", "tipo": "numerica", "parrafo": "2" }, { "descripcion": "Usa diferentes tipos de caracteres: No uses solo letras. Mezcla letras mayúsculas, minúsculas, números y símbolos como: @, #, $, %.", "orden": "2", "tipo": "numerica", "parrafo": "2" }, { "descripcion": "No uses información obvia: No uses tu nombre, fecha de cumpleaños, o algo que otros puedan adivinar.", "orden": "3", "tipo": "numerica", "parrafo": "2" }, { "descripcion": "Cámbiala con regularidad: Aunque tengas una contraseña buena, es importante cambiarla cada cierto tiempo para que siga siendo segura.", "orden": "4", "tipo": "numerica", "parrafo": "2" } ], "imagenes": [ { "imegen": "https://img.freepik.com/vector-premium/contrasena-no-segura-demasiado-facil-recordar-baja-proteccion-vs-codigo-contrasena-segura-seguridad-fuerte_692379-78.jpg", "orden": "1", "descripcion": "Contraseña segura" } ] }', 1, N'1         ')
INSERT [dbo].[detalle_actividad] ([de_id], [ac_id], [de_contenido], [de_estado], [de_plantilla]) VALUES (2, 2, N'{ "titulo": "¿Como crear tu contraseña segura?", "subtitulo": "", "parrafos": [ { "titulo": "", "parrafo": "1. Pensar una frase o palabras que tengan al menos 8 carácteres", "orden": "1" }, { "titulo": "", "parrafo": "2. Alternar mayusculas y minúsculas", "orden": "2" }, { "titulo": "", "parrafo": "3. Sustituir letras por números", "orden": "3" }, { "titulo": "", "parrafo": "4. Añadir caracteres espaciales", "orden": "4" }, { "titulo": "Personalizar para cada cuenta", "parrafo": "Podrias usar dos letras de cada servicio Ej:Facebook(FK,FA,FB), Instagram(IG,IM,IN)..", "orden": "5" } ], "lista": [], "imagenes": [ { "imegen": "assets/icon/contraseniasegurauno.jpg", "orden": "1", "descripcion": "Contraseña segura" }, { "imegen": "assets/icon/contraseniasegurados.jpg", "orden": "2", "descripcion": "Contraseña segura" }, { "imegen": "assets/icon/contraseniaseguratres.jpg", "orden": "3", "descripcion": "Contraseña segura" }, { "imegen": "assets/icon/contraseniaseguracuatro.jpg", "orden": "4", "descripcion": "Contraseña segura" }, { "imegen": "assets/icon/contraseniaseguracinco.jpg", "orden": "5", "descripcion": "Contraseña segura" } ] }', 1, N'1         ')
INSERT [dbo].[detalle_actividad] ([de_id], [ac_id], [de_contenido], [de_estado], [de_plantilla]) VALUES (3, 5, N'{ "titulo": "¿Qué es el Phishing?", "subtitulo": "", "parrafos": [ { "titulo":"", "parrafo": "El phishing es como una trampa que alguien pone para engañarte y robarte información importante, como tus contraseñas, números de tarjeta de crédito o datos personales. Es como si un ladrón se disfrazara de cartero y te diera una carta falsa para que tú mismo le entregues tus cosas.", "orden": "1" }, { "titulo":"¿Cómo funciona el Phishing?", "parrafo": "", "orden": "2" }, { "titulo":"Ejemplo", "parrafo": "Por ejemplo, es como si alguien disfrazado de tu maestro te dijera que le entregues tu cuaderno de tareas, pero en realidad no es tu maestro, solo quiere robar tus cosas.", "orden": "3" } ], "lista": [ { "descripcion": "Un mensaje falso: Imagina que recibes un correo o mensaje que parece ser de tu banco, una tienda o una red social que usas. Te piden que hagas clic en un enlace o que compartas información importante.", "orden": "1", "tipo": "numerica", "parrafo": "2" }, { "descripcion": "Una página falsa: Si haces clic, te llevan a una página que se ve como la real, pero en realidad es una copia falsa.", "orden": "2", "tipo": "numerica", "parrafo": "2" }, { "descripcion": " Cuando escribes tus datos, los ladrones los guardan para usarlos sin tu permiso.", "orden": "3", "tipo": "numerica", "parrafo": "2" } ], "imagenes": [ { "imegen": "https://www.hostingplus.pe/wp-content/uploads/2023/12/que-es-phishing-pharming.jpg", "orden": "1", "descripcion": "Phishing" } ] }', 1, N'1         ')
INSERT [dbo].[detalle_actividad] ([de_id], [ac_id], [de_contenido], [de_estado], [de_plantilla]) VALUES (4, 6, N'{ "titulo": "¿Cómo reconocer el Phishing?", "subtitulo": "", "parrafos": [ { "titulo": "", "parrafo": "<b>1. Correos sospechosos:</b> Un mensaje que te dice ¡Tu cuenta será eliminada si no haces clic aquí ahora! suele ser falso.", "orden": "1" }, { "titulo": "", "parrafo": "<b>2. Faltas de ortografía:</b> Si ves errores en el mensaje, probablemente no sea de una empresa real.", "orden": "2" }, { "titulo": "", "parrafo": "<b>3. Enlaces raros:</b> Si pasas el cursor sobre un enlace y no se parece al sitio oficial, no lo abras.", "orden": "3" }, { "titulo": "", "parrafo": "<b>4. Piden datos personales:</b> Ningún banco o empresa legítima te pedirá tu contraseña o número de tarjeta en un mensaje.", "orden": "4" }, { "titulo": "¿Cómo protegerte?", "parrafo": "<b>1.</b> No hagas clic en enlaces sospechosos. <br/><b>2.</b> Revisa siempre el remitente del correo o mensaje.</br><b>3.</b> Activa el doble factor de autenticación en tus cuentas.</br><b>4.</b> Si tienes dudas, llama directamente a la empresa antes de dar cualquier dato.", "orden": "5" } ], "lista": [], "imagenes": [ { "imegen": "assets/icon/pishinguno.jpg", "orden": "1", "descripcion": "Phishing" }, { "imegen": "assets/icon/pishingdos.jpg", "orden": "2", "descripcion": "Phishing" }, { "imegen": "assets/icon/pishingtres.jpg", "orden": "3", "descripcion": "Phishing" }, { "imegen": "assets/icon/pishingcuatro.jpg", "orden": "4", "descripcion": "Phishing" }, { "imegen": "assets/icon/pishingcinco.jpg", "orden": "5", "descripcion": "Phishing" } ] }', 1, N'2         ')
INSERT [dbo].[detalle_actividad] ([de_id], [ac_id], [de_contenido], [de_estado], [de_plantilla]) VALUES (5, 9, N'{ "titulo": "¿Qué es la seguridad en redes?", "subtitulo": "", "parrafos": [ { "titulo":"", "parrafo": "Imagina que tienes una casa con puertas, ventanas y un montón de cosas importantes adentro, como tus juguetes, ropa o libros favoritos. Para proteger tu casa, necesitas cerraduras en las puertas y ventanas. Ahora piensa que tu casa es como tu computadora o tu teléfono, y las puertas y ventanas son los caminos que usas para conectarte a internet: Wi-Fi, redes sociales, o sitios web.", "orden": "1" }, { "titulo":"", "parrafo": "La seguridad en redes es como poner cerraduras y alarmas a esas puertas para que nadie extraño entre y robe tus cosas o haga algo malo.", "orden": "2" }, { "titulo":"¿Por qué es importante proteger las redes?", "parrafo": "Cuando te conectas a internet, viajan muchos mensajes, fotos, videos y datos de un lado a otro. Si no cuidas tu red, alguien malo, llamado hacker, podría:", "orden": "3" }, { "titulo":"", "parrafo": "<b>Por eso es muy importante poner candados digitales para que solo las personas correctas puedan usar tu red.</b>", "orden": "4" } ], "lista": [ { "descripcion": "Leer tus mensajes privados.", "orden": "1", "tipo": "numerica", "parrafo": "3" }, { "descripcion": "Robar tus contraseñas.", "orden": "2", "tipo": "numerica", "parrafo": "3" }, { "descripcion": "Usar tu red para hacer cosas malas sin que lo sepas.", "orden": "3", "tipo": "numerica", "parrafo": "3" } ], "imagenes": [ { "imegen": "https://media.kasperskydaily.com/wp-content/uploads/sites/88/2014/12/05223339/wifi.png", "orden": "1", "descripcion": "Phishing" } ] }', 1, N'1         ')
INSERT [dbo].[detalle_actividad] ([de_id], [ac_id], [de_contenido], [de_estado], [de_plantilla]) VALUES (6, 10, N'{ "titulo": "Reglas básicas para proteger una red", "subtitulo": "", "parrafos": [ { "titulo": "", "parrafo": "<b>1. Pon una contraseña fuerte a tu Wi-Fi.</b> Usa una combinación de letras, números y símbolos, como <b>MiC4s4_2024.-</b>", "orden": "1" }, { "titulo": "", "parrafo": "<b>2. No compartas tu contraseña.</b>", "orden": "2" }, { "titulo": "", "parrafo": "<b>3. Actualiza tus dispositivos.</b> A veces, los aparatos como tu computadora o tu teléfono necesitan mejoras para tapar</br>huecos que podrían ser peligrosos.", "orden": "3" }, { "titulo": "", "parrafo": "<b>4. Evita conectarte a Wi-Fi público sin cuidado. </b> Por ejemplo, en cafeterías o parques, alguien podría estar mirando todo</br>lo que haces si la red no es segura.", "orden": "4" }, { "titulo": "Dato curioso", "parrafo": "¿Sabías que cada vez que envías un mensaje, viaja como una especie de carta digital?</br>Si no está protegida, es como mandar una carta sin sobre, ¡cualquiera podría leerla!", "orden": "5" } ], "lista": [], "imagenes": [ { "imegen": "assets/icon/redsegurauno.jpg", "orden": "1", "descripcion": "Red segura" }, { "imegen": "assets/icon/redsegurados.jpg", "orden": "2", "descripcion": "Red segura" }, { "imegen": "assets/icon/redseguratres.jpg", "orden": "3", "descripcion": "Red segura" }, { "imegen": "assets/icon/redseguracuatro.jpg", "orden": "4", "descripcion": "Red segura" }, { "imegen": "assets/icon/redseguracinco.jpg", "orden": "5", "descripcion": "Red segura" } ] }', 1, N'2         ')
INSERT [dbo].[detalle_actividad] ([de_id], [ac_id], [de_contenido], [de_estado], [de_plantilla]) VALUES (7, 3, NULL, 1, N'1         ')
INSERT [dbo].[detalle_actividad] ([de_id], [ac_id], [de_contenido], [de_estado], [de_plantilla]) VALUES (8, 7, NULL, 1, N'1         ')
INSERT [dbo].[detalle_actividad] ([de_id], [ac_id], [de_contenido], [de_estado], [de_plantilla]) VALUES (9, 11, NULL, 1, N'1         ')
SET IDENTITY_INSERT [dbo].[detalle_actividad] OFF
GO
SET IDENTITY_INSERT [dbo].[detalle_progreso_evaluacion] ON 

INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (51, 459, 2, 1, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (52, 459, 3, 7, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (53, 459, 4, 9, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (54, 459, 5, 15, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (55, 459, 6, 20, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (56, 459, 7, 22, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (57, 459, 8, 26, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (58, 459, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (59, 459, 10, 35, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (60, 459, 11, 39, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (61, 463, 12, 44, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (62, 463, 13, 48, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (63, 463, 14, 51, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (64, 463, 15, 55, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (65, 463, 16, 58, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (66, 463, 17, 62, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (67, 463, 18, 67, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (68, 463, 19, 70, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (69, 463, 20, 73, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (70, 463, 21, 78, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (71, 467, 22, 82, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (72, 467, 23, 86, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (73, 467, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (74, 467, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (75, 467, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (76, 467, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (77, 467, 28, 108, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (78, 467, 29, 111, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (79, 467, 30, 115, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (80, 467, 31, 120, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (81, 471, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (82, 471, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (83, 471, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (84, 471, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (85, 471, 6, 20, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (86, 471, 7, 24, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (87, 471, 8, 25, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (88, 471, 9, 30, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (89, 471, 10, 36, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (90, 471, 11, 39, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (91, 475, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (92, 475, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (93, 475, 14, 52, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (94, 475, 15, 55, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (95, 475, 16, 58, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (96, 475, 17, 62, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (97, 475, 18, 67, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (98, 475, 19, 71, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (99, 475, 20, 75, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (100, 475, 21, 77, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (101, 479, 22, 81, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (102, 479, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (103, 479, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (104, 479, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (105, 479, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (106, 479, 27, 101, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (107, 479, 28, 107, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (108, 479, 29, 111, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (109, 479, 30, 115, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (110, 479, 31, 120, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (111, 483, 2, 1, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (112, 483, 3, 6, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (113, 483, 4, 11, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (114, 483, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (115, 483, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (116, 483, 7, 22, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (117, 483, 8, 25, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (118, 483, 9, 31, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (119, 483, 10, 33, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (120, 483, 11, 39, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (121, 487, 12, 42, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (122, 487, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (123, 487, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (124, 487, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (125, 487, 16, 58, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (126, 487, 17, 62, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (127, 487, 18, 67, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (128, 487, 19, 70, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (129, 487, 20, 74, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (130, 487, 21, 79, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (131, 491, 22, 83, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (132, 491, 23, 86, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (133, 491, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (134, 491, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (135, 491, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (136, 491, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (137, 491, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (138, 491, 29, 112, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (139, 491, 30, 115, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (140, 491, 31, 119, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (141, 495, 2, 3, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (142, 495, 3, 8, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (143, 495, 4, 9, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (144, 495, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (145, 495, 6, 20, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (146, 495, 7, 23, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (147, 495, 8, 26, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (148, 495, 9, 31, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (149, 495, 10, 36, N'I')
GO
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (150, 495, 11, 39, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (151, 499, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (152, 499, 13, 46, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (153, 499, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (154, 499, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (155, 499, 16, 57, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (156, 499, 17, 61, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (157, 499, 18, 67, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (158, 499, 19, 72, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (159, 499, 20, 76, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (160, 499, 21, 80, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (161, 503, 22, 81, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (162, 503, 23, 86, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (163, 503, 24, 92, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (164, 503, 25, 96, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (165, 503, 26, 100, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (166, 503, 27, 103, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (167, 503, 28, 108, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (168, 503, 29, 112, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (169, 503, 30, 116, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (170, 503, 31, 120, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (171, 507, 2, 4, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (172, 507, 3, 8, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (173, 507, 4, 12, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (174, 507, 5, 16, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (175, 507, 6, 20, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (176, 507, 7, 24, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (177, 507, 8, 28, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (178, 507, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (179, 507, 10, 36, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (180, 507, 11, 40, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (181, 511, 12, 44, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (182, 511, 13, 48, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (183, 511, 14, 52, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (184, 511, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (185, 511, 16, 60, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (186, 511, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (187, 511, 18, 68, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (188, 511, 19, 72, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (189, 511, 20, 76, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (190, 511, 21, 80, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (191, 515, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (192, 515, 23, 88, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (193, 515, 24, 92, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (194, 515, 25, 96, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (195, 515, 26, 100, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (196, 515, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (197, 515, 28, 108, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (198, 515, 29, 112, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (199, 515, 30, 116, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (200, 515, 31, 120, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (201, 519, 2, 3, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (202, 519, 3, 7, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (203, 519, 4, 11, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (204, 519, 5, 15, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (205, 519, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (206, 519, 7, 23, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (207, 519, 8, 27, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (208, 519, 9, 31, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (209, 519, 10, 35, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (210, 519, 11, 39, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (211, 523, 12, 43, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (212, 523, 13, 47, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (213, 523, 14, 51, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (214, 523, 15, 55, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (215, 523, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (216, 523, 17, 63, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (217, 523, 18, 67, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (218, 523, 19, 71, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (219, 523, 20, 75, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (220, 523, 21, 79, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (221, 527, 22, 83, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (222, 527, 23, 87, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (223, 527, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (224, 527, 25, 95, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (225, 527, 26, 99, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (226, 527, 27, 103, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (227, 527, 28, 107, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (228, 527, 29, 111, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (229, 527, 30, 115, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (230, 527, 31, 119, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (231, 531, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (232, 531, 3, 6, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (233, 531, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (234, 531, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (235, 531, 6, 18, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (236, 531, 7, 22, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (237, 531, 8, 26, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (238, 531, 9, 30, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (239, 531, 10, 34, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (240, 531, 11, 38, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (241, 535, 12, 42, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (242, 535, 13, 46, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (243, 535, 14, 50, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (244, 535, 15, 54, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (245, 535, 16, 58, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (246, 535, 17, 62, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (247, 535, 18, 66, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (248, 535, 19, 70, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (249, 535, 20, 74, N'I')
GO
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (250, 535, 21, 78, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (251, 539, 22, 82, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (252, 539, 23, 86, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (253, 539, 24, 90, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (254, 539, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (255, 539, 26, 98, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (256, 539, 27, 102, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (257, 539, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (258, 539, 29, 110, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (259, 539, 30, 114, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (260, 539, 31, 118, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (261, 543, 2, 1, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (262, 543, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (263, 543, 4, 9, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (264, 543, 5, 13, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (265, 543, 6, 17, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (266, 543, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (267, 543, 8, 25, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (268, 543, 9, 29, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (269, 543, 10, 33, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (270, 543, 11, 37, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (271, 547, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (272, 547, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (273, 547, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (274, 547, 15, 53, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (275, 547, 16, 57, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (276, 547, 17, 61, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (277, 547, 18, 65, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (278, 547, 19, 69, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (279, 547, 20, 73, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (280, 547, 21, 77, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (281, 551, 22, 81, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (282, 551, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (283, 551, 24, 89, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (284, 551, 25, 93, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (285, 551, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (286, 551, 27, 101, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (287, 551, 28, 105, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (288, 551, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (289, 551, 30, 113, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (290, 551, 31, 117, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (291, 555, 2, 4, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (292, 555, 3, 8, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (293, 555, 4, 12, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (294, 555, 5, 16, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (295, 555, 6, 20, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (296, 555, 7, 24, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (297, 555, 8, 28, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (298, 555, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (299, 555, 10, 36, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (300, 555, 11, 40, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (301, 567, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (302, 567, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (303, 567, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (304, 567, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (305, 567, 6, 20, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (306, 567, 7, 24, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (307, 567, 8, 27, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (308, 567, 9, 31, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (309, 567, 10, 33, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (310, 567, 11, 37, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (311, 571, 12, 44, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (312, 571, 13, 48, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (313, 571, 14, 52, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (314, 571, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (315, 571, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (316, 571, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (317, 571, 18, 66, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (318, 571, 19, 72, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (319, 571, 20, 76, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (320, 571, 21, 80, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (321, 575, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (322, 575, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (323, 575, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (324, 575, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (325, 575, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (326, 575, 27, 103, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (327, 575, 28, 108, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (328, 575, 29, 112, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (329, 575, 30, 116, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (330, 575, 31, 120, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (331, 579, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (332, 579, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (333, 579, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (334, 579, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (335, 579, 6, 20, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (336, 579, 7, 24, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (337, 579, 8, 27, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (338, 579, 9, 31, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (339, 579, 10, 36, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (340, 579, 11, 37, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (341, 583, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (342, 583, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (343, 583, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (344, 583, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (345, 583, 16, 58, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (346, 583, 17, 63, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (347, 583, 18, 67, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (348, 583, 19, 71, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (349, 583, 20, 75, N'I')
GO
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (350, 583, 21, 79, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (351, 587, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (352, 587, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (353, 587, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (354, 587, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (355, 587, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (356, 587, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (357, 587, 28, 108, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (358, 587, 29, 112, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (359, 587, 30, 116, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (360, 587, 31, 120, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (361, 591, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (362, 591, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (363, 591, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (364, 591, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (365, 591, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (366, 591, 7, 24, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (367, 591, 8, 28, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (368, 591, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (369, 591, 10, 36, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (370, 591, 11, 39, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (371, 595, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (372, 595, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (373, 595, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (374, 595, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (375, 595, 16, 57, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (376, 595, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (377, 595, 18, 67, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (378, 595, 19, 71, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (379, 595, 20, 76, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (380, 595, 21, 80, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (381, 599, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (382, 599, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (383, 599, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (384, 599, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (385, 599, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (386, 599, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (387, 599, 28, 108, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (388, 599, 29, 112, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (389, 599, 30, 116, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (390, 599, 31, 120, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (391, 603, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (392, 603, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (393, 603, 4, 12, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (394, 603, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (395, 603, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (396, 603, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (397, 603, 8, 27, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (398, 603, 9, 31, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (399, 603, 10, 33, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (400, 603, 11, 37, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (401, 607, 12, 44, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (402, 607, 13, 48, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (403, 607, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (404, 607, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (405, 607, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (406, 607, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (407, 607, 18, 66, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (408, 607, 19, 72, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (409, 607, 20, 76, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (410, 607, 21, 80, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (411, 611, 22, 83, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (412, 611, 23, 87, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (413, 611, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (414, 611, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (415, 611, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (416, 611, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (417, 611, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (418, 611, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (419, 611, 30, 115, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (420, 611, 31, 120, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (421, 615, 2, 4, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (422, 615, 3, 7, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (423, 615, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (424, 615, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (425, 615, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (426, 615, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (427, 615, 8, 26, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (428, 615, 9, 31, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (429, 615, 10, 35, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (430, 615, 11, 39, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (431, 619, 12, 42, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (432, 619, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (433, 619, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (434, 619, 15, 54, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (435, 619, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (436, 619, 17, 62, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (437, 619, 18, 66, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (438, 619, 19, 70, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (439, 619, 20, 74, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (440, 619, 21, 78, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (441, 623, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (442, 623, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (443, 623, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (444, 623, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (445, 623, 26, 100, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (446, 623, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (447, 623, 28, 108, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (448, 623, 29, 112, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (449, 623, 30, 116, N'I')
GO
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (450, 623, 31, 120, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (451, 627, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (452, 627, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (453, 627, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (454, 627, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (455, 627, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (456, 627, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (457, 627, 8, 28, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (458, 627, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (459, 627, 10, 36, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (460, 627, 11, 40, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (461, 631, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (462, 631, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (463, 631, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (464, 631, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (465, 631, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (466, 631, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (467, 631, 18, 68, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (468, 631, 19, 72, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (469, 631, 20, 76, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (470, 631, 21, 80, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (471, 635, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (472, 635, 23, 88, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (473, 635, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (474, 635, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (475, 635, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (476, 635, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (477, 635, 28, 108, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (478, 635, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (479, 635, 30, 114, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (480, 635, 31, 120, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (481, 639, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (482, 639, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (483, 639, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (484, 639, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (485, 639, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (486, 639, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (487, 639, 8, 25, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (488, 639, 9, 30, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (489, 639, 10, 33, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (490, 639, 11, 40, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (491, 643, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (492, 643, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (493, 643, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (494, 643, 15, 55, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (495, 643, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (496, 643, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (497, 643, 18, 68, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (498, 643, 19, 72, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (499, 643, 20, 76, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (500, 643, 21, 80, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (501, 647, 22, 82, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (502, 647, 23, 86, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (503, 647, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (504, 647, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (505, 647, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (506, 647, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (507, 647, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (508, 647, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (509, 647, 30, 113, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (510, 647, 31, 117, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (511, 651, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (512, 651, 3, 6, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (513, 651, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (514, 651, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (515, 651, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (516, 651, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (517, 651, 8, 25, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (518, 651, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (519, 651, 10, 36, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (520, 651, 11, 40, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (521, 655, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (522, 655, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (523, 655, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (524, 655, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (525, 655, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (526, 655, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (527, 655, 18, 68, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (528, 655, 19, 72, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (529, 655, 20, 74, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (530, 655, 21, 77, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (531, 659, 22, 83, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (532, 659, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (533, 659, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (534, 659, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (535, 659, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (536, 659, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (537, 659, 28, 108, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (538, 659, 29, 110, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (539, 659, 30, 115, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (540, 659, 31, 119, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (541, 663, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (542, 663, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (543, 663, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (544, 663, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (545, 663, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (546, 663, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (547, 663, 8, 25, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (548, 663, 9, 29, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (549, 663, 10, 33, N'I')
GO
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (550, 663, 11, 37, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (551, 667, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (552, 667, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (553, 667, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (554, 667, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (555, 667, 16, 57, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (556, 667, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (557, 667, 18, 67, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (558, 667, 19, 71, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (559, 667, 20, 75, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (560, 667, 21, 78, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (561, 671, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (562, 671, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (563, 671, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (564, 671, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (565, 671, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (566, 671, 27, 103, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (567, 671, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (568, 671, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (569, 671, 30, 114, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (570, 671, 31, 119, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (571, 675, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (572, 675, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (573, 675, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (574, 675, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (575, 675, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (576, 675, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (577, 675, 8, 26, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (578, 675, 9, 30, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (579, 675, 10, 35, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (580, 675, 11, 40, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (581, 679, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (582, 679, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (583, 679, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (584, 679, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (585, 679, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (586, 679, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (587, 679, 18, 66, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (588, 679, 19, 69, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (589, 679, 20, 73, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (590, 679, 21, 80, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (591, 683, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (592, 683, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (593, 683, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (594, 683, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (595, 683, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (596, 683, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (597, 683, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (598, 683, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (599, 683, 30, 113, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (600, 683, 31, 118, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (601, 687, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (602, 687, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (603, 687, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (604, 687, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (605, 687, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (606, 687, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (607, 687, 8, 26, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (608, 687, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (609, 687, 10, 36, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (610, 687, 11, 40, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (611, 691, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (612, 691, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (613, 691, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (614, 691, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (615, 691, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (616, 691, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (617, 691, 18, 66, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (618, 691, 19, 69, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (619, 691, 20, 73, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (620, 691, 21, 80, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (621, 695, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (622, 695, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (623, 695, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (624, 695, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (625, 695, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (626, 695, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (627, 695, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (628, 695, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (629, 695, 30, 114, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (630, 695, 31, 120, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (631, 699, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (632, 699, 3, 7, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (633, 699, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (634, 699, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (635, 699, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (636, 699, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (637, 699, 8, 26, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (638, 699, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (639, 699, 10, 35, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (640, 699, 11, 39, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (641, 703, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (642, 703, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (643, 703, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (644, 703, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (645, 703, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (646, 703, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (647, 703, 18, 66, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (648, 703, 19, 69, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (649, 703, 20, 74, N'I')
GO
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (650, 703, 21, 78, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (651, 707, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (652, 707, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (653, 707, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (654, 707, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (655, 707, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (656, 707, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (657, 707, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (658, 707, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (659, 707, 30, 114, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (660, 707, 31, 120, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (661, 711, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (662, 711, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (663, 711, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (664, 711, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (665, 711, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (666, 711, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (667, 711, 8, 26, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (668, 711, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (669, 711, 10, 35, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (670, 711, 11, 39, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (671, 715, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (672, 715, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (673, 715, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (674, 715, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (675, 715, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (676, 715, 17, 61, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (677, 715, 18, 66, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (678, 715, 19, 69, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (679, 715, 20, 73, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (680, 715, 21, 78, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (681, 719, 22, 83, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (682, 719, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (683, 719, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (684, 719, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (685, 719, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (686, 719, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (687, 719, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (688, 719, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (689, 719, 30, 114, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (690, 719, 31, 118, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (691, 723, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (692, 723, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (693, 723, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (694, 723, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (695, 723, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (696, 723, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (697, 723, 8, 26, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (698, 723, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (699, 723, 10, 35, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (700, 723, 11, 39, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (701, 731, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (702, 731, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (703, 731, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (704, 731, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (705, 731, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (706, 731, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (707, 731, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (708, 731, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (709, 731, 30, 114, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (710, 731, 31, 119, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (711, 727, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (712, 727, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (713, 727, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (714, 727, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (715, 727, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (716, 727, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (717, 727, 18, 66, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (718, 727, 19, 69, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (719, 727, 20, 73, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (720, 727, 21, 77, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (721, 735, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (722, 735, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (723, 735, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (724, 735, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (725, 735, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (726, 735, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (727, 735, 8, 26, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (728, 735, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (729, 735, 10, 35, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (730, 735, 11, 37, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (731, 739, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (732, 739, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (733, 739, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (734, 739, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (735, 739, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (736, 739, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (737, 739, 18, 68, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (738, 739, 19, 69, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (739, 739, 20, 73, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (740, 739, 21, 78, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (741, 743, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (742, 743, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (743, 743, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (744, 743, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (745, 743, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (746, 743, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (747, 743, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (748, 743, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (749, 743, 30, 114, N'C')
GO
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (750, 743, 31, 117, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (751, 747, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (752, 747, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (753, 747, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (754, 747, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (755, 747, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (756, 747, 7, 23, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (757, 747, 8, 26, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (758, 747, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (759, 747, 10, 35, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (760, 747, 11, 40, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (761, 751, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (762, 751, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (763, 751, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (764, 751, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (765, 751, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (766, 751, 17, 63, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (767, 751, 18, 67, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (768, 751, 19, 69, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (769, 751, 20, 73, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (770, 751, 21, 78, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (771, 755, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (772, 755, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (773, 755, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (774, 755, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (775, 755, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (776, 755, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (777, 755, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (778, 755, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (779, 755, 30, 114, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (780, 755, 31, 118, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (781, 759, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (782, 759, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (783, 759, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (784, 759, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (785, 759, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (786, 759, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (787, 759, 8, 27, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (788, 759, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (789, 759, 10, 35, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (790, 759, 11, 40, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (791, 763, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (792, 763, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (793, 763, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (794, 763, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (795, 763, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (796, 763, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (797, 763, 18, 66, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (798, 763, 19, 69, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (799, 763, 20, 73, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (800, 763, 21, 77, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (801, 767, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (802, 767, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (803, 767, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (804, 767, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (805, 767, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (806, 767, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (807, 767, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (808, 767, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (809, 767, 30, 114, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (810, 767, 31, 118, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (811, 771, 2, 3, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (812, 771, 3, 7, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (813, 771, 4, 11, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (814, 771, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (815, 771, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (816, 771, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (817, 771, 8, 26, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (818, 771, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (819, 771, 10, 35, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (820, 771, 11, 40, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (821, 775, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (822, 775, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (823, 775, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (824, 775, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (825, 775, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (826, 775, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (827, 775, 18, 66, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (828, 775, 19, 69, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (829, 775, 20, 74, N'I')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (830, 775, 21, 78, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (831, 779, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (832, 779, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (833, 779, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (834, 779, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (835, 779, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (836, 779, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (837, 779, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (838, 779, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (839, 779, 30, 114, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (840, 779, 31, 118, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (841, 783, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (842, 783, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (843, 783, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (844, 783, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (845, 783, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (846, 783, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (847, 783, 8, 26, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (848, 783, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (849, 783, 10, 35, N'C')
GO
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (850, 783, 11, 40, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (851, 787, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (852, 787, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (853, 787, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (854, 787, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (855, 787, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (856, 787, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (857, 787, 18, 66, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (858, 787, 19, 69, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (859, 787, 20, 73, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (860, 787, 21, 78, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (861, 791, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (862, 791, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (863, 791, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (864, 791, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (865, 791, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (866, 791, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (867, 791, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (868, 791, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (869, 791, 30, 114, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (870, 791, 31, 118, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (871, 795, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (872, 795, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (873, 795, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (874, 795, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (875, 795, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (876, 795, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (877, 795, 8, 26, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (878, 795, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (879, 795, 10, 35, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (880, 795, 11, 40, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (881, 799, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (882, 799, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (883, 799, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (884, 799, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (885, 799, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (886, 799, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (887, 799, 18, 66, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (888, 799, 19, 69, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (889, 799, 20, 73, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (890, 799, 21, 78, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (891, 803, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (892, 803, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (893, 803, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (894, 803, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (895, 803, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (896, 803, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (897, 803, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (898, 803, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (899, 803, 30, 114, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (900, 803, 31, 118, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (901, 807, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (902, 807, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (903, 807, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (904, 807, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (905, 807, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (906, 807, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (907, 807, 8, 26, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (908, 807, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (909, 807, 10, 35, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (910, 807, 11, 40, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (911, 811, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (912, 811, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (913, 811, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (914, 811, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (915, 811, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (916, 811, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (917, 811, 18, 66, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (918, 811, 19, 69, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (919, 811, 20, 73, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (920, 811, 21, 78, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (921, 815, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (922, 815, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (923, 815, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (924, 815, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (925, 815, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (926, 815, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (927, 815, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (928, 815, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (929, 815, 30, 114, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (930, 815, 31, 118, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (931, 819, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (932, 819, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (933, 819, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (934, 819, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (935, 819, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (936, 819, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (937, 819, 8, 26, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (938, 819, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (939, 819, 10, 35, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (940, 819, 11, 40, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (941, 823, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (942, 823, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (943, 823, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (944, 823, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (945, 823, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (946, 823, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (947, 823, 18, 66, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (948, 823, 19, 69, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (949, 823, 20, 73, N'C')
GO
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (950, 823, 21, 78, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (951, 827, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (952, 827, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (953, 827, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (954, 827, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (955, 827, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (956, 827, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (957, 827, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (958, 827, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (959, 827, 30, 114, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (960, 827, 31, 118, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (961, 843, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (962, 843, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (963, 843, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (964, 843, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (965, 843, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (966, 843, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (967, 843, 8, 26, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (968, 843, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (969, 843, 10, 35, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (970, 843, 11, 40, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (971, 847, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (972, 847, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (973, 847, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (974, 847, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (975, 847, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (976, 847, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (977, 847, 18, 66, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (978, 847, 19, 69, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (979, 847, 20, 73, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (980, 847, 21, 78, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (981, 851, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (982, 851, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (983, 851, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (984, 851, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (985, 851, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (986, 851, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (987, 851, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (988, 851, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (989, 851, 30, 114, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (990, 851, 31, 118, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (991, 867, 2, 2, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (992, 867, 3, 5, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (993, 867, 4, 10, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (994, 867, 5, 14, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (995, 867, 6, 19, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (996, 867, 7, 21, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (997, 867, 8, 26, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (998, 867, 9, 32, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (999, 867, 10, 35, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1000, 867, 11, 40, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1001, 871, 12, 41, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1002, 871, 13, 45, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1003, 871, 14, 49, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1004, 871, 15, 56, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1005, 871, 16, 59, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1006, 871, 17, 64, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1007, 871, 18, 66, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1008, 871, 19, 69, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1009, 871, 20, 73, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1010, 871, 21, 78, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1011, 875, 22, 84, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1012, 875, 23, 85, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1013, 875, 24, 91, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1014, 875, 25, 94, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1015, 875, 26, 97, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1016, 875, 27, 104, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1017, 875, 28, 106, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1018, 875, 29, 109, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1019, 875, 30, 114, N'C')
INSERT [dbo].[detalle_progreso_evaluacion] ([dp_id], [pro_id], [pre_id], [resp_id], [dp_estado]) VALUES (1020, 875, 31, 118, N'C')
SET IDENTITY_INSERT [dbo].[detalle_progreso_evaluacion] OFF
GO
SET IDENTITY_INSERT [dbo].[evaluacion] ON 

INSERT [dbo].[evaluacion] ([eva_id], [de_id], [eva_estado], [eva_fecha_creacion]) VALUES (1, 7, 1, CAST(N'2024-11-25T10:45:32.430' AS DateTime))
INSERT [dbo].[evaluacion] ([eva_id], [de_id], [eva_estado], [eva_fecha_creacion]) VALUES (2, 8, 1, CAST(N'2024-11-25T10:45:32.430' AS DateTime))
INSERT [dbo].[evaluacion] ([eva_id], [de_id], [eva_estado], [eva_fecha_creacion]) VALUES (3, 9, 1, CAST(N'2024-11-25T10:45:32.430' AS DateTime))
SET IDENTITY_INSERT [dbo].[evaluacion] OFF
GO
SET IDENTITY_INSERT [dbo].[modulo] ON 

INSERT [dbo].[modulo] ([mo_id], [mo_nombre], [mo_descripcion], [mo_estado], [mo_fecha_creacion], [mo_imagen], [mo_ruta]) VALUES (1, N'Contraseña Segura', N'Aprende a crear y gestionar contraseñas seguras, protegiendo tus cuentas de accesos no autorizados y fortaleciendo la seguridad de tu información.', 1, CAST(N'2024-09-28T22:44:11.913' AS DateTime), N'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD//gA7Q1JFQVRPUjogZ2QtanBlZyB2MS4wICh1c2luZyBJSkcgSlBFRyB2NjIpLCBxdWFsaXR5ID0gODIK/9sAQwAGBAQFBAQGBQUFBgYGBwkOCQkICAkSDQ0KDhUSFhYVEhQUFxohHBcYHxkUFB0nHR8iIyUlJRYcKSwoJCshJCUk/9sAQwEGBgYJCAkRCQkRJBgUGCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQkJCQk/8AAEQgBdwH0AwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A9gooor6k+XCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiqt5qthp3/H5fWtsfSaVUP6mplOMVeTsXTpzqS5YJt+RaorBfx34ZjODrFuf90M38gab/wAJ/wCGP+gtH/36k/8Aia5/r2H/AOfi+9HoLJMxeqw8/wDwCX+R0FFc/wD8J/4Y/wCgtH/36k/+Jo/4T/wx/wBBaP8A79Sf/E0fXsN/z8X3of8AYeZf9A1T/wAAl/kdBRXP/wDCf+GP+gtH/wB+pP8A4mj/AIT/AMMf9BaP/v1J/wDE0fXsN/z8X3oP7DzL/oGqf+AS/wAjoKK5/wD4T/wx/wBBaP8A79Sf/E0f8J/4Y/6C0f8A36k/+Jo+vYb/AJ+L70H9h5l/0DVP/AJf5HQUVz//AAn/AIY/6C0f/fqT/wCJo/4T/wAMf9BaP/v1J/8AE0fXsN/z8X3oP7DzL/oGqf8AgEv8joKK5/8A4T/wx/0Fo/8Av1J/8TR/wn/hj/oLR/8AfqT/AOJo+vYb/n4vvQf2HmX/AEDVP/AJf5HQUVz/APwn/hj/AKC0f/fqT/4mj/hP/DH/AEFo/wDv1J/8TR9ew3/Pxfeg/sPMv+gap/4BL/I6Ciuf/wCE/wDDH/QWj/79Sf8AxNH/AAn/AIY/6C0f/fqT/wCJo+vYb/n4vvQf2HmX/QNU/wDAJf5HQUVz/wDwn/hj/oLR/wDfqT/4mj/hP/DH/QWj/wC/Un/xNH17Df8APxfeg/sPMv8AoGqf+AS/yOgorn/+E/8ADH/QWj/79Sf/ABNH/Cf+GP8AoLR/9+pP/iaPr2G/5+L70H9h5l/0DVP/AACX+R0FFc//AMJ/4Y/6C0f/AH6k/wDiaP8AhP8Awx/0Fo/+/Un/AMTR9ew3/Pxfeg/sPMv+gap/4BL/ACOgorn/APhP/DH/AEFo/wDv1J/8TR/wn/hj/oLR/wDfqT/4mj69hv8An4vvQf2HmX/QNU/8Al/kdBRXP/8ACf8Ahj/oLR/9+pP/AImj/hP/AAx/0Fo/+/Un/wATR9ew3/Pxfeg/sPMv+gap/wCAS/yOgorn/wDhP/DH/QWj/wC/Un/xNH/Cf+GP+gtH/wB+pP8A4mj69hv+fi+9B/YeZf8AQNU/8Al/kdBRXP8A/Cf+GP8AoLR/9+pP/iaP+E/8Mf8AQWj/AO/Un/xNH17Df8/F96D+w8y/6Bqn/gEv8joKK5//AIT/AMMf9BaP/v1J/wDE0f8ACf8Ahj/oLR/9+pP/AImj69hv+fi+9B/YeZf9A1T/AMAl/kdBRXP/APCf+GP+gtH/AN+pP/iaP+E/8Mf9BaP/AL9Sf/E0fXsN/wA/F96D+w8y/wCgap/4BL/I6Ciuf/4T/wAMf9BaP/v1J/8AE0f8J/4Y/wCgtH/36k/+Jo+vYb/n4vvQf2HmX/QNU/8AAJf5HQUVz/8Awn/hj/oLR/8AfqT/AOJo/wCE/wDDH/QWj/79Sf8AxNH17Df8/F96D+w8y/6Bqn/gEv8AI6Ciuf8A+E/8Mf8AQWj/AO/Un/xNH/Cf+GP+gtH/AN+pP/iaPr2G/wCfi+9B/YeZf9A1T/wCX+R0FFYA8feGD/zF4vxjcfzWrtp4l0W+IW21WykY9FEy7j+Gc1UcXQk7Rmn80ZVcqxtJc1SjOK84tfoaVFFFdBwBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUyeeK2heeaRY4o1LO7HAUDqSaG0ldjSbdluPrkPEfxK0vRme3swNQul4IjbEaH3bv9Bn6iuP8ZfEG41pnsdNZ7fT+VZujz/X0X2/P0HG18rmGfu7p4b7/API/WOHfD1SisRml9doLT/wJ/ovm+hv6v4617WCyyXr28R/5ZW2Y1x7kcn8TWAeSSeSepPU0VJbW1xeSiG1gluJT0SJC7H8BzXzVSrUqyvNts/UMLg8Ng6fJQgoR8kl95HRXQ2/w88XXQ3R+HdQx/tx+X/6Fip/+FX+NP+hfuf8AvtP/AIql7Gp/K/uJeZ4NOzrR/wDAl/mcvRXUf8Kv8af9C/c/99p/8VR/wq/xp/0L9z/32n/xVP2NT+V/cL+1MF/z+j/4Ev8AM5eiuo/4Vf40/wChfuf++0/+Ko/4Vf40/wChfuf++0/+Ko9jU/lf3B/amC/5/R/8CX+Zy9FdR/wq/wAaf9C/c/8Afaf/ABVH/Cr/ABp/0L9z/wB9p/8AFUexqfyv7g/tTBf8/o/+BL/M5eiuo/4Vf40/6F+5/wC+0/8AiqP+FX+NP+hfuf8AvtP/AIqj2NT+V/cH9qYL/n9H/wACX+Zy9FdR/wAKv8af9C/c/wDfaf8AxVH/AAq/xp/0L9z/AN9p/wDFUexqfyv7g/tTBf8AP6P/AIEv8zl6K6j/AIVf40/6F+5/77T/AOKo/wCFX+NP+hfuf++0/wDiqPY1P5X9wf2pgv8An9H/AMCX+Zy9FdR/wq/xp/0L9z/32n/xVH/Cr/Gn/Qv3P/faf/FUexqfyv7g/tTBf8/o/wDgS/zOXorqP+FX+NP+hfuf++0/+Ko/4Vf40/6F+5/77T/4qj2NT+V/cH9qYL/n9H/wJf5nL0V1H/Cr/Gn/AEL9z/32n/xVH/Cr/Gn/AEL9z/32n/xVHsan8r+4P7UwX/P6P/gS/wAzl6K6j/hV/jT/AKF+5/77T/4qj/hV/jT/AKF+5/77T/4qj2NT+V/cH9qYL/n9H/wJf5nL0V1H/Cr/ABp/0L9z/wB9p/8AFUf8Kv8AGn/Qv3P/AH2n/wAVR7Gp/K/uD+1MF/z+j/4Ev8zl6K6j/hV/jT/oX7n/AL7T/wCKo/4Vf40/6F+5/wC+0/8AiqPY1P5X9wf2pgv+f0f/AAJf5nL0V1H/AAq/xp/0L9z/AN9p/wDFUf8ACr/Gn/Qv3P8A32n/AMVR7Gp/K/uD+1MF/wA/o/8AgS/zOXorqP8AhV/jT/oX7n/vtP8A4qj/AIVf40/6F+5/77T/AOKo9jU/lf3B/amC/wCf0f8AwJf5nL0V1H/Cr/Gn/Qv3P/faf/FUf8Kv8af9C/c/99p/8VR7Gp/K/uD+1MF/z+j/AOBL/M5eiuo/4Vf40/6F+5/77T/4qj/hV/jT/oX7n/vtP/iqPY1P5X9wf2pgv+f0f/Al/mcvRXUf8Kv8af8AQv3P/faf/FUf8Kv8af8AQv3P/faf/FUexqfyv7g/tTBf8/o/+BL/ADOXorqP+FX+NP8AoX7n/vtP/iqP+FX+NP8AoX7n/vtP/iqPY1P5X9wf2pgv+f0f/Al/mcvRXUf8Kv8AGn/Qv3P/AH2n/wAVR/wq/wAaf9C/c/8Afaf/ABVHsan8r+4P7UwX/P6P/gS/zOXpCM100nw08YxLlvD16R/s7WP5A1jajoup6Qf+Jjp15ZjpmeFkB+hI5qXTmtWjWljcPVdqdSMn5NP8iTSvEOraKR9gv54VH8AbKf8AfJyP0ru/D/xZR2WDW7YRk8faYASP+BL1/LP0rzSiurDZhXw7/dy07dDy814by/Mk/rFNc38y0l9/X53XkfRlrdQXsCXFtNHPC4yskbZU/jUteCeHPFGoeGbnzbR90THMsDn5JP8AA+45/lXtHh/xDZeJLAXlk/TiSNvvRN6Ef1719jl2bU8WuV6S7f5H4rxLwliMnl7RPnpPaXbyl2fns/wNOiiivWPkgooooAKKKKACiiigAooooAKKKKACvIfiH4xOs3TaZZSn7BA2HZT/AK9x3/3Qenvz6V2XxH8RnRNF+zwPtu73MakHlU/ib9QPx9q8ar5XP8waf1am/X/I/V/Dzh2M/wDhUxCvZ2gvTeXy2XnfyCrGn6deatexWVhbSXNzKcJHGMk//W96SwsLrVL6CxsoWmuZ3Ecca9WJ/wA/gK+lfAXgKy8E6cEQJNqEyj7Rc45Y/wB1fRR+uMmvn8NhnWfkffZ9n1LK6W15vZfq/L8/xXIeEPgXZ2yJdeJZftc55+yQsViT/eYcsfpgfXrXp+n6ZY6Tbi30+0gtIR/BDGEH6VZor3KVGFNWij8jx+bYrHS5sRNvy6L0X9MKKKK1POCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigApHRZEZHUOjDDKwyCPcUtFAHC+KPg/wCHPECtJawjSrs5Iltl+Qn/AGo+h/DB968R8WeC9X8G3gg1KAGKQnyrmPmOX6HsfY8/hzX1RVPVtIstd0+XT9Rt0uLaUYZG/Qg9iOxHSuKvgoVFeOjPqsm4qxWCkoVm50+z3Xo/0enpufI1aXh7X7vw5qUd7ancBxLEThZU7qf6Hsa0vHngq68EawbWRmltJgXtpyPvrnkH/aGQD+B71zdeMnOjO60aP1VPD5hhuk6c196/r5pn0Ppmp22sWEN9aPvhmXcp7j1B9CDkH6Varyf4W+IjZak2jzv+4uzuiyfuygdP+BAY+oHrXrFfoGW4xYqip9dn6n87cSZLLKcdLDPWO8X3T/VbPzQUUUV3nghRRRQAUUUUAFFFFABRRUF/dCxsri7IyIInlP8AwEZ/pSlJRTbKhBzkox3Z4v4/1Y6t4nuiGzFbH7NGO3yk7j+Lbq52hnaRi7ks7HLE9z3NOiiknlSGJd0kjBEHqxOAP1r8xrVXVqSqPds/qbAYSGCw1PDw2gkvuW/z3PaPgV4RWC0m8S3UYMsxaG0yPuoDhmH1Py/RT6163VPR9Mi0XSrPTYf9XawrCPfAxn8etXK+hoUlTgoo/Ec2zCWOxc8RLZvTyXT+u4UUUVqeaFFFZFz4t0Kz8Q2/hy51S2h1a5i86G1dsNIuccds5BwOpwcDigDXrN1XxNoehSJFq2taXp0ki7kW7u44S46ZAYjIrSr5j/a4THiHw7J/es5h+Tj/ABq6ceaViZS5Vc+g7Hxn4Y1O6jtLHxJol3cynCQwX0UjucZ4VWJPStmvib4CJv8Ai74cGcYlmP5QSGvtmnVhyOwoS5lcKKy9U8UaJol9YWGpana2t3qEgitYJHw8zew9M8ZPGcDqa1KzLCiio7m5hs7eW5uZUhghRpJJHOFRQMkk9gACaAJKRmCgsxAAGST2FZvh7xJpHivTI9U0S/hvrSTgSRHoe4IPKkehANaEy74nX1UigDD/AOFheDf+hu8O/wDgzg/+LrU03VtO1m2+1aZf2l/b7innWsyypuHUblJGeRX54pxGo9BX2D+zCm34Vwtn799cH6cgf0repR5Fe5lCpzOx6xRSEhQSSABySe1ZuheJtG8TR3Mui6lbahHazG3laB9wRxgkZ79RyOD2NYGpp0UUUAFFZOqeLNC0TVbDStT1S1tL3Ud32WKV9plxjPPQdQBnGTwMmtagChquv6PoSxNq+radpomyIzeXKQ+ZjGcbiM4yOnqKpW/jrwpdzx29t4o0GeaVgkcceowszseAAA2ST6V4v+14M6f4Xf0luh+axf4V4l8Ll3/EnwsM4xqtq35SrW8KKlHmuZSqWlyn3jRRWXrvijRfDCWz6zqdrYC6lEMPnPgyOSAAB1PUZPQdyKwNTUoo/DFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAHO+PPCsfi/w5cWG1ftKgy2zn+CUDjn0PQ+xr5dZHjdkdSjoSrK3BUjqDX2JXzV8WtHXRvHV+sahYrvbdqB6v97/AMfDV5eZUlZVEfofAuYS554KT0tzL8n9+j+TORhmkt5o54XKSRsHRh2YHIP519CaTqCatpdpfx4C3ESyYH8JI5H4HI/CvnmvYPhVem58L+Sxyba4eMewOG/mxrq4druNd0ujX4oPErAqpgqeKS1hK3yl/wAFI7Giiivsz8UCiiigAooooAKKKKACsbxlIY/CuqsOv2Zx+Yx/WtmsPxv/AMilqn/XA/zFc+L/AIE/R/kehlKTx1BP+eP/AKUjwqtrwRCtx4y0OJ/um+hJ/Bwaxa3/AIf/API8aF/1+R/zr83pfGvU/pnHu2GqNfyv8mfU1FFFfTn8/BRRRQBS1rUTpGk3moLaXN61tC8ot7ZS0kpAyFUDuTxXwV4p8R6l4p8RXut6o7fbriYu45HlEcBB6BQAB6Y9c1+gVcB8Rfgr4Y+IivcXMJ0/ViPl1C1UByf+mi9JB9efRhW1GoovUzqQcloeM/C79pXUNDMOleMfO1KwGES/X5riEf7Y/wCWg9/vf73Sl/ak1fTvEE3hLVNKvYL2zntrrZNC25Tho/yPPIPI71wPxC+EPij4cyGTUbX7VpxOE1C2BaE88Bu6H2b8Ca4rc20LuO0EkDPAJ7/oPyrojCLlzxMXOSXLI9D/AGfSqfFvRJHdUSNbl2ZjgKBbS5JJ6D3r1v4oftMWWlebpXgryr+8GVfUXGYIj/0zH/LQ+/3f96vmFXZM7WK5BBwcZB6j6Vt+E/BWv+ONQFjoGmzXkgI8yQcRQg93c8L+PJ7Zpzpxb5pCjNpcqM/U9Z1LWdTk1TUb+5ur6Rg7XEshLkjpg9sdsYx2xX2h8FfG1/468C2l/qlrcRXsJ8iSeSMql3t6SoehBHXHG4GuU+HP7NOg+G/Kv/EzR65qK4YQlf8ARYT/ALp5k+rcf7I617MqqihEUKqgAAdAPSuetUjLRG1ODWrFrwn9qXxlqel6HZ+HLK2uYrXUsvd3uwiNlU8QhumSRuYegA5BNe7VW1HTrPV7KWx1C1gu7WZdskM6B0ce4NZQdndmkldWPg3wh4217wJqg1HQb57aQ4EsZ+aKdR/C6dGH6jPBFfVvwt+POg/EEw6dehNI1tsL9lkf93Of+mTHr/un5vrjNcH8R/2XFcSaj4HnCtyzaXcvwe+IpD0+jnH+0OlfPepaZqGh6hJY6jaXFjeQN88UyFHQ9jg/oenpXW1CqtNznTlT32KzLtYj0OK+o/g9498P/D/4Jadf67eiESXF0YYEG6aciVuETqfqcAdyK+Wyc8nrSlmYKCxIUbVBP3RknA/Ek/ia0nDnVmRGfK7npXxO+OviD4hGSxty2k6ISQLSF/nmHrK4+9/ujC+xxmoPgX441Hwb44torW2ub201Nltrq0t0Lu654kVRyWTJP03DvWp8Of2d/EvjLyr3Vg+haU2GDzIfPlH+xGcYz/ebA9A1fTfgn4deG/h/Zm30KwWKRxiW6kO+eb/ef09hhR2FYznCK5UaxjJvmZ0tR3E32eCSYxySCNC+yNdztgZwo7k9hUlFchufBnxI8W6n428YahqurQy20u8wx2koINrGudsZB6EZJPqST3rvfhd+0VrHhDydL8RCfWNHXCK5bNzbD/ZY/fUf3WOfQjpX0J8QPhP4Y+IsBOqWnk36rtiv7fCzJ6AnGGX2YEemOtfLnxG+CHif4emS6eH+09IXkX9shwg/6aJyU+vK+/auyM4TXKznlGUXzI9D/aX8SaP4t8IeF9X0S/hvrR7qdQ8Z5UlEJVgeVYY6EZryX4Sjd8T/AAuP+olAfycH+lcoGYKV3HaSCRngkZwfryfzoR2jbcjFTzyDg+laxhaPKZuV3c+r/ih+0hpPhYy6X4YEOr6qMq8+c21ufcj/AFjD0U49T1FfMHiHxFq3ivU5dT1u/mvruXgySnoP7qjoq+wAFO8O+GdZ8W6iunaHp09/dNzsiXhR6s3RR7kgV9IfDn9mHS9I8rUPGMseq3YwwsYiRbRn/aPWQ+3C+x61n7lL1L96odF+zx441Lxh4KEGq29yZ9MYW63siHZdR4+XDHguuNrD6Hua9TqOCCG1hjgt4o4YY1CJHGoVUUdAAOAKkrjk7u6OhKyCiiikMKKKKACinRxPKcKPxq3HZovL/Mf0oAphS3QE/QVILaU/wY+tXwoUYAAHtUU97bW3+vuIYv8AfcL/ADoAxdX1O30PyftpZfOyF2jd0xn+dVIvFWjynH2vZ/vxsP6VS8cuusrZ/wBmn7b5RfzPs/7zZnbjO3OM4P5Vxs1tPb/66GWL/rohX+dAHqFvd292u63nimH+wwbH5VLXk6u0bh0ZkYdGU4I/GtvTvGGoWRC3B+1xej8MPo3+OaAO9oqhpetWerpm3k+cDLRNw6/h3HuKv0AFFFFABRRRQAV4d+0FAq63pFwOslq6H6K+R/6HXuNeJ/tC/wDIQ0P/AK4z/wDoSVx47+C/66n0/B7azSn6S/8ASWeTV6b8HXJtNVjzwskTfiQ3+ArzKvS/g3/qdW/3of5PXNkj/wBsh8/yZ9tx4k8krf8Abv8A6XE9Gooor74/noKKKKACiiigAooooAKxPG4z4S1X/rga26zfEtubvw9qcCjJe1lAHqdpxWGKV6M0uz/I7ssmqeMozlspRf3NHgFb3gA48caF/wBfsX/oQrA7Vf0G/Gla5p1+xwtrdRTMfZXBP6CvzWm7STP6exlN1KE4R3aa/A+t6KPpyPWivqD+ewooooAKoa5r+leGtOk1LWb+3sLSP70sz7Rn0Hcn2GSadrbakmkXraMls+pCFjarc58tpMfKGwQcE8V8J+NPFXiTxXrMs/ie8uZryF2jMEo2rbEHDIqdEwRggDPHOTWtKnzsic+VHrnxL/acuNVin0nwfa/ZrSQGOS/u4laSVTwQkZyFHu2T7KRXgldh8PfhZ4j+I95s0q28qyRts9/OCIYvUZ/ib/ZHPrgc10nxy+GmkfDGHw3YabJNcXFxFcSXV1Nw0zKYwMKOFUZOAPXknrXVHli+VHPLmkuZnldenfCz476z8OYo9LntYtS0QMWNvgRyxZPJRwOfo2fqKyfgtoGmeKfiLp2jaxai6sbqK5WSMsVPEDsCCOQQQCCK6P4pfs96z4J83U9EMusaKMsSF/0i2H+2o+8v+2v4gU5uLfLIIqSXMj6Y8E/Ebw18QbM3GhagssiLmW1kG2eH/eT0/wBoZU9jXS1+d+n6hd6VeQ32n3U1pdQndHNA5R0PsRX2p8Fta8V+IvA1rqfiwQ+fOc2rrHsklgwMPIOmWOSMAZGD3rlq0uTVG8KnMd5RRXiH7S3izxr4Y0+xXRLkWWi3gMNxdW4InWXrsL/wKV5BXBODz0znGPM7Ft2VzrviL8bfC/w8WS2mm/tLVlHGn2rAsp/6aN0jH1+b0Br5W+IvxN1v4l6jFdasLaGG3BFvbwRgLED1+Y/Mx+p+gFcoiS3MyxxpJLNK2FVQWZ2J6AdSSfzr3z4XfsyXOoNBqvjjzLO3JDJpaNiWQf8ATVh9wf7I+b1K4IrrUYUtXuc7lKeiPAKt6Rq15oWp22p6dN5F3auJIpNittYd8MCD+IqtLjzX2jC7jgegzXvHgX4G6T8SfhLpup2s39ma8r3CC45aKcCZ9qyL7DADDkY53YxWk5KK1IjFt6HT/Dj9p/TdW8vT/GUcemXZ+UX8QJt5D/tjkxn35X/d6V7nBPDdQRz28sc0Mih0kjYMrg9CCOCK+BfFng3XPBGqNpmvWElpPyUY8xzL/eRhww+nTocHiuw+B/ivxxY+K7HQfC90ZYLuXM1nc5e3ROryEZymBzlSCTgc5ArCdGLXNE1hUd7M+zqKKjuPP8iX7MYxPsby/Nzs3Y43Y5xnrjmuU3ItS1Ox0eylv9Ru4LO0hG6SadwiIPcmvnv4j/tRKVm0zwTbhs5R9Tuk49P3cZ/m4/4D3ryL4l+LPGHiLxDc2vi+5kFzYzNF9iA2w27Dj5EHH/AuSQRyareB/h54h+IWo/Y9DsjIqECa5k+WGAf7bevsMk9ga64UYxXNIwlUbdonOSyvPK8shy7sWY4AyScngU2vX/jJ8I9J+F3hHQ/s8819ql5dOLm7f5VIVM7UTOFXJz3J9e1cN8M9Os9X+IOgadqNsl1Z3V4kM0L5w6t8pHH1rZTTjzIxcWnZm18MPjNrnwzZra3ht7/SpZPMms5AFbPdkkAyG+u4e3evqjwD8VvC/wARYB/ZF75d6q7pLC4wk6epxn5h7qSPXFeC/FH9m3U/Dvm6r4S8/VNMGXezPzXNuPbH+sX6fN7HrXitvcT2dxHcW8ssE8LBkkjYq6MO4I5BHqKycIVFdGinKGjP0Uory79n3xJ4w8U+EX1DxQ8c9uJPLsbl02zzquQzORwQDgA4ySGznqfUa5JKzsdCd1cKKKKQwqaC3Mpy3C/zpsEPnPz90dauyyx2sLSSMscaAlmJwFAoAcAsa4AAUVzGtePLOxJisVF3MOCwOI1P17/h+dc34m8Wzaw721qWhshxjo0vufb2/Oue60Aal/4o1fUSfMvHjQ/8s4fkX9OT+JrK7kk5J6k9TUmz3pdo9KAOu+G8iRyajvdVyIsZOM/eruyA4wQCD+Oa8WKhuoB+oqW3uri0bdbzywn/AKZsV/lQOx6bqHhPSNRBMlokbn+OEbG/Tr+NcfrPgS909WlsmN5COSoGJF/Dv+H5U7TfHOo2jKt2FvIu+flcfiP6j8a7bSdcstZiL2smWX78bcOn1H9elAjySKWS3lWWJ2jkQ5DKcEGu38OeJl1PFtdbUugPlPQS/T0Pt+VaHibwhBqytc2oWK9AzkDCy+x9/evOJI5rWco4eKaJsEdCpFAHq1FYPh3xImpKtrckJdgYz0EvuPf2reoAKKKKACvE/wBoU/8AEx0Qd/Jn/mle2V4F8eL9bnxdb2ikH7JZqG56MzM38ttcePdqLPqeDablmkGuik/wt+p5vXpfwcGINWP+1D/J680r1T4QW5TR7+4I4kuAg9wqj/4qufI1fGR+f5H2PHs1HJaqfVx/9KT/AEO9ooor70/n0KKKKACiiigAooooAKCAeCMg9R60UUAfPOsae2k6rd2DD/j3lZB7gHg/iMGqZGa9B+LOhmG9g1iJf3c4EMxHZwPlP4rx/wABrz+vzbG4d4evKm+m3p0P6cyDM45jgKWJT1a1/wAS0f4/gfTXwx8Rr4k8IWUrPuubVRazjPO5AMH8V2n8faurr5p+GPjb/hDNdzcsf7NvMR3IH8HPyyD6EnPsT3xX0pHIk0ayRurxuAyspyGB5BB9K9bB11Upruj8t4mymWAxkml7k9V+q+X5WHUUUV1HzoV5j4m+AHhfxX44/wCEnv2mEUiA3NhF8qXMo6OzDkZGAQME4znk59OopqTWwmk9yCxsLXTLSKysbaG1tYVCRwwoERFHYAcCvmv9rps654bX0tbg/m6/4V9N1wXxG+DehfE2+s7zV77VLd7SIxItpIiqQTnJ3I3P0xV0pKMrsmabVkfM3wAfZ8XvDvGdzzr+dvLX2t+OK8r8J/s6eF/B3iOx1+w1PW5bmydnjSeWIoSVK8gRg9GPevVKdaak7oVOLirM8u8Wfs8eD/FHiC11lIm05hOJby2tlAhvF6kFf4CTjLL1GeMnI9PjjSKNY40VEQBVVRgKB0AHYU6is3JvctJIKyvFHhuw8X6Be6HqcfmWt5GUbHVD1Vl9GUgEH1FatFIZwHw1+C/hz4bxLPAn9o6uVw+oXCDcPURryEH0yfUmu+Ztilv7ozS02RPMjZCSAwIyOvNNtt3YkrbH50Kdyg+ozX2F+zHJv+FNsuMbL25X6/Nn+tZS/sm+C1GP7Y8R/wDf+H/41XpHgDwJp3w60D+xNLuLy4tvPefddMrOGbGRlVAxx6V0VasZRsjKnBxepf8AEvhbRvGGlyaXrlhDe2r87XHKN2ZWHKsPUEVy/wAM/g/o3wxl1KewuJrye9fCzTqN8MI5EYI688k8Z444rvaK5+Z2sa2W4UUUUhnm/j34F+HviB4pstev5p7cxJ5d3DAAPtgGNmW6qRyCRyRgZGBXd6Po2neH9Oh03SrKCys4RiOGFdqr/ifUnk96u0U3JtWYrI+ff2u2/wCJX4YT1nuT+Sx/414l8K22fEvwscZ/4mtsv5yqK+u/iR8KtH+KEWnx6veahbCwaRo/sjou4vtzu3K390dMdTXK6J+zL4T0HWrDV7XVtfeexuY7mNZJoipZGDAHEY4yK6IVYqHKzKUG5XPXq80+IPwE8LePb5NSIfSr8yBrie0UYuVyNwdem4jPz9c9cgYr0uiudSad0atJ7kFhYWul2VvY2UCW9rbxrFFEgwqIowAPwxU9FFIYUewGTRU1pHvmB7LzQBchjESBR17159448QteXLaZbPiCE/vSP439PoP5/Suv8T6qdI0ia4Q4lb93F/vHv+HJ/CvJsk8kkn1NAABk1IBihV205VaR1RFLMxwABkk0DErY03wrfagFkkAtYj3kHzH6L/jit/QfDMWnqtxdBZbrqAeVi+nqff8AKt2gDCtvBumwged5s7d9zbR+Qx/Ori+HtJUYFjF+OT/WtGigRlTeF9IlH/HoEPqjsP61nSeEprKZbrSr1o5U5USfyyB09iK6aigB2i6rLexmK8gNveRj95H2Yf3lPcfyrG8c+HBe251K2T/SIV/eAD/WIP6j+X4VsI2xw4AyK01IkUEcgigDxNWKMGUkEHIIOCK73w1rv9qQ+ROcXUYyT/z0X+99fWuW8TaV/Y+sTQIMQv8AvIvZT2/A5H4VSsbqWyuI7iFtrxtke/t9O1AHqNFQWV3HfWkVzF9yRc49D3H4Hip6AI7i4itIJLieRY4YkLu7dFUDJJ/CvlDxNrT+Itfv9VcEfaZi6qeqp0UfgoA/CvVfjZ47SKA+F9PlzLJg3rqfuL1Ef1PBPtx3rxivGzCupS9muh+p8FZTKhRli6qs57f4e/z/ACSfUK9x8B6cdM8K2MbDa8qmdx7udw/8d2j8K8j8LaI3iHXbWxwTEW3zEdox97/Ae5Fe+AAAAAADgAdq9bhzDPmlXfov1PB8TMzXLSwEXr8T/Jffr9wUUUV9YfkQUUUUAFFFFABRRRQAUUUUAU9Y0q31vTZ9PuR+7mXGR1U9mHuDg14Lq2l3OjahNY3abZYmwfRh2YexHNfQ1c1418Hw+KLMNGViv4QfJkPAYf3G9j69j+NeJnOW/WYe0p/EvxXb/I+44K4mWV13QxD/AHU9/wC6+/p0fyfTXxOvRPht8VpfCuzS9X8y40onCOvL230HdfbqO3pXAXdpcWFzJa3ULwzxHa6OOQair4unUnSldaM/bsZgsPmFD2dVc0Xqn+TT/r7j690/ULTVbOO8sbmK5t5RlJIm3Kf8+lWK+TtA8T6x4YuDPpF/LbMxy6DlJP8AeU8H8q9K0f8AaAlRVTWdGWQjrLZybSf+AN/8VXr0swpy0noz8zzHgvGUZN4b34/c/uen3P5Hs9FefW/xy8IzJmRtQgP917fJ/wDHSam/4XX4M/5/rn/wGf8Awro+s0v5keG8izFOzoS+5nd0Vwn/AAuvwZ/z/XP/AIDP/hR/wuvwZ/z/AFz/AOAz/wCFP6zS/mX3i/sPMP8AnxL/AMBZ3dFcJ/wuvwZ/z/XP/gM/+FH/AAuvwZ/z/XP/AIDP/hR9ZpfzL7w/sPMP+fEv/AWd3RXCf8Lr8Gf8/wBc/wDgM/8AhR/wuvwZ/wA/1z/4DP8A4UfWaX8y+8P7DzD/AJ8S/wDAWd3RXCf8Lr8Gf8/1z/4DP/hR/wALr8Gf8/1z/wCAz/4UfWaX8y+8P7DzD/nxL/wFnd0Vwn/C6/Bn/P8AXP8A4DP/AIUf8Lr8Gf8AP9c/+Az/AOFH1ml/MvvD+w8w/wCfEv8AwFnd0Vwn/C6/Bn/P9c/+Az/4Uf8AC6/Bn/P9c/8AgM/+FH1ml/MvvD+w8w/58S/8BZ3dFcJ/wuvwZ/z/AFz/AOAz/wCFH/C6/Bn/AD/XP/gM/wDhR9ZpfzL7w/sPMP8AnxL/AMBZ3dFcJ/wuvwZ/z/XP/gM/+FH/AAuvwZ/z/XP/AIDP/hR9ZpfzL7w/sPMP+fEv/AWd3RXCf8Lr8Gf8/wBc/wDgM/8AhR/wuvwZ/wA/1z/4DP8A4UfWaX8y+8P7DzD/AJ8S/wDAWd3RXCf8Lr8Gf8/1z/4DP/hR/wALr8Gf8/1z/wCAz/4UfWaX8y+8P7DzD/nxL/wFnd0Vwn/C6/Bn/P8AXP8A4DP/AIUf8Lr8Gf8AP9c/+Az/AOFH1ml/MvvD+w8w/wCfEv8AwFnd0Vwn/C6/Bn/P9c/+Az/4Uf8AC6/Bn/P9c/8AgM/+FH1ml/MvvD+w8w/58S/8BZ3dXLEfu2b1Necf8Lr8Gf8AP9c/+Az/AOFd14W1yz8R6LBqens7W027YXUqThip4PuDVQqwm7RdznxOW4rDR569OUVtdprU5j4jXpe5tLMHiNDKw9SeB/I/nXHr1rc8bSGTxHcg/wACoo/75B/rXGav4t0nw/cJb380iSSIJFCxluMkdvoauUlFXZz0aM6suSnFt+Rt11vhDRwkf9pTL8zZEIPYd2/HoP8A69eVw/Efw1LNGhu51DMAW+zvwO56V30fxn8EwxrHHeXKogCqPsz8AdO1ZPEU1vJHdHJ8dNXjRk/kzvaK4T/hdfgz/n+uf/AZ/wDCj/hdfgz/AJ/rn/wGf/Cj6zS/mX3lf2HmH/PiX/gLO7orhP8Ahdfgz/n+uf8AwGf/AAo/4XX4M/5/rn/wGf8Awo+s0v5l94f2HmH/AD4l/wCAs7uiuE/4XX4M/wCf65/8Bn/wo/4XX4M/5/rn/wABn/wo+s0v5l94f2HmH/PiX/gLO7q5ZP8AIV9DXnH/AAuvwZ/z/XP/AIDP/hW54Q+JHh7xVqj6fpVxNLcCFpirwsg2gqDyR/tCnGvTk7KSM6uUY2lB1KlGSS3bTH/EaxD2VreAfNFIYyfZhn+Y/WuDXrXqPjaMSeG7vPVdjD8HFePa7qbaLpFzqKxCVoFBCFsBssB1/GtG7K7OGnCVSahHduy+Z3vgi/P7+xduP9ag/Q/0/WuZ+IfxhtdJjk0zw7LHc35yr3S/NHb/AO72Zv0Hv0rxbUvHOtaxMI5bn7PbtlWgt8orA9jzlvoTj2qpXl4nHP4af3n6HkHCVNv22Md7fZW3z7+n5jpJJJpHlldpJHYszMcliTkknuabRXpHw98BsHi1nVYiu3D20DjnPZ2H8h+JrjwmEqYqoqcP+GPr85znD5ThniK79F1b7L+tDd+HfhY+H9LNzcptvrsBnU9Y07J9e59+O1dZRRX6HhsPChTVKGyP5vzHMKuPxM8VXfvSf/DJeSWiCiiitziCiiigAooooAKKKKACiiigAooooAw/E3hDT/FEGLgeVcoMR3CD5l9j/eHsfwxXkfiHwjqvhuQm7gL2+cLcxZMZ+p7H2Ne8UjKHUqwDKwwQRkEehrycfk9LFe8tJd/8z67h/jHGZSlS+Ol/K+n+F9PxXkfN9Fez6v8ADXQNULSRQvYyn+K2ICk+6nj8sVyt58IdQjY/YtStZ17CZWjb9N1fMV8kxVN6R5l5f1c/UsBx7lOJS55unLtJfqrr8UcFRXVP8MfEyHAtYH91uF/qRTf+FZ+J/wDnxj/8CI//AIquP6hif+fb+5ntLiPKnr9Zh/4FH/M5eiuo/wCFZ+J/+fGP/wACI/8A4qj/AIVn4n/58Y//AAIj/wDiqPqGJ/59v7mP/WLKv+gmn/4HH/M5eiuo/wCFZ+J/+fGP/wACI/8A4qj/AIVn4n/58Y//AAIj/wDiqPqGJ/59v7mH+sWVf9BNP/wOP+Zy9FdR/wAKz8T/APPjH/4ER/8AxVH/AArPxP8A8+Mf/gRH/wDFUfUMT/z7f3MP9Ysq/wCgmn/4HH/M5eiuo/4Vn4n/AOfGP/wIj/8AiqP+FZ+J/wDnxj/8CI//AIqj6hif+fb+5h/rFlX/AEE0/wDwOP8AmcvRXUf8Kz8T/wDPjH/4ER//ABVH/Cs/E/8Az4x/+BEf/wAVR9QxP/Pt/cw/1iyr/oJp/wDgcf8AM5eiuo/4Vn4n/wCfGP8A8CI//iqP+FZ+J/8Anxj/APAiP/4qj6hif+fb+5h/rFlX/QTT/wDA4/5nL0V1H/Cs/E//AD4x/wDgRH/8VR/wrPxP/wA+Mf8A4ER//FUfUMT/AM+39zD/AFiyr/oJp/8Agcf8zl6K6j/hWfif/nxj/wDAiP8A+Ko/4Vn4n/58Y/8AwIj/APiqPqGJ/wCfb+5h/rFlX/QTT/8AA4/5nL0V1H/Cs/E//PjH/wCBEf8A8VR/wrPxP/z4x/8AgRH/APFUfUMT/wA+39zD/WLKv+gmn/4HH/M5eiuo/wCFZ+J/+fGP/wACI/8A4qj/AIVn4n/58Y//AAIj/wDiqPqGJ/59v7mH+sWVf9BNP/wOP+Zy9FdR/wAKz8T/APPjH/4ER/8AxVH/AArPxP8A8+Mf/gRH/wDFUfUMT/z7f3MP9Ysq/wCgmn/4HH/M5eiuo/4Vn4n/AOfGP/wIj/8AiqP+FZ+J/wDnxj/8CI//AIqj6hif+fb+5h/rFlX/AEE0/wDwOP8AmcvX1F8Ff+ScaV/22/8AR0leC/8ACs/E/wDz4x/+BEf/AMVX0J8KNMudH8C6dZXiCOeLzd6hg2MyuRyPYiuzBYarSm3Ui0rdUfJ8YZtgsXg4U8NWjOXMnZSTdrPXRnMeMf8AkZL3/eX/ANAWvFvin/yHbX/r0X/0N69p8Y/8jJe/7y/+gLXk/wAQfD2o6vq1vPZwq6LbBCTIq87mPc+9d1eEpw5Yq7PkMir0qGLU6slFWerdkcFZjM4PoCa0K0tK8BeILm4ZIrOMkIT/AK9B3HvWt/wrPxP/AM+Mf/gRH/8AFV5NTBYhvSm/uZ+n4HPsshTtLEQT/wAUf8zl6K6j/hWfif8A58Y//AiP/wCKo/4Vn4n/AOfGP/wIj/8Aiqz+oYn/AJ9v7mdn+sWVf9BNP/wOP+Zy9FdR/wAKz8T/APPjH/4ER/8AxVH/AArPxP8A8+Mf/gRH/wDFUfUMT/z7f3MP9Ysq/wCgmn/4HH/M5eiuo/4Vn4n/AOfGP/wIj/8AiqP+FZ+J/wDnxj/8CI//AIqj6hif+fb+5h/rFlX/AEE0/wDwOP8AmcvXpf7Pv/I9z/8AYOl/9DjrnP8AhWfif/nxj/8AAiP/AOKrvPgv4P1nQPF8t3qFskUJspI8iVW5LoegJ9DW1DB14VIylBpejPLzvPMurYCrTpYiEpNOyUk2/wAT17xf/wAi5e/7g/8AQhXhvjf/AJFPUv8AcX/0Na9y8X/8i5e/7g/9CFeLeJLFtT0O8s1cRtKoAYjIGGB/pXsSi5JxW7PyfC1I068Jzdkmm/RM8PBwQRXQ6dpl7q9yLawtpLiU/wAKDp7k9APc1uWXgCwgO67nmumHYfIv6c/rXsdhYWmm26wWVtFbxAZ2xqFH1Pqfes6ORVKrTquy+9/5H1+J4+oYOMo4SHPJ7N6R/wA36aepyHhL4bW+ksl7qpS6ux8yRDmKI/j94+/T09a7eiivp8LhKWGhyUlY/MszzXFZlW9vip8z/BLsl0X9MKKKK6DzgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigArtvDf8AyB4P+Bf+hGvPdQ1nTdJCnUNQtLTcMjz5VQke2TzXd+D7611Hw/a3NncRXED79skTBlbDsDgj3BrzsxknBLzPQy5P2jfkcJ4x/wCRkvf95f8A0Ba5TUf9cv8Au/1NdX4x/wCRkvf95f8A0Ba4rW9UsbG5SO6vLeB2TcFkkCkjJ55rgwrtUPQxX8M2PC3/AB/y/wDXE/8AoS11NcF4c8U6Fb3sjzaxp8amIjLTqOcj3ro/+E28M/8AQf0v/wACU/xr2qc423PFqRd9jaorF/4Tbwz/ANB/S/8AwJT/ABo/4Tbwz/0H9L/8CU/xrT2ke5nyy7G1RWL/AMJt4Z/6D+l/+BKf40f8Jt4Z/wCg/pf/AIEp/jR7SPcOWXY2qKxf+E28M/8AQf0v/wACU/xo/wCE28M/9B/S/wDwJT/Gj2ke4csuxtVseFf+Qm3/AFxb+Yrjf+E28M/9B/S//AlP8a6HwL4j0bVtbe30/VLK7mEDOY4ZlZtoK5OB9R+dYYmcXSlZm2Gi/ax06nVeL/8AkXL3/cH/AKEK8jvP+PWT6f1r1zxf/wAi5e/7g/8AQhXj+pzxW1hNNPIsUaLlnY4A5A5NeFT+Nep7tT4WZjdK9CHQfSvNbbULS+B+y3UE+Bk+XIGI/KvSh0H0r6CieDW6BRRRWxgFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFcn8R/F7+E9GQ2u37fdsY4NwyEAGWfHfGRj3I7ZrrK8c+OEpbXNNizkLaFwP952H/ALKKxxEnGDaNaMVKaTPO7i5nvLiS5uZpJ55DueSRizMfcmvrL4E/8kv0f/tv/wCj5K+Sa63Qvit4x8NaXDpelawbezg3eXH9nibblix5ZCTyT3rx6kXJaHr05KLuz3Lxj/yMt9/vJ/6AteKfFX/kO2n/AF6D/wBDeqd58S/Fd/cPc3Oq75Xxub7PEM4GOy1iarrN9rc6T38/nSImxTtVcDJOOAPU1EKbi7supVUlZFKiiitzAKKKKACiiigAooooAK9V/Zt/5KHP/wBg2b/0ZFXlVavhvxRq/hHUW1HRbv7LdNEYS/lo+UJBIwwI6qKmSurFRdnc+x/F/wDyLl7/ALg/9CFeGeOf+RS1L/cX/wBDWuMvPjR47v7d7e413fE4wy/ZYRn8krDvvGWu6laS2l1feZBKMOvlIMjIPULntWMaTTubyrJqxkRSyQSLLE7RyKcqynBH41718N/GD+LNHcXW37fZkRzEDHmAj5Xx2zgg+4PqBXgVdf8ADK9ns9YuhBM8bNb7jg/ew6jn/vqu6hNxmcFampRPfKKytE1n+0VMcoVZ0GTjgMPWtWvTTTV0ec007MKKKKYgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACvBP2hb57Dxbo0qjcpsCGX1HmtXvdfPf7Sv/Iy6P8A9eB/9GvWGJ+A6MN8Zx0Gq2c6BlnjX/ZchSPzqT7ba/8APzD/AN/B/jXGUV5/KejY7P7ba/8APzD/AN/B/jR9ttf+fmH/AL+D/GuMopcgWOz+22v/AD8w/wDfwf40fbbX/n5h/wC/g/xrjKKOQLHZ/bbX/n5h/wC/g/xo+22v/PzD/wB/B/jXGVJbW095cRW1tDJNPM4SOONSzOx4AAHJJo5Qsdf9ttf+fmH/AL+D/Gj7ba/8/MP/AH8H+NdVpv7LfxE1CwW6ki0qxZl3C3uroiT6HarKD+NeceJvCuteDdVk0rXbCWyu0G7a+Crr2ZWHDA46ipXK9ExuDW5u/bbX/n5h/wC/g/xo+22v/PzD/wB/B/jXGUVXIKx2f221/wCfmH/v4P8AGj7ba/8APzD/AN/B/jXGUUcgWOz+22v/AD8w/wDfwf40fbbX/n5h/wC/g/xrjKKOQLHXzarZwLua4jb2Qhifyrd+E189/wCJdQkYbVFnhF9B5i15nXofwW/5Duof9en/ALUStKatJEz2PbdFcx6rbEfxMVP0INdpXE6R/wAhW1/66Cu2rvpbHm1dwooorUyCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK+e/2lf+Rl0f8A68D/AOjXr6Er57/aV/5GXR/+vA/+jXrDEfCdGG+M8fooorhPRCiiigAooooAK9s/ZR0Wy1Lx7d3tyivNY2u6AN/CzEgsPcAEf8CrxOuo+HHjy++HPim31yyjEyqDFcQE4E0R6jPY5AIPqPTNRUTcWkXBpSTZ+gteH/taaJZXfw8ttWkVReWF6ixSd9smVZfp91sf7NeveG9ch8SaFYaxbxvHDewJcIj43KGUEA47818lftH/ABXuPGOvS+Fra3e103RbuWOTc3zXFwhKFzjoo+YAe5J7Y46MW5qx01GlE8ZooorvOMKKKKACiiigAr0P4Lf8h3UP+vT/ANqJXnleh/Bb/kO6h/16f+1EqofEiZ/Ce16R/wAhS1/66Cu2ridI/wCQpa/9dBXbV3Utjzau4UUUVqZBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFfPf7Sv/Iy6P8A9eB/9GvX0JXz3+0r/wAjLo//AF4H/wBGvWGI+E6MN8Z4/RRRXCeiFFFFABRRRQAUUUUAfoF8KP8Akm3hr/sG2/8A6LWviP4n/wDJSfFf/YYvP/Rz17F4S/attPDPhnS9FfwpPO1haxWxlF6FD7FC5xsOM4rwvxVrK+I/E+r60sJgXUL2a7ERbcUEjltueM4ziuejCUZNs3qSTWhl0UUV0GAUUUUAFFFFABXofwW/5Duof9en/tRK88r0P4Lf8h3UP+vT/wBqJVQ+JEz+E9r0j/kK2v8A10FdtXE6R/yFLX/roK7au6lsebV3CiiitTIKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAr57/aV/wCRl0f/AK8D/wCjXr6Er57/AGlf+Rl0f/rwP/o16wxHwnRhvjPH6KKK4T0QooooAKKKKACiiigAooooAKKKKACiiigAooooAK9D+C3/ACHdQ/69P/aiV55XofwW/wCQ7qH/AF6f+1EqofEiZ/Ce16R/yFLX/roK7auJ0j/kKWv/AF0FdtXdS2PNq7hRRRWpkFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAV89/tK/8jLo//Xgf/Rr19CV89/tK/wDIy6P/ANeB/wDRr1hiPhOjDfGeP0UUVwnohRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAV6H8Fv+Q7qH/Xp/wC1ErzyvQ/gt/yHdQ/69P8A2olVD4kTP4T2vSP+Qra/9dBXbVxOkf8AIUtf+ugrtq7qWx5tXcKKKK1MgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACvnv9pX/kZdH/AOvA/wDo16+hK8c/aL8K3OoaXYeILWNpBp++G5CjJWJiCr/QMCD/ALw96xxCvA3w7tNHz9RRRXAekFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABXofwW/wCQ7qH/AF6f+1ErzyvWvg5oM1rZ3esTqVW6CxQA90Uks30JwB/umqhuRUfunqmkf8hS1/66Cu2ridI/5Clr/wBdBXbV3Utjzqu4UUUVqZBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFNdFlRkdVdGBVlYZDA8EEdxTqKAPKvF3wH8L3aS6hpwvNNcHc0Nu4MWO5CsDt+gIHtXHf8AClNJ/wCgpqH5J/8AE19DEZ4PSufv/Cwdy9nIqA/8s36D6GuedFdEdNOvLZs8Z/4UppP/AEFNQ/JP/iaP+FKaT/0FNQ/JP/ia9b/4Ri//AL9t/wB9n/Cj/hGL/wDv23/fZ/wrP2Xkae38zyT/AIUppP8A0FNQ/JP/AImj/hSmk/8AQU1D8k/+Jr1v/hGL/wDv23/fZ/wo/wCEYv8A+/bf99n/AAo9l5B7fzPJP+FKaT/0FNQ/JP8A4mj/AIUppP8A0FNQ/JP/AImvW/8AhGL/APv23/fZ/wAKP+EYv/79t/32f8KPZeQe38zyT/hSmk/9BTUPyT/4mj/hSmk/9BTUPyT/AOJr1v8A4Ri//v23/fZ/wo/4Ri//AL9t/wB9n/Cj2XkHt/M8k/4UppP/AEFNQ/JP/iaP+FKaT/0FNQ/JP/ia9b/4Ri//AL9t/wB9n/Cj/hGL/wDv23/fZ/wo9l5B7fzPJP8AhSmk/wDQU1D8k/8AiaP+FKaT/wBBTUPyT/4mvW/+EYv/AO/bf99n/Cj/AIRi/wD79t/32f8ACj2XkHt/M8k/4UppP/QU1D8k/wDiaP8AhSmk/wDQU1D8k/8Aia9b/wCEYv8A+/bf99n/AAo/4Ri//v23/fZ/wo9l5B7fzPMtM+EXh+wmWa4e6vypyEnYBPxCgZ+hOK7VEWNVRFCqoACgYAA6AVsf8Ixf/wB+2/77P+FOTwtdswEk0Cr6gkn+VNU2tkS6qe7K+gwNNqsJA+WPLsfQAf4kV2NVdO02HTIikWWZuXc9WNWq6IRsjnnLmYUUUVZAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB/9k=', N'/autenticacion/inicio/modulos/clave-segura')
INSERT [dbo].[modulo] ([mo_id], [mo_nombre], [mo_descripcion], [mo_estado], [mo_fecha_creacion], [mo_imagen], [mo_ruta]) VALUES (2, N'Phishing', N'Aprende a identificar y protegerte de ataques de phishing, una técnica utilizada por ciberdelincuentes para robar información personal y financiera a través de correos electrónicos, mensajes y sitios web falsos.', 1, CAST(N'2024-09-28T22:50:29.037' AS DateTime), N'data:image/jpeg;base64,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6ha53CVtMGLfRbZ21KOJQH4K3p53CSJXaEdIs5Jkk9Z/OOHCbZuq5UcOFnK6jhf4IUiD68BGuAjXASrgJVwEq4CVcBKuAlXASrgJVwEq4CVcBKuAlXASrgJVwUqAAD0+C2bzJ2czoFPnL5VMnaj8S1gFYBWAVgFYBWAVgFYBWAVgFeFeFeFeFeFeFeFeFeFeFeFeFeFeH+gEVOicqqbB4V40ScB83dLI723ZBsmA4gAh/q5hwARG3RUbRTAqnzjixrWXXOsf+H9qV/D+1K/h/alObHtpNXAOi7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou266Ltuui7brou26RtG3UVSql8RHCkwECFAfnzFKYMDadCtOhWnQrToVp0K06FadCtOhWnQrToVp0K06FadCtOhWnQrToVp0K06FadCtOhWnQrToVp0K06FadCtOhWnQrToVp0K06FadCtOhWnQrToVp0K06FadCtOhWnQrToVp0K06FadCtOhWnQrToVp0K06FadCtOhWnQrToVp0K06FadCtOhWnQrToVp0K06FadCtOhWnQrToVp0K06FadCtOhWnQrToVp0K06FadCtOhWnQrToVp0K06FadCtOhWnQrToVp0K06FFTTJ9P8A/Bx//8QAWRAAAQIDAwMNCwgHBgUEAwEAAQIDAAQREiExBUFREBMgIjAyQmFxkZOh0UBQUmKBkpSiscHSBhQjM0NygrIkU1RjwtPhNERgc4SjFSWD4uOks/DxZHTDoP/aAAgBAQAJPwHut4uMyk2GpZBpRCaGoG7vrMlKsspbYJ2iVqAJIGnvy5rU0XWm210Ct8rQajCL10Fo8fc29aQpaqaEisIW21MAlKXKWriRmro77cLKCuqu7/taGgeJ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zp5086edPOjnRzo50c6OdHOjgDYB5w2hRrX+HbgZq4dR5VHnY/3WtUiP+6GIg6k6B5ToHlOgeU6B5ToHlOgeU6B5ToHlOgeU6B5SuQ8pXIeUrkPKVyHlK5Dylch5SuQ8pXIeUrkPKVyHlK5Dylch5SuQ8pXIeUo5HlKOR5SjkeUo5HlKOR5SjkeUo5HlKOR5SjkeUo5HlKOR5SjkeUo5HlKOR5SjkeUo5HlKOR5SjkeUo5HlKOR5SjkeUo5HlKOR5SjkeUo5HlKOR5SjkeUo5HlKOR5SjkeUo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5Eo5RJmJQhmPGKY7IuY49M/wC5Ty2dUgHVxhaaLO5/8wGEAVehBEV11BLnqDPU2f8AbFETCZGKsXtArWQHOOx69elDwDZL55eafKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPefKPeVgcJYNitaus0QcIGVXpMv5DvB/4CmHlC5/Nn81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81n81msTzDPn/APBz/8QAQxEAAQICCAIIBAQFBQAABwAAAQACAxEEEBITICExUTBBBSIyQFBhcfAUgZHxQqGx0SNgcsHhBhUzUmI0Q4KSoKLS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VMqZUyplTKmVMqZUyplTKmVMqZUyplTKmVMqZUyplTKmVMqZUyplTKmVMqZUyplTKmVMqampqampqampqampqampqampqampqampqampqanic2Xp447+WrE2S8dsqRUipFQ4bSFctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1XLVctVy1CC2pxmf5ABI0V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3V47dXjt1eO3RcTr/wDgc//EAEYRAAECAgYFCQcCBQQBBAMAAAEAAgMRBBITITFRBRAgMEEGIjJAUGFxodEUUoGRscHwQuEVYGJy8SMzkqKCFiTC0jSgsv/aAAgBAwEBPwDrY34N/bLjd1gHtZu/HbLurnBDDtZu/b2yeruwQ7Wbv24dsnHq7sO1274puHbPHq7u124b44IYdsjHq5x7XbhvnYdtDHq5x7WKbhvndtN6vx7WKGG+PbTcOrjHtYoYb449slDDq47WOCbhvuPbJwQw6u3tY4IYb7j2y7Dq5Mkw3drFDfDHtl3Voj6oTYRdeUYJF4UKJO49quwQ3ze2XdWi3uGvCJ2q7DekgYp0fJCMQmRA7tg49WjMneEyMOKdGAwUJpJrHtV2G9e4udJMhgItBxT2lhuTXTE+1+PV3ib5IQWjtZ29g9LXGwUE83sCDRIkQTaE+ixW4tPVuO6mqyrKsVWKrFViq6Dxswb3E9ru3rgWuTX1sETJPfWNyaJCWsdcDTIlUbSlUSePkv4rCOaF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', N'/autenticacion/inicio/modulos/phishing')
INSERT [dbo].[modulo] ([mo_id], [mo_nombre], [mo_descripcion], [mo_estado], [mo_fecha_creacion], [mo_imagen], [mo_ruta]) VALUES (3, N'Seguridad en Redes Públicas', N'Descubre cómo proteger tu información al usar redes públicas, evitando riesgos como el robo de datos y accesos no autorizados.', 1, CAST(N'2024-09-28T22:55:31.700' AS DateTime), N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAArwAAAFeCAMAAABQADxlAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAkFBMVEX///8fHBkbFxNUVFT4vwD0ugH9/fsUFBT9/f0AAABYV1bjpwDvtgD1zlXuxlP09PMLCwrouVcRDwzprwDi4uL7wgDfmgDZiQXt7OrU1NP+xQBvbWfEw8Szs7ShoaGIiIcyLy7hr088PDyyiQKVcgAoHgB3WwBWQgDMnQA+LwBQUE/qxIry3r+9olOYhlTfnybFUOfmAABNHklEQVR42uxda5OquhINlyrMSZVCKD9ARUT9iML//3knr0466Jy794zjMNjLF446e6trmpXVDxgjEAgEAoFAIBAIBAKBQCAQCAQCgUAgEAgEAoFAIBAIBAKBQCAQCAQCgUAgEAgEAoFAIBAIBAKBQCAQCAQCgUAgEAgEAoFAIBAIBAKBQCAQCAQCgUAgEAgEAoFAIBAIBAKBQCAQCAQCgUAgEAgEAoFAIBAIBAKBQCAQCAQCgfBJcMYR9F0C4bdQNqWr/zlxmLBo9mLChtP9owTC0qJuJCznBSCqB0bhl7BM6roNC8PY+Ji+76gdnkkEJixMMHBEXV6Uzc2eygLY7MMv6QfCUt2FwhD3drter9JA395uhsAFPIdR5CUsSzIAdTWamyHuOUITuLH0tdTljOhLWJTHELhb3hxvZYC5c72Wce1GwoGwEOryKBoKXt6uhquIup6/8qrFQxFdYAq+hGUEXsfIwnBXnufEDdH3FoMvrdoIi1inYclwjdTdBQT+XhvnRMDLiMB/sgL+1VjyV8xBONiV2u2KmevoK83ZkVeerzdvpFHw/X8rYE7v5QWKwQcJs1KDuAvE3c2ir5cOPhlHyYqPdmXeDP/l0TfsWRf5XeOVmpG73mLY3UOCdtDrtrJAypf4e/eJwtedptZ/Gwr3BkJeii2QvVHuNj7s7kLc3dqzvaDgK683Wrb9B3Vh7esS7LzUaH7ZWV/pCGXfUQFrnEWxFzITDMKud8cCceV5HCd9Gs/S8Fd65WtSFreSF3HfQsF3zl3zgTJWNm3X9b36lej7/th1bWkkYrG8soCYmTC7h+v1nFgM46TfgbBQ0zTKLbIdzmfD3oIqHR4vbrgJWmXb9eJyyrLNpvpdJ4fNJsuy06D6Q0itLqYsANQuA8kgA3eNatDUFWIYcsPdfBg0fx19Y/BtcMKCYm8sKLXUbQ7qsqlqzYVfjVqTOBuObcFcrFrKV81ZkLucI5fB4Dxpxoo8F468ekvzdzonroMVvgUJ3/lCzZQvNZ04aeauBFV16Q+FVUJ8Aeu2qM18QlgmkmHUUdcyNzewmwZqRK7DPN329rYZB4eBa+pmVbVZEarNqW8LXviirB9nb5S7/E4yKBdthT/Zs4m+apJp8G1wvuKtuRu8cl4c1GlVzPX0vRz3bAnKF4ddm1TD5q6c8sHEW0tgIdyGY7CXDj74QrqNKnUQd1lzvGzqzQpRZaL1HQk/GagSQ8ck1XBO7awg5FoG557CXjk46ZCk20DJv3OZJHyiBd+rrNqsFZeutMH3B8MUx80+ManmihlGNQTGCh9583ArDHsl9szkNXhm78tev/YtCnYQmxWjOvUNK37Q2If9e5pUA80wCcNdF2dD1PWGg1O/Wjr4IA3sbZIS9TeUDtBrzVk3VGsm76bO+j3EXv76TznJXyLJ4Bwy5cMtumAGey2hsPC16bbZso2/Z+Tl3WXd3NXs3SjPXv4jn3JMqoWyc+SQeY4i2iLt4BicDzPhewbPjL2ldgilTd1p7dw10Oz9EcsBNwjbpJpESzU5Gbkb4y2SDn7p5m1fkA44+Ebp8HbCIYiGw+UduLup+sYavq/9lpPMhEmqSWuRBYfMx1dPV4GXbJG3LjILn26TON2GqPtGBPbvV3N3eAvuavRlTBW/2N5lM7krkWTw6QghkDmW+zSbCGs2+8hMOlxjpc7bJSycRyYWzd26qv6pqlqj2pgbu+02ZzcW7tkf/K7sCNWeLxQMaJJTk8pdn1QTkJsIabVJTZNSQUBE/auvR+Q6nJ3rAMLhfcaS+GDAyn7B3NU0zC5aE/5FQaTWhpfMsPmhY3bgxStXN2n5Yyg7B7krBkgCx6IGMY2j1QXjOIlUALvzBC1u0BgfutveyHLwgveYLTatVmcn1XftvilL1CdRzhsnSvyjsmn2bXdUQ7Z5wN8qb19pOXA0huxBUk3k2F9wumAapW+h2JriXmBv9CByoaXDVibSAUyHd2Gv+1yXvFirsqFvmxC6SsTbcnY/vWteUu47dXkse42t/RKz975TLa0hG9AaDSgKBZCOwFs5IdNBgA726TYfe8/nW/Ne3W2+fpc3aqHcrU09zVe6QFnZ9pc79VtnHX+N7OWPO9VkcBl8Qjis16ygdbzdxh62UUUpDAz2nhlyHZqku2319HWKV4uGpYbdvk25iIbSwTZjSbPwjOqMFe19mVw97Hnx/V8vNKmzuzocqxnOExi4uABSjdtAXWCwlg7gOohEGMf+IDMjKuluWz93TeBl+3yZgbe+HMO3kdQGhBJAzhkafj8fhB+aiI/3quhYvEIcxo4JjpNq4JDlYDKg2t3JNaxtcf+wPp0nWK6FxJtNt8k79r7Lss2HhH6hmmE4MDxR+c+/DjSwwdH3kM9j+qX9/tCL8xK27DxpspzUEOyFeLbdaj7qQux1HLZJuPhU4aXDDlfqnGeVOmvmr9vFtstcrdX54St9k3gaDWetqueJtuL7DVHci+3Lznc+8CZJNVTzGEc2bLF20NdbJ3yhPh2cB4XSbbZEvXyP7janGop+kYq3Glr21WFjca/N9jP2utD7fYZDmMkUZznJuzqcHCXUvMugmbo1l8jerf+ZkQ6o6CFU66gxaYxHdWZrLnZwgYm1i8wLVxfIJHwlgPAofvf5LPb2xbfqhiQzEZJqNuxubVJNpIW7JqUmQeaiQTnRMTOvE7grE8jv021hkm/Di3gIFr7ayGs+2uMS0xPVqSufs+uDxlJ+uMz+OvaxI/O7HHQGXZZzhwwXP/rVmpMMPuzaYBuwc1dxkRcKdtwCbpJJe1BSZ7bS4Ot2ms0yixr68kl+T5AOrEuziNmRFd+1JMcuQ3TI/CincULVj8DAYRqxu6CjLELUwNtxisE3uBS5fvFOPqzUWWvw9QFpiVW8lWie6FV6bV+m4r5WzfcYDhDu7hwyRzATPHHMhaRajLn2ZAc+2bOSWAHbdBvqjYcSdeewhd7MJpoOqwy+7vNdYnKtPnUgePkXdtnRC3bFVvtE3VenwzeFXjQPZ55UC9xDWQmXVHPRNegEqYZhyO15jA9g6YBrJL10iHVmax/rYL63greXJbpkqvhk4OXzPi7OUSV4mkms+2+IvKEePB3MsItJNSGSFh/hk2pB2LqrMXT+TDI84CLzbpwG7DmA8B2TaZJoFOr6Bpr53Um3wHIyY2N9VjTgo6DG1JwvWi5FPdMmzw69/F7uoqTaNqy3cNS09NyhhZkJvJNPXwyR2HEVd54EbjD2cfijsQ5rtHyt5GVLNHlrVXLOv/K+eHLUaRbGUnTZ3d/I8yMvh+b2MMtpB4MZfCNPrIHMbVItpCMCfcdgpI2p27uNnlmIubHBQsZCHRN8V3vsNqcafsBrqGvbBVHXH9tkB9jbf2aSP3xXdsQwK2LZ+Z21kh2frBuShVocXQrHRpliya7AE/RSY8xug6cwmFKHGHOj9oU6M7Rqy4cczTM7S3/stmKFYx1+yGuoN6fLIJQYLh+O5qlc4OWfDnycl6YU/dgd2obHpok71Vt9KcL/dzWDdRkS7o6gBETqMoSQioSt9HOfjBr2nEWi1245YZHM5Mt9SdpsivoKPTNH3uPLkw+q2+/LUrPrOHwwFE0HRP7ZyOtesu/dVOxM/2tlYK81HC41zkC7ATrPDLtJUk0mnWr5rGXC3NikGla8TkCMUHI+BupuA3X95m5C0iGH4At1ZrswRT0eum09yzbXx9r/82IP7FjCf6DYq4+Wa7EMlgX1+idww2hYO/zPd/9UVWYnPAW/ISm7B33yDQnh+6SaGoKrFUrJ1IhqGdzt1dyGwDslLlmyZSt1BlxQ+aBEHY91YCsSvvZv8aHkdYoUX9V//4zq8TOO+Gg9jwU3mAAw+v5v3pN9SdoInfVYN7BjEu6NnfysRAh/1KnmVlAmLzYkQ3Ccnh3TWBqCrC9hGJREBtoV8hcxSo9TMtnM/3VM44Njt8Ui3zVEXx+jqgfREWYFCD+BaMhmTTSDCA+6PeDsGZv6IhQ8wcE+o1JNnOV9X24AdeLRmtRLrEP3x3BdF/MqORdewcFK6z/759kNnOHRpXfTzvNYhwNC1SfVtpiUjr6T/2THNOQmJLc/lDhZHCb5zsc6XFc31sGR99F6Te33+8ZcDPRW06YFWZVoG/dgA89sZ70YVd804eUWByM2sw4LUL2u6h+o3uzg3Vf3P7xk5sAoySWeknNmkg4Fv+sLiZW7c91gKyiemIIOhxCey93Z7DEBZefbhzgrR/EpPi7l+IjETh2L6Dt44fvRMEnG+Xoi7+GRy6vKaOzb21LN3ICQcA2/LB37UG+OjMeiPHN7OIUS3Xj0C9ZlH9Xxpn9eyaWOR/6p4WweqR1557+zHpogDvQv7lO74RlrGM6Sw1+jaecSpp2LxBMAhyyxv+KWb21TzvrVP/+XuyvRTlQJohgBWySAEDNmjOIWt0ni///d672rmm7cMucMr82cbEp0vFxuV92qYvOBvjJ8Z7Vkug1huI86QuEu6v+LAgsOjYXTBf5i1zDWjus6Hja5sGIKbwSPzuR/yYSmdNlyU7ZQyRvEuig/uCV9XfNNm83moseITinCYFlx+gHwErRVazRmaBT+cnZkkqFpfTTZNSZ4BVzHfLLVScTMnDz9rSuPE2sAS+YdwNJx+ArwFr4cAUYeio725kFuR7Fwh8kG/knMybtWLXoUseN8rSR+Qw+cea9OXxc115sNp1GxEIOAxLsGn2mxnv7A+6ib7robMwBK1DN+dELYteR27VtxLss+9L+fvUtEMlBxMUPvd2Z1UYcZx46jl/9nO5s8UXDG2NqCUxnLN0xXhBMkOlKS4zuIwAI9MCjt5dfaWROaNRgRwg58NXhLVhvh8ifXcooVFzLwgCwqFz/OvMCHM8WT28equF0VTvAmpbMvBF0Vx/2jsChCESwJzDj3JAO+mY6lmbCE/EpVt8GmOv0LXdQ7HyrLZ24QqIFPqqIc0V+RvBhqVLzzcho+Ib8WaKMQyE0+o2wwUV4YMh0X/wCBd3kDeHmAtcm8tSkFj3G4gV1kHnkfodrFkkEm1VTJBPCA9b+/ntvWivNo8sWQ21f2MWEt8y3RNAq0hBJnyQy3QoVtHTpOvgK8zkZ0sylI+RPbEsCVq3nPXR6JXo08A/QQgrsX4KTn73vucBPrAodbNW/Bq9KmXtkgGqygHFvv/UHmhYmJQFWqZbJAGNbs6FBA0o5Dul0TmQfGuQlvEske1o53Hl1D1RWS7a0BLCJZHPwT0+gejqq7u42IFBdKZtQtwVFBPXCbVHKKRTarhQjzBsieR5F2GjaTw6Z00BfM8zEvZ5aZo7cTYF74mnnbp0fKO70jhFVSzbIuwiiDT8HOxP35yOHsS0ZxLwD+WaTbTNsz9SWuboPptk4XWLDn/uIsHOYlBgG6vKMd/MKOFYpwQ+nKCyhiqpuCg5eVLZs9Iecy2HAH8+q4hh09AZp3CveIxeIR8LpHCIsImUiq2Zbxy9gV2zWO3BW967cIrH1nz5fR+903UQddXtysbov/B04dzryediOa/CSEYOxUEplt5HpHm/gXs+VjdBfLa7mIY0BGd20XTR7+ds3L5LXN1SyYq/tBWe6G+l5bGXA/6kq1RlIND6WSlWqXrv/MVk6RK2lYJDNXz1csWGFkZAr3T4xdyeIOF1i0gbdGQxuwc7JYvilqNMeKUX1YmeTo8YbiQUd93o7dxfzzwEy4vinaUAjwEkvICw1D1FUkT7AEiu9GL5C7jqQasNpqIrxIu5SwGVmesyzMfmeT7Lxertfr5SzLnq/gXmVGM5vEvhlaPEZRh4731BHgdcMA+lx1sEDbFl5ITKy3EYdXyxmABH+8zOSpnuSKrmpnoE4dXjLvDUkKcfD3paMsg3iYN3iAeeFwH9T+cfx9OlkxBu3N9QEvY4CNos32UKVRKla4LYrhcFhs0yiK6L8sElWcLcIXV3cmifGZKfCydFtOuu0z82terk1jqFmD6alss4pTkMEsHK9QgMyrdSjP/Ur7YpC727Frp5dk3kZ7Us9Nal7215a6I285SEBHPfJTzEuwl+ETVwgL626/j1v1uyVD9swgy8AZcchW8rMA8H7I1schFD9gH2qFTi5emRZo6LSxu6iTbrehbpENTBnok5Jr3jzBUWCcpBB7r55Rxe/G+MDP79wg+zR/ESnZ/L12BhJ6C6BQm+AtlrV3SVoP8vmJz6Moit5ajF0zr4Vu2Bwh7Tvcj4EvqSYHpPRBx+gEu2wEaiehRqxaDMTyq4h9Mzpy8O41mDUnKxiHWWhrZmny7Zt21Va6bSWGFoPSzM7hlzOvR/MamahkXd1S+KXSriXuYQeCbUBTsDb9i/l8Xs/WA9cfL3uW5rU2bCJ2YOrEzJck14okfqPHT06zevGW4woCehGZPcy87gEpSjN8o9IyXeAAuVagVt7MAt/zL8PNB8NuuQlT8Av4YAl4iuEJkg5oAJaOmVnjg8zA+M5xr2Bez24IsivH0NyqPiBNd6U+EUrubIC7crSbKyghsiIdT/y21y4bCtHT3F8HJOMAMbNq5lY2lB33R5iXeNs/yhHCfTg/QibV6KbrdxRGnDQNGgVgAYo1LqNoW3LiPYhfpo27ajzzjzB8nogUnQ7zggnGqq2DNYDl0Uac/yB4k9y4CIW7QclTYRiz+3qg9upcMmt+4o0obynztMFb3gZe2K+BxHBCjoN5i8WtGTacEEbdzsdghLCeO8W/YXJXQy1V/JkiOArEyl9XFftBteOqYTuRWE41TtVdDXubE4Lu+77B5EwTdXAPLQ66qHw5eH3dTU9TxLzgnpJWSZOKTIRqRuCjg6bFtm3ZzOuUDUGAUkQE2YTFJop94vuSmKDYMmJemde4IzERWI0ZRC+nL11fordrp3WyoXybRoZuU3D915s1xKSjHZUKUvJ+HNgDw1BzrGOl6IBptFmvWbwjQehVEwPs6rYOJovb4rwli+Vi8GpeTfKAEDi3RNnO66YvTNUo11AzwFXeybwBtv0gk5BO3RuYGd1A9bcdbbjlbcOVauQTNxWRvZwkcJPkdFqve4P9JoUq4ZqVptvjtvotJO+uisJJ+ro5tADX/km62ReDJUWwtA/39dDiMbKogwKLTpFvq2wQpThA85otV51b4yGkaQD4JhfIPAZiwL01e0/5hEpxc/39q5iXtLiN5gu83kCozHad1Te+ZbhSrTFCGFyoT+sl1fXDYn+4DbgiiHD4oFJ3y4l3E44O2/1+O7oW+fzjsKd6edBbLtd9UMDRPrSYdIl5iVc2CCOWgzzLwdwY6sBcHiBsZfdFQ9s6qFEs56qkja/8xdWi0mbegYt5W16WukgUA0rtoIZNb9iKu70NqNrHMUJYityTBC6LFOxG0V1rWwyPXDUct7vjR/lx63HCavvEHk5fLGdg5Wn7sptJ5mZocXe4t002cIMWxJ823pQ9HQZD+3uGCgUaqUqNM0ylvHSNhkK1wxFZNjRvcRvz6udhF2C6mJdp3qvfMAIGpKARwnoeoGFcjlyGvDtol6+RyE8w/NNjHTdheNvjmXQ4qkNQBuYa2PjMlHQYg+q2DnFvK3iLteklIzSe6iYpk8MgXKT8WgqJsu8CMYEIvV+zC4ymdzMvucy8jhLhBvNer3nNVUZWWYKZamMZIeszymV8LzFTHA/hfbwbpRMRJhPw3d1znDQ96BOAMXCPS2DcTHJlxcy64lFv8zbwHRvcomtFWyR5oPdoJM+BN1TXFMnBvkYwK7uk1aHGybyD3jy+xLyk2QgKBnIb4CU/oXnVSFRvpRqj3GIIFpUM9/Iuu+xr5FH6vvMcGO2ewPMp2B6OOdytASyfU+iS7AT7tjKvrGMj2oulkwWz3DBvsJgHpsWCriCuVX8l+Wbn2squEhwqHuuSDfdqXuJn3oc1L/I/2t3Ox8yLyMIKCLl0p7WtJA7lrYFPz4dYMtYwLPeSdtFdwD/0uBD+tTRMtx/4SXEFgWJm1uTBbijf1jivyLHBTVcsCxQWsW4bRLGnxkHxu8i6XJhbFsYIhaYm8yZXxHkLb3qYNHpI/x3NS3Abshgn1Z6/Zuvek4VcJlMBmsRH8+b8oYLeTp4CYeS/n+NxkT5ymEbh4Wg9s6Ioe+umdOhW1KHN26AGRAL6DCR9LtT8J17aphxmIsfGjwZHPYi9nsnw8npHkExwyobFJeb1ddiTh53+Dc0L5gFOcbfz1dexHDaW5ssH1uGDBdoeO0YaHnaup7fcWNIhV8VtnUgWt8Z50a5LhHEXMtiley4ytCbTALQVY6h5KtfvAUwtx2T+NBjconmxq6zBvFM7CRyY3j6iMG/ws5oXpGRkpZoOM4yj83boWOW2migK9IlaL3dqDt3dRLs2/6oHVg3pwBl9V0XZyqpu60xXktY4LzPeaguDoFnuGuNlFNr98rZcq6iY6DzGH9mHsSycekOmHg/zNiopbLumlYKY09t7DITK9Mc1L6DdGCSEx9W5OuwKFzI2qQTdNSuyPutvRwd2GPsXkfcArkPTx4OYGRS/+01VVSuQsIi7042vfcMmijBhgpiFG57A2Eje6Uyjkb+/vP9OMUPJ4Tg2zSEQ8xIv87ZqXnqH5kpyQ9ZBo4VUDcbA3qp5CRwwYJJqWXamyK0qJyyG/Fp/FWajNvxC3EbqA3+nfxa1/h2ebrNXcdyMqlF1Xq0y7DML/v3qtnbwlrAaQtDsWvYoNcw77/WkiiCmTHNYo8oFVGsOzwifbGh6G54ujxyEKZWfjfO6RgivVmf2tlcH5wVZRGUB93luEnFR4zO4QwQxje7WpF733+BHmVQu4UulA3sZ9IWcV9Jn1pVtW2ucV/dYMGky7sYqauODieMFsxSajo7knZ0LphJCKmOzX3Mw7+VKiitq2ArMvM44b3CP5gWNGfSAlNW5GrFFsetGxDadaDA9vtxHiTDqrzjI9ug+z0ZinVfnsUgWd6KnTjvz4jwZD3jNJDL1lDz6k6LOtTKOxf6v9x5gyjYlFkjzcli4N2ztNWyOy8QF5vVr3l7d7ueF1l3mITuvqleOXIrdzd4pGTaQHaNbBW/k1bJueRBd0r2RkQ6up8ulA1uvo/P5vMLjg/5d8r0Q5y3lkDKCrDlI4+aJ2Z2JWBnFBTOrIz8kaAJSyigakA1XxHkfZ15/nLf0My9Su1zurs7nV7oE7468kuGGbVrkE7yR+7vIj+KW80Jqh5HnQiGol76wX68Uvp+dmBjfHudF3jANQt5VUREvRYmxyWhylmEKHVGIYSdKGOf1DD4uL1YPO2dfBfdp3rZKCpSYCD7//KJLQneUHnbO+NO2mtjYiTwf4QWObaPUxj0i9z4uQuSbOs+3YneoBPW+slf468/nf9RdC3ObOBclDWA5MGMVQtdVtkkbnm4yk///7z49rq6uQAKSdr9xcGabYOyQ9dHR0bkPsevvqbPu87qtIZhlXrkcM13LrUqQpAhoZo6cubV+A+s1TpmX7WTePeD9sOZdcRtcGzJd7fNLQ1d+wkrt1tPIg3NwtgbD6Iw+Z9V9MJ6NgWybiJuY0qlrS77yeKPNJK+ZeeOyAbrd+nYDCmHsJHLzrwOvKX+/O3s2L/W6Fv4b23Ib2L52Tx/WvFG3wWvMwE4vbxq630Duhlc/49R4FPjRFVoAyFkcpNk7rGQRGXROOij4vvl9qK8RvhsLNgAqacF7/s35w4k5laCgankSUs/k+z2dvJYP3rYT0GB/XfOu922Ibpn5IZ83Xj3spZ2DZAC5+y0oGaquaGKwyebfZHHyXVHGGbk+i636stgAUD+KMhJu++ZJh6/n/HTVbai3wHt4vvdyFHTxF2kazU6PphOv68Cod8Z6wkQDBn6atzuE3w/i4bDtNuxh3rPHvNWK5mXzCNuyANOWdMFCjaFkMNiNOGQqqEYNrCwSqMgC4KOubMwhk7O+OgK4zcgrsrkDkQHq0TIOxlX4ONUFkQ6/jPB1q/PP5fMqa8A15NBwfcC0HPN44lhywUyxmgLGo1+DcSLrNU6Z1zx5fH+EbZN5NzSv37chVDxMlmpypnl9c9hdC6qpaXl2KLRIvDXmUN+mDTylvk31SXdOpPaMu8YithFNWcpfX6Z43nupdwSfUPBXNxSTDiVF79sLy0/XW1m8ybyVa41jDIYno0et25Cr+RcX+ras58Z1PzeVm3f88B7Nu5XPO29Qpv7Db/drXrbVMccvmJhLhphDpiRDk02dO9ppqlONXw0zg1S5ZoKnJ4vrtCntua5OzZW1OVMYhKtRkU5tN46XcRyHbiqFQb5CYhc6ClHPzrTqZgz3xsJtHTi+hYHvy5lhX4erg++GzwvTLS0FeuSY8cVsMq7eT8d93k8zh23W+nSheZ/+Qm7Dz5ubh3OyoXmJz7vVMYeq3fz1K4XuSlBNoSIb5ASsHpxXVV9dJNCKFOlTwVCo0jR1yXGsLTIbfU69qur0OXlVr070LVLxNOi0XFPT2Y9tZi5Mm4EfZw/5JV84XY54Au7Gjhf5wuCC82g9MyIdTle67eCGz2sqfrw6th830O/fDMfzM+3JZ7IbHvlPzCljkM8z2xFtw+fdrGF7fgzt25rs1bybPq/fD+eXh902PONOqQGiSR/3KLlX9KlhZr5aC/5+EoZlU1EjlC7mYg091aNMmJdmc7rvDdPLK4cQCrkEbx9SBoD5RkQ9s8L3zPKclol/Ip8Xq8UwdeEGCtgM0RofADd80J/540HvbEZs3h8HPl+wJUFBHM1tmOXz3p5pA0D3rauk+L1f8/KgbHAdo988ydBGTH6jDRrNvCFoW4HgwXuwc39TY7ED7zTMFfMCeM2YWNL9UGsdIoIZmVUYvMcvFr3yN0SmkNoj3xcbLL423bDl80LuLjV6fz4kZC8O44Fx6y5AHsPdKfGqjmmb8mVHhz25DVWgkkLv05qTLpGkl96W5r3ji03fAuCV0D1/pXK3KCJBtVLA+kmk4fSByS7ZUoopoxusbMBrFdlS5pVXOIDyCmE+aByGmZeCVwqGnjtLRKSwAIx5Zr7roCos3G40n2jBZre5xo2Gz88PruGR3T0TrF8MZDzlZInKktPtwsD4s9yGaKM9UklRrfq8G5oXdhzIjUP2j5O7kaBaiaJWpBZK4zAMl94TA8Zt6Ki3BkASBVGggznjmDcVyPf90MlVG7eyQ70fMq+U1/iQShvB27fy6HDYyRGD+nuvZ+aVrHwa8B4eTjTGlpweHm3PaVcTjH0UoB+fq0CDXc94RPPOmk7vzW3Qvy+JVw8nG7kNC+YNygZJ6fdE7tZFHfuoNWqNPyWsKJCaU2Qu60yypHK6RNOYcnbA26AkgTwpCPMq6vWYV4kKx+Dyt6BVMKQavPBkKxrqlCF4L6U+0yKWhb5fOdDU7w17ZgvH9/rWbFs+L6QM0K1IHn9guDvHOsfn75h5n0s0/vCygJm3rbyneT/OvF6XPdpzapfmvfc1b4x5Pc0QkbvVUDsvgTBv1QnrLFiWNBfod+Gjea+xaBSk6YINIA1crMErWqIoFBHbEaJgLsFbgVgWGLbQi8AJtMLF+CDCUn6nXmTJt+52CN9fZ1rf+mmYF7Nu7Ef6/Z7I2+8GI9zm75oo3P09I9tGqc0D1zRvaMG2zbzJVsecKqZ5ExbIbQgy74nau3UdxG7fpnrmt3yHmrfX4HUTPh9SDRkD7h4oWUtaBSQAb4UuBPCmvqC0I6ADiSzAsOCabOlwwUO+LWFeLUTsiwY9iBT3amM6OJ/0vunw9XSl4F31eWEjS9daDBPsE8hjcNutknaihKzz5Omwrnl3uA2Hd/Yqu9/I573jm8wrBa/nMwQTuS9TZpBruEw45uWtAVFm5+Wxloi0hHqpO0uyGkXCuA09EPJQNoR5iXgVGnRGU/Cq79vGMW/lmNfcigde0eA4GsyP8GjSyF9WEPS+veb5FYKXbWjem8dZwzLSJM8l3DzkVvQmtPfS0mxYat4PVFL8Ua8y3H9+nXlVGpkneIdgQNjIXQCD+iodD2oINS0nU7xcIlUGP4CkvhBE81bdYFHqFmxuvr/UgLcm7eTqrG2nUg0cp3lpdHjJvEQ2wEPoJ9IihN6hsMrBUO/q//Gr9Hmxbzhz1j22b87NbsJgvDLX2Jm5veL1eu3wx5q3ejfzVrs1b9htyBNCvBK7U2By7SegW0tiwtO85pTlu0qvk7IRvoc2ZFVnrjKygbetpV6yYHN2AorVNMusThECl2/FZB5TUQrNvKB5zbUWolVL71f/E/rjLm2pY8VAvffXaJWt+7y45dq8hz/sJsznypj5iS2muWl1iGnevZUUM/De3m/wwHvzeVkgwvaKLplO3/0SWKtlZtWORKam9BHdBn/y1ifgJ2UaDOBVZPoq0LxtitRrAKWUAsY99Hy/POzT/aU3x0Ut7IRj3kmlzqPxofjbu+fGs+9IzxQqHF7z61ywHdfqyrnbf4Ku64318GATwn7+SFAKJ46nE28TIap52buY9/nd/XnX83nvd2jeZFM1KOL1E7lmzKtPoYPbOZSMGTpX+k2s5uWdRdyQGdmgtACu1waF3bIlhzIrBAmUmVSG45dWkGFTSVRfMEpRtc18CDTBYNxQ1455VaDtCoMUG5nehikXSPFBVRFlvFi1P83fj/luw/srKdY1L9uT21Btuw0eeIsQeAsjG4X9Rx0ZcV01wVnwcgVeUAcdMceMNjZzumLnASBWo+YtL5R5pwvvK3lw9ego8870TFAMHPuhFMQcAXlcXwL+tfnDQfV+zZNPZ5VhW73AcpwWSEBLU19cQEVmFLxsr9vwF5jX17y3fDvC9kIlb2hNA+snQSZg0VjZUIGb6iCkENt+cQk5Awl4oea1wQm5FrSaV9TOKZtDchBkPefFhpsmkphTNnizoMobS/yz1aj+u7XV+00x71Vq3g3wqu43gRmDkd2EtTIOXWRr4WOaN9arbDu3gX3Y510QczCrTI5NBG8dY15YrzVU9lpM9ga8wtO88OSoQ15gu5qAlwGvdrs6AL9j3tExr/DB2xGfl/eX0T7U6AiBVyW/uYHmxlxxCdoNwLxaNrDPyLxer0i6oqEbtkO2wWJrtmRBm9Uu5v3jPSlW83n9Qgu+RzaEAlFq9p95DXOflyrPFoE3mEZRPeFT0LytQOrtA+B1CTuUecGM4FBCqe43pczbj/II+yMwW2AIjx5dYd0Ghd6Xa1yw5Zvg/f09BF6WU9jZ4h62qi1CvSBCe1JU//WeFP7Ty+ph/Zf4pT+h+NpY0JgWhIdHEu9SEOpcaFd0HGwBfVQuZwd9XkWFHfcEQNpgro+a8uthHIaxJ5Fe4ixbJatvBd2GIsss5IeyWRypCIkiFWNzkvftlV3ngm29urGCDjnLnYapW6pTeoNxqsfqEGdeRi2Lv8m80Ro2ppjXlzLLjjkmzO0VUIR0g4JCatMEALyZF6RoGpdlVjvx6mfYtrh809JCzuHcAy+iGeIcaZlZMvaZV0CtUWpzL7kLUsBFRqTQG9Y5yDw0Minx/jonnzCrjDbLnYOXvPL4lOfBHV19S3WhefN9XSIPi+bS72XemeY9rPbnNeAFoxdkb4h6+aC5F+NVwiWjc53tSGb5jiQ2zoYA5o1pxKeUer3wcOUyKMcl8/aeiklpVhlJMVPjza/TFKFE93lyw8v1ZaPviLChJvQGnre12gH6ns4ugs7pv48rbgOL7EmxUUmxaZUFe5WRorrb9Y450KTCr10LZm6PU9qkEebNJICQ1FTubbDkwQhRp3kVmkZfNuDPY2nSF3AYdKnLbTiSrDLTXcSFh139hh0AJH8nlBWpQhQ1qWU7XWk+7+0G8x5VqvlSzqrqHnJRYCbXFy082v+H28DOcZ/X7KJc+V5gyExh7P4NqVehN9KrIWtsaXtKKylUpkHq1nmS8WzmWI+HBUqToubV74VVbpDPiz93paZVErZIZ/m8KHt95sWcMl29QbAbzkevhsLPy2HXmc97vttqHvr8fR6m0MyUPy0aSs4u0uu1eeXvngWbK4r7a1llZIex3Mth1tttJqEyIJJXZuAbLnnXxeoL5uXDNLUdqlclVyFFZ5hsDgKmeZXgVRnmVVTLPfCWLqddtSNtscl5pwswuX2uUyUT8FVQzUveo2ptxwelPyKVQB1t/fTPP6/sSsF7ethqR3PzL+xB4W/Yd/LCVMuLEtjyNdh5MsHNbvdYZe/OKjv/j7wrUU5UiaJYQyMJVMGA+khcn+zJVL3//7vXe9+GbkCjCTotkyibZjxcTt/lXKuft2/KSYNwx1yAGVH0ylBFYCuleJfKIDKr7CUuE0hd1y6qu8lfqXJgidwGeiZY9kPLgNbKP5aUbQuq2NZrWMNGat4TUuUWx6qGLabgVUy6DpSChHEaKnXLBOH9E81R9cmaDN5tLNX3JHhOdjYISnbvvf2za/q8ZssLePFADdt1vYd7V0NyevNtpe+q7l0m9ZqL2FxR2G6uHi4LhAFYqkpiplsjSXAhqodzfh5VYZwzItuf6yWJtLzJcOk75bwujFOLD2BR/slD4GegipFzrWFzjqNCYMeoX+tIWqt1it1MHVW7zgaRKzHYe7gH3o7lTc5jlRRWzstC1tpU87xyDKkbvEkcK2NT8DWVi8e8fJjJ4tSmriUEKtzy1aJaE8y72lBwXlkqUULaQFa03euhohM2m25Dkuuc11Xu4jZgxUSoKE1TNSG4J4ooVjMVSafugcOoYj6ZsfXHfpHoWgpOfx+DI44AE3b+M/h5k9dsjPP61/l5uarwXit0ykx+XqWG/gnRmwZGpZm4CrjN7Fnesi1IQaWYrlG7x8WfpDFMcuHnXXNtpzX0uDERElh1H9c5jYpVawBKq+VNudeuBMoQhDIMVK9JuvuZOTOV+OflECOm9+UjM3RL9Q4GhYfuPs6ue/IplvcFJsALywu1ycYsL6sMhUccgVKrplqpSaobiIPHie9GSPNa+lAwNkCUbUhuAV/qqijydM1oa8XWNUoEFe/Md8zDih6Wr6Wfi61Qu7+jpqhLklBWlhVRXw/wkWT/96JW76jeuhGnaCtmed2w4ttozaiZAXHBnI10M0SqcHh+tEF315rH6S3qjizKOmx2sccre3sd+wG7vQd3iAzgXR48Teus625LxiyvoX2r56n2EtocMdma5tE+EB7xV/9qTgervintAIRCPNKQDVrwwMAnVmu+WLkvOyxEa20T2abtHjR5njdp+L7m7+R235GPlJxKvJByp2w/vKyROWDSU2yIfN+bI+E1Bcos42O73b7qy3bb9YGdt4a9+nX1iw+4Hf879Snv3tdUgTPR6fIoOl5GI96GaH88aAftRJzF7wpJgM6uZubgC5lIlaYzIBPpQieqpjS9luK6cKXat7txbVwlZVPZS3DitQsWJona+RTqzSwF71Wg091M+pZ4pcHcwOuvtqPgJSqDS30ha6bsZTyZ2r40nee8Ar08mI+GEWTHZwZ0ULZQRp4joc8pxbZEI+SF0S3Xm8oCxbI/gDkEdp/Z+iZ91+47iOPD4jQJNC/DZ9Rt7zw/8Ebj4P3msYVSu10PBhEpG9Fv8c2DF4d63ja2KbV3Estk28tICj8NFcLTbirzH2ubh6xDdx1frxafH3il4NhshoivyTQa3zEB0RmwvKYjlOF9g8m+1FM2eiHgy2X1W/f4Gioyebht5iO0eMiY2ZV0N/Mjf9adBNmXPOpu+N6h54xpihFQ0nSI8sK/TjAPB/QrivXqaAt/hrSX6Lt/6qkOZnXmOpg5cwiqCepkpOoH8t2ZdgMipPdjVuBdHgEp8IEYMBQyGea8fu8wJdzudNLYaIne8HfDQsW+D4PFGL5GnxmNSKDZ0l3XWJWJ+Y6aqW1gUG3mnbOB/MI8WIOQXr/DH8sM70mTTnsbvA58QKE96TNj8A2NPrO4LELaqh1pXX8Q/GXohanvIzeA1u1o8GDT+brbSO9sS8NZXcx/FWkpKnNtIkiLaQ+LWRne6D7tbn3Rg60brBu+VMCUMeqH2yw+M9hrCrnjPbQ7+/DGVEi0prJ0xJrQug12HkRrmza2HhD+zGDn4fl2zubKj+d4VobXu0M8hxNYT2e8yxh0jBkjDirPTBFfS2OHhvVgQwx/CLniuW2ofdhTilcq60R/r5kttx5rWuXCbXSFzUOmyZn+96k1fZ81dsn0O5uPsyxhKWx3uN5ZgEKvACLxEGfk3aSeK+/J1vOZJZY0si/0b6UAXodNXlRVRST1GgrdL3BdAt9BGXTV/8fxH4AzKMvrHJazmbKpzsb3wK7vHHutWSbWdMucORJu26hch42lsUPqDllam+2Udnod5KJEGJvLtibB58nnM9n11PI5A2MO2YxdZN0Z24jY3neSht0dmn7JeZfn708mOSB/nHEoL0eUdRoEWVtoo+uMJcVol48klIpca3mRNe1cg+4/Kqjm+PMGLpiOHGdidxeHu7RN4n9lJz7BE9Gnvhu4m0qf2WY43Hb1CA15M23Op3AXP9BIUE3Wt/8RaTjOzOmu9r1O6e77DXaXp73fA7rMo/1qSrOfRBp0BLNwm2wT1Fhm8Zw6XAA0foAx56ultvyS08lrwXxzqJqw0+5y1vFgaxRpOwfSu6D18ze+6H3AVrdLgwDKtGvFh06zns8stfrMrjO85vzy6krGGww2GlZp5363od1DEAfP3/28tyxZMuz6t0UuD62R7IRtr0Tksm8KuHw93WcWWFPUr0JbY1YnaVP3qrNZWI0qmdCDav6DIFdO2bwf95Yli2MmvTO3GkLumghdvvVUrKmQ1SXXCoi3AZ/ZZqCfdluEV8AtTyzqJO5t6DOd/3XTziMPNmJ8HMv784GKJD4fsntc9j6Hrrf/6MfyPP+iLGsfOMy4zwx4HTY3ow5W8ObvF58qtdBxmbrLgmor3bfrPJDx/WmHQ7JcvO6A3MNNB01IXx17U1Kik3KF3LeELyG+WnWbNUUdhZeCt6SVmzUXkozblreycMOLKYM5h0zLf/zvMwPtcB8IuDJRcFT26X5GN1l8ELMb8czv2w5yNWQGsyvkKK74spT1/dOpbqvN1AFdBN+Qct42bwKWO1EWTUBJSX0ZdENMGdrYXqm2CVSlmvcovl0zb9Czrb7RxbA4bw8rmHp+27/Oi94Or8v+hUmlAS++Q/oa8fX91SfzmQVDmTplFVxmMNOKNitGLtVows9CN6xekuIiwxuiiZVqK5jL8FCUQREH7/gz87TtYfe2ervXsj9uz4vYmAB09U1SUhtssTItRT2wyTpg6hCiSQ+yEN6QI1Lmy8BLioGLlzZwJ56DnacxOtzKftq55z1IPNg6h+40ePq+cTrfcZwWS1MR6DI+Hb7C8FRlPNAz414Hi2OKIGoqewjDIq4Dd81Sx2siaLKp45wgcqrZDd2JQbXI8x4h/XFoDkJp7+78E8SBlBAnQCLkZgvt9zQQy/Ou9sarLsvkm+9Wt9nCbcyqTljwA6O2LgpsxssaT/nwsxpj+BKzm44F1f4RAeHZCjNc6Oz9Idr7EwXKqy/dKEE9Eoav9Jlx42skvow6cGghy0LRS8VKaib6WBY0o4boQlZi6whu6S6jQbWNFlQDtVLOoxIHb141Ffcj2r9W/rWuBpjswINtijoEQ+G2OkfMsFL2EPJZlfaTIZv8KEQTYlF1Vub84CHuweGLrEG1QJN/zB4vpjaQ7hodFn+B7SUNjr48QdFCgUoKdTjcloaD1lOAE+9A0nlJIm9RUBbS1nkAdhqc7qF0KKi20bScHiPrfNIM5O9Ab/z65nzR7nZSHTwYbhtMUQ+oYUTc/nYfSKiLUVWxRtLWtmhCsG3ggShlmJR2nkm26z8ycuE3ER1O8XNThiXH7te/MJih7nVkHQbCbSEwnxrh5eATGM4b2SSzafhRLhphu4QyxMbQsgyqcS0nBd1HHypxMDqcn9n2Jovtyrlt/omwvr3qNku5IxLcwTzyKt/QzXWdF6R5ZV0Ebc0OaIo8tR3H8WtVO9eFGXwgiPPgdhdmTDm7X8nTwjdeHIQezy0sr5Zn5kmfmV1FnShCBSi1Q5c4yWIMtTB1C+Ijq4qiyOukcPExhA+UDRpAPrIW43eEGRR0HzI0MYDe1XH5nOhNkvPeuzHNg2qS0ZRw2wujDorcSiJBiC5rtFqSTMpN/ZLECZtrBaKsreQHd5zDfGwsQbWgU6n2sLkMY7EKOm37WD4f803i03Hl3LhUAJherx9uMytCEcMq7/OARCAJXjy9yoNQmNG4SFGasxcYvGkPvfQlXm3UcopbPahG1c69J+IMuvuHRI2O5yeDL4budi9mKbe8VWpJnNE0FXWCRvONP5UtM1uM36JNXpI2D5qiFrisAsuByBoc0VJ3oYfseZAr1OhYMwlnR+CbPA1y49PrfsWdQzc2NyBeQTp8TVOE2giF/VRq8tMXJBuyrFlL+LItyMDTtpJa0Jr8TnIX7A7OYKPYGy0R5/eTBCaGZiCe55BUwgXGb/LwRDdOFufjPnOcu9S5+LrLt1vdFtim/0j0kWDg4xDcVDW2uNjUVhSxZV1UZcLscLMJ8qqtCG9Iu5jHlMGmdq4F1T79jh7OEwKY31Si3fEXzcsiLRXnPYyfD3/qeLk4nbfY6DrOncXjAPH9tyPrYHa8MgxqKCTkNaVhODckSI2pXs4LYRCc2Qap6pkiME+eGINqcS+oppndZ4MunIOQKoQo2+2PpPFJf/zCj8EfV40J57X8MJ3rdbs9HnZAsfNO35liDmzG8Fvz+JpDXglhr2nYIw6IYhL/lqGyEltbRNdJwKaw8U+Kp3bJBOlSqOX0jMCFSWY+SxrEL6Ns9ZgjyyLWN/D+N0qAX3ytTA23pQC+gr6mFKV4rkeIb0nZAyYLKWLoBXDnL1O0GapUA/KPTuQ/btr5xRO3L1ym8gZ96eMLEUL9AToBfMtXpv2nTZN1yFONMnAMkwAxywrGNhezB/4sRSiE+8tntiS2MDC2EH5quwsm40NFueOPq+olr3rwpXOq3nf1PVMUZnwldRhQUSc+M+Av4GaVdAqsSEoZBizluQK+edMEcHLHjxnykAEtpyh6fuCqlJNx1dqBRTYBvOjf/+xdiXLaShZtyZWmDa6SR6gYqQSSRnghvP//v+m79SLUhJeXycgBQbCN2AKHo9Pnbj91NqmnM7f/f351wALwe4tn9mzxuY1Odpn2zmG1I2kIiFBgWfJr+f3z7bR92ToBYfftUmnnm9m086/XmOEfGQ8uaSc4IN+qAeS2t/78Z6fpQ0bjWH7fl97lmUUDWJJd1BGiIhq2J58Guf22FUQHVT3fT8HNb3bIirtQDDdIy+kxcm7yWUzNM4o6YOcJhd6gimcfeDl04h3f/0yq255T0kE2NxP4/fjioAsruBe/45u7/XWHLNH+UZk7Re7lREq/NLse+IgW5ZfL9J9d3UcLPbOMY5XybX8m4bZTIkV9FwD1+PGBJcMETgGphfUHx4zFM7OXiUq1RLfzJJ3cCXr9YBKtdZxSl2p1d4HgS3fhJ9RBSHA6+mSW8i7NtXWALuqv80y5dRSLFUDQw3Hrwr+I15299m3r9K79cfp8T48Q9nJ3MkL4PqFrPFx0/IvMU59zD8x05RTczjcnu2pATO4S+tDa4Xcpkxr96EIyyuNw20sy3Lb1EuHb7nhyCA2wejzhCk5ulzCPj5P2jyYsmbhPxWukR6LWELWgjcewyyD2OcALfqNB2IHMZW//6iS08KGDLqgQAdT0QpSKJrsvSPiGXdR36XAbHOr99uL1giB1KwEM3vVyNe3c55BVOmjMcLeLNenRrEy17yFiTJFXCxsjUrhu9pNTU0h4K8xfadz+Qji72u+bxAnefuP+rH3asSqaA7+QQ6ONXswHFFRYwMu6qbqt/Dy9bG/fXhLF7RxU2zjJoLW+d5fB0a6FUXfOslfsbfOaD+uuFnBq1Q2wje5yHJ5ayOYK+zzbc72W/eOBhvGYoh+SWw9tPVp+zPNe0aQrrfS+HaXNRDb2+8V16JykqAd5ZomhxVunfP1vL9MrSUkcv5fzvZy2k6DaV+5D9mv9S/s5HM55ucp4y8syaxuaPA3gzcs8h2wuvMTfVquh3ZNSdZnuzVDy/hWMXIdPuW6f7X3w7tOzvY0F7xn22+9LdlCaqz36MfOvZJWP9DVayGdkJs0k/xUHLJL9bDy1+stLRt7cGFTzUcb7dRmUb0rSD6+5BS2c4AJgc25IOQB4s4sth9lqgl6af9H5nesaidQUbZklthwm9tRr2p8PxLzA1XQFn/NsleHQYrOkt8z31LkxRf10XSvwz1RQbRd3O69NcfeKIcRuh1Bh3DJqyrZC7gXw5rwTLwXg5VmmnfGQeb+TZ65b5i35Pm7L5Edr0Vo/5YRQBC8W6GfyIFnOzzkcbp1m+RtXuIkU9WS4bZZpoytfjld7OW0ug2pK/Un1Pj8VWQPOHEqES0awFfzg5D/F4GU+FN7EG/SGy81x0vFTKbjPs44QPcO88hglMq+9Dz7bgLJBq2ZcCXbpW2R/L9eV0ov6lELyLaZtHT5SaYwp1PJ2fH/9QVBtdzlT7Z6JF8WqRUyZOdYkYCKkRmRWAa+7mn6z/1bnSrETC1OzBsfPSKtIpABeplrGojA8zGVXBHjL8sS8WvdCziCs3bGgoy7+C3vv2DILhhZfD7ddAe52+3eDaubOoUvMC4KXeJdwWTL84O8ukA28E87Ci0SwHI1Q3UpY29LqWMl4P6HaUHBEzMvSQGkcw1ryl2PdtqM7DNj139KOj2Fbh0m4bZtq63BFM6SmXmzDXk7hCOHHRkllSJlMkNk48i8ZHq+xcNYx73C22zg4+Vr2ElqwX4GW+TgnGRAwr1sJZgJde/ncF1rVZ35qZF6tDkLPfVXXTSvyZGwWphsC7p2vbktMs07Q7jYxIAUdsl3Q7TyKSzzWa7C+LwV2Wbuvmv2akErrLg9ee5O2gbqhfSsoLNfYY8k+DpOmY9ccx65b8D6jU1aKcMjROcOrWvB51xHzqp6XgusCXluFe9GLMHq51IttHdgz+0Fbh92s25D2KOJeTvqR/xh/BFpVo1Dj0OEnUve8PCvzTunAbbB4wzshyaJURdFLHyLxtygDHtla9Oen9Xl9fnoaMr7PAH/DyQrZqeY1/MB5T07mgRRySaJ3iZ+YywopbpEOmKkzWbmllniXI4SDrJHHxgutw1CKRUAlN6ZaI0Fm4/qgDPu8xLwF3kAdBgYpmmUUGOOl1oDLNid6i6rGU9WK7O3lmpodCnEbRCLjjQp8Ic34TAqmX+QQvKglVHFrdVuA3s02mcsedDunXk51UAB11w5Z6FkWboGPjhSuoK30HM9SWx74vC3NAzSikssziVHgbxIA+bpnSXEIjm8abIRMSFVpYf1ANiDz1uis2S/OsEdAVP267fuu65qFTnD08C3MpWd2KR1eKdyGoN0Qit9u63YeQ/exUfKXw0/WKc6INI2FS1UrSZTxmrcgXxjJOkfZYBi8DauGntZcZCb4nEerNLKQVPkQGLoNKJHFZR67vb2/rivILJOjxHKxq+ZS1FNDi0+braPf003dzv+qzCMPZ8YoE9SBq+urxEDpSlqvMC+s5xCQBZsCwLMOvJ18A5qRdAPMNvGRqKKXsFmvjQSVPfOy5qUFG/0b2g5SzbQ2esGEY7xfHg0tvtYR6v3tuEH8bo7zpto75eFsXKVaHc+yfHCvgBf1q3MO4qRyRFng8xLzqrrlcEPZYvItrsxY8u6LJzIWRoIj6QMNlgaZDT0GHEhNkOb1zKu6gcMY6CnD/NdC+dz2xYJXOfKNpEPKvn1+//z4ePv4mC2YAEN4E8tdY7T+wmNY/4fglWSCrK21D9kHrkzIvLUuimrfD5yeQEoDHoUo1K7TGt1ymkTnaiDg8Vg2IPNK3Y9jXvR54cNh2mbPoVwN575Z/BIlLFJVcRf1RIo669/Z7f2yl1Oh/6hu578QvL3ED3oiXg3zx6BMCy904DZYJdr2bfs0rEqvNELJC2ZarXjFVraF+FsoG9hWAPAaV6tmmfc9cz6v85wlRp2vymzsavUF2n0bqRBy0mGzuxJuS27skPkcsiLuafXAbmA2INYQbgTeuuvtAt+dYaXgImwAptWqdElfJepXzEvrmS17RQE7WsyJRtNO89qnKdwk+Fjz0tyMMXcZDQTgVdbXatF5KCZu5Ru3dUh5ZolN0s43Qdr5nRe3Xzve9SIbKE/BwgkjYHSG0FYQHg5JEYh3T4VsWsLAKF2rkbLLUMayPmC3IaNMtFjz5gHzKt2xkeGfJS9pnbjgjy6cwFLMDC0ub4TuTC+nqGXGY7u0eWn1heC1XLjKJHEX0mwdeHOf70h3KIfOje+AvDSAGegIMWtRIEi+ZOF8hF67uvhY82r88hRWUGeiZCQPrS+Wb8wH1oq+KUU9mXaeGiH82KbvtxYbwDFvJvE0LnCY5PMyKZYWuwUrMbQsyLGoKK0Rb9XWkrkHsuFVmNdp3ku3AdHbjaX7mvBRYWykK+vS31FqCMXB4h91hLq9l9NDM9zCvKqiDFxGTQjeILcG4rkwxUT8eS3c3MIq70B3Xo0VsKkSt8Ezr3FMFfu8ZDkVTTtIXptAuNeLT2A1yrfAkLYO3nU4/lA6hI0ZdlEvJ/WwyBLMK4lclnlpwbbmaJqL2ob5vHkpt25r5a1H0BoUPlOUYkm5YFK+492GiHmNnkTYXEeaQzv6vHa4E0fyFv9+Kp9pVt/SRT3upx47ZPoPnjHxS8ELxTZ9QeBdBaVq8YItG9Zjxgw69pUUsEECTS5ZuXarCJH5qzMWvM8bug1KNG/mNK/0HCmarh1dBYa9OKgvAF7l6/kw3PbvcGJ8ItwWjxDe7C5HCD80ww+CFFhvibZuvfaVklPNm7cVJYijhOilJF0eA+yHBjbRAmeuPWPm5eQH3+hsyrwmbB5d7/uzZ9/uCzCvbx8kXdQ53La5NrRYHLKLbuc6RO4DvLPgPXAWWL6mDNyuh81Raeg2QHiYZYWFJusMMnG5/GIY4SQ2F5q3SslNwggbPzlVUrDmlcOuLvAYoHTVOvndL94r8i/PJNo6bFLSATqlRzlk1WXr94dVNgfeZmB+w3AZFcSC3TWneSG3gXN57YLsicovIf9XEtOwZKLMvXUsykLy13O3YFNeNrhKima/Pxz6vu04e82tHr3ttkhzzPjmK+G1hZpk6mxnm0l+n6adF0pHDZGDFW48be2eLWAEb3UmW3bFQQUuWefUrpB5M8wqK9auDK3j9N9mLGWRl/kiTIjAufSxiHmNZ96nwOe1zzoMQ5atXseKe0110iJiIeCN57iYGZ/M4W0abpMRFt9nchnCSrUwqCb5PmouFzLsUnjnRi8kI9QU7MWI2Spi3swzr+5cN5BzhbkPpuNcB5HD3C/EVwmhz3vBvCb2ebWu16/5CrVzw5nEHGpegmyQCQhzcJ1gLUhqKvzQYnYdYGir0O/r++dHbJCFjRkueyKnGiCrO2RfUqyd68VwoFE/EDE7ExQD2SD5vNTlIXDXqC2Oz0gIezUdIC/40m2YRtgyjEMzPWd0PyOFzZR48X9yG4ya8ux0ptbcNKVg2tY03AZ5kidIh/z8/Hh7O25etnEOWW0kMdUXJyeRHPsRd6YiSPSOkoN43tP/vDisc0nPjd2GgqhaDIcWhxnjA3Anh9zH5zAiwWwk+bzEoSqKsDm3QRaP8MA1Fcu5fM3fbpW5Ubcpnr2+aTomURXJX9EIiw124QWhsMGfYeouBNUKwr/+O08XvzUOx+oPn8tmoBb4v+2dW2/jOAyFlQ7gCumDgcKY2PAtm2Jfumj+/89bWyQl6mLPZbHeRXK+FCmQOJ1genpCUSTFH/kvt7nrmm7or4U8LzsvtV9ywoH6L0fpG9ZDnWSH2E2LXH6TvUQVaofNZxs45jXDTVZ+1ETUfePqsttwqHh1MUHis2ZLq5Tlq9evOqGND2B5c+sz18T2lnSqxa+rapd4qYtH0O1J+SliYarF5fZhJ9bbt/Pn9dXvBBeyDdxrSaKbVl1OMkDvXUacvnNUvDZouloxyvOGvEG8SSHOaykP5yx/Hrpm7OUH9+2B4pWTBHbEqttNlFjb5WvB3a007dol3TRN98cll+/bWxLudu5k2qaNoZ8b5BxJuSrasDpeyT649Urqlnpv1hlhUn4Tx7wn7mGTHeXT6fXcqJD3Ont8+nbkwM+Fs+KpJtseptqGdUqqX+/deDQPDSszR2UbikcjacGSEZJi21oLNTkfuZPb+tWNF73fFpSrys67zl/uXpgctxxEzWKu6pIhmySb9sCHETtjJOs9eam8+HrEc6ed95V72GSimHNmKwu4JUbgD7q6nrmZ533mo1E49+Zq3rXzRlVlnHQj9319l5b8E5U2HPRrsIWUamKyRcUGrSoG/lpuf31d9Dw+pVwn3a+vjk9A6IYuhpTceRE3rQg5U3EWWDyy+dLfZuvbHPz2AunmTKWIynmN9W0RNFPMyt7w2uwu/4Ouq9M56rfG9SG7RILMbdB5Xl3Pu4Ygc1j3hbJeSigfY7xZnFBpo60zk030ykdsRIx0N3157/3+nWUr0r18jXxdgpwBEoQcdNx6N+bAQkSc7pw8cNjg6iBDxa4fh7esz5pKjzgV56UZ6BzUNtX8Kh2XktapvBtLe4/keaOYt1DbYF1Rz4tf8JHeXcR7UBObDhlIt2S2otpWqTbRbCTYAqTey/cI99DlPuWX78tYBRZsxFsKfmDnJbGtA56C0XG8O9VqMrpjFe+qoebzxWdkabi5TObnfuPmk5+/TjR31+V53b+gndeP9fcitwOXooexkuskH3tg0LAh3LJqY9GOBdVO4+SZvz5IrBQ/XFi6H5NinHZlrBVMwXEUE9c6jnj0ekpu7rVNKADn4Pc8+MKmSQrNep4Pa6Z3mQHdr8eohOk5XJJd9+/8vMt50dwGQhZsEvP+SQnlkdqArBk+X3S33Or/PKXkoPUabaqIcOsoTpDlV0G2kV5XyY5Twrx83UW9gft9fSZjefkYCbms4CBgFwwHAdc2HGH3sM7LcuQCcDd99HS69WNrKn8akBzNM9dy8M9NErqf83W5vzpblnYHNz3EPXulWrWKz0m58sw8yTasTUfuwRMXoLk9j/l2PXEH6Ol6piIdc5jzytTHyse4jbiukm4U2450K3ntokt3C9zv94so+OPycb/PGnf1pg2rsDjoN5JvI+s4Sqo9+k6FP4+0Hab57JinodUHHzTkAdM0SDFTPchDbDLLrQvjiJY1INvPNJJZV4O+zHtceLjxR2KZqhnn3r2Rfl5PMzzyw0/EG+UVmqbNIobguy5WGErCzZXr6FcBO/o5V26s31EJeFDq7SL1qvBXRb/24cUrWU0X3ZLNtHXF51vKpuj6AeSOdw2VeJxWMJWNcjQ+aqTHjdGHyFeVn1MWnVZsuYnC8DtZHuJ3Iot/c6zzrrtkVjlvFjTkxqtsVyQ8awFPkXp7vuP7oN7UePnHKeMdlfdmi7fWO6+bHPMEziu/saqS0R7qIOusdMp4racFKVYfQ1yFB7mZIt2Jz5JSQfhVOIn44MNbwyHitZOvjnm7zHrLccNUCnfXgDc3YeW5LPZ58vIdU+WGdFpXUq5kziTmfY4yHVsqO/H5ehNXL6VXh9SoKbQTmLgXQCnR5pfZnXdijxWvs1+9IRFldrsfrtnyEEIt2/Zg6Y/bq7WthENZuo8u3vJqSNUA6p1yXUZqTVZb6heB8dPRz9DXqeeUSrMq76O3bbx+7YaAt3O8Wbps0qmHki1ro40EmyV7k803tYUcKTerAX54/GzeUNnxH/4p2bjm+tD/hZiaFVzeXeu6zaSvt+NhlLCiuHcx+mf8hT/YZotkq/Nj1oW6hc9P8BRYU64kI2FoG263RRz8WAXGv0A3FOSqwts2XpuRbnd6L8DTqNcUl5OiYW/EWsYFQ1bbGXGljqQqvJ8O+WU+sdFEe2hhK9gXSbo3tFPWC+U+mfOmLT87MrZexz4t4Usg2kKFZLhTxWKlCkhdPpbpNUh2o3hTp0HxO31KFceJkx1ql5uwXA8aatN97WSTfFfV6slz9KKkFcNSVFBvmmyezYRqnz1+SDIov9TExnJT0XIIOLSHKnnWolGSaZVp1YQ4drubDYs0UMgj/pxoy20N0ZlXRvfJZyvE6IGf/bsphO0AxBKWPPVee9tWX9nWM9b+oF9u9wUmbGzinCuwF0XsLPN2ZKv3PiQbZ2z5LyDVuUlCgq34HJoFP+fB/luwZPtbZ7LnY3BKF6UphGzjEoB/HBYrtaUb5Pnm+tauvFJmbPfQKfi3gopYdb/pvHYnZIF0AQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD8f/kbcEOY/6MSRn0AAAAASUVORK5CYII=', N'/autenticacion/inicio/modulos/seguridad-redes')
SET IDENTITY_INSERT [dbo].[modulo] OFF
GO
SET IDENTITY_INSERT [dbo].[persona] ON 

INSERT [dbo].[persona] ([pe_id], [pe_nombre], [pe_correo], [pe_fecha_nacimiento], [pe_pais], [pe_ocupacion]) VALUES (1013, N'Administrador', N'segurityeducation@gmail.com', NULL, NULL, N'Administrador')
INSERT [dbo].[persona] ([pe_id], [pe_nombre], [pe_correo], [pe_fecha_nacimiento], [pe_pais], [pe_ocupacion]) VALUES (1018, N'Luis Mendoza', N'luismendoza123@gmail.com', CAST(N'1997-08-21' AS Date), N'Ecuador', N'Ingeniero Mecanico')
INSERT [dbo].[persona] ([pe_id], [pe_nombre], [pe_correo], [pe_fecha_nacimiento], [pe_pais], [pe_ocupacion]) VALUES (1019, N'Daniela Moreira', N'danielamoreira123@gmail.com', CAST(N'1997-03-28' AS Date), N'Ecuador', N'Ingeniera en Sistemas')
INSERT [dbo].[persona] ([pe_id], [pe_nombre], [pe_correo], [pe_fecha_nacimiento], [pe_pais], [pe_ocupacion]) VALUES (1020, N'Carlos Valle', N'carlosvalle1997@gmail.com', CAST(N'1997-10-22' AS Date), N'Ecuador', N'Ingeniero Comercial')
INSERT [dbo].[persona] ([pe_id], [pe_nombre], [pe_correo], [pe_fecha_nacimiento], [pe_pais], [pe_ocupacion]) VALUES (1021, N'Bryan Mendoza', N'brianalfredo@gmail.com', CAST(N'1997-08-26' AS Date), N'Ecuador', N'Ingeniero en Software')
INSERT [dbo].[persona] ([pe_id], [pe_nombre], [pe_correo], [pe_fecha_nacimiento], [pe_pais], [pe_ocupacion]) VALUES (1022, N'Juan Torres', N'juantorres122@gmail.com', CAST(N'1992-07-16' AS Date), N'España', N'Contador')
INSERT [dbo].[persona] ([pe_id], [pe_nombre], [pe_correo], [pe_fecha_nacimiento], [pe_pais], [pe_ocupacion]) VALUES (1023, N'Esteven Magno', N'magnoestiven444@gmail.com', CAST(N'1995-07-20' AS Date), N'Dominica', N'Enfermero')
INSERT [dbo].[persona] ([pe_id], [pe_nombre], [pe_correo], [pe_fecha_nacimiento], [pe_pais], [pe_ocupacion]) VALUES (1024, N'Andrea Casanova', N'andreacasanova990@gmail.com', CAST(N'1977-03-16' AS Date), N'Ecuador', N'Gerente')
INSERT [dbo].[persona] ([pe_id], [pe_nombre], [pe_correo], [pe_fecha_nacimiento], [pe_pais], [pe_ocupacion]) VALUES (1025, N'Luis Moreira', N'luismoreira123@gmail.com', CAST(N'1997-08-12' AS Date), N'Ecuador', N'Docente')
INSERT [dbo].[persona] ([pe_id], [pe_nombre], [pe_correo], [pe_fecha_nacimiento], [pe_pais], [pe_ocupacion]) VALUES (1026, N'Pedro Pilataxi', N'pedropilataxi123@gmail.com', CAST(N'1997-06-11' AS Date), N'Ecuador', N'Soldador')
SET IDENTITY_INSERT [dbo].[persona] OFF
GO
SET IDENTITY_INSERT [dbo].[pregunta] ON 

INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (2, N'¿Cuál es una característica de una contraseña segura?', 1, 1, 1, 1)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (3, N'¿Qué debes evitar al crear una contraseña?', 1, 1, 1, 2)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (4, N'¿Por qué no debes compartir tu contraseña?', 1, 1, 1, 3)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (5, N'¿Qué contraseña sería más segura?', 1, 1, 1, 4)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (6, N'¿Cada cuánto deberías cambiar tus contraseñas?', 1, 1, 1, 5)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (7, N'¿Qué herramienta te ayuda a guardar contraseñas de manera segura?', 1, 1, 1, 6)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (8, N'¿Qué es una contraseña "débil"?', 1, 1, 1, 7)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (9, N'¿Qué hacer si crees que tu contraseña fue robada?', 1, 1, 1, 8)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (10, N'¿Es seguro usar la misma contraseña para varias cuentas?', 1, 1, 1, 9)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (11, N'¿Qué tipo de contraseña es más difícil de adivinar?', 1, 1, 1, 10)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (12, N'¿Qué es phishing?', 2, 1, 1, 1)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (13, N'¿Cómo puedes reconocer un correo de phishing?', 2, 1, 1, 2)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (14, N'¿Qué nunca debes hacer con un enlace sospechoso?', 2, 1, 1, 3)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (15, N'¿Qué suelen pedir los atacantes en un mensaje de phishing?', 2, 1, 1, 4)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (16, N'¿Qué señal podría indicar que un sitio es falso?', 2, 1, 1, 5)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (17, N'¿Qué hacer si recibes un correo sospechoso?', 2, 1, 1, 6)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (18, N'¿Qué podría hacer un atacante con tus datos si caes en un phishing?', 2, 1, 1, 7)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (19, N'¿Qué herramienta ayuda a evitar el phishing?', 2, 1, 1, 8)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (20, N'¿Qué debes hacer antes de compartir información personal en línea?', 2, 1, 1, 9)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (21, N'¿Qué es lo más importante para evitar caer en phishing?', 2, 1, 1, 10)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (22, N'¿Por qué es importante proteger tu red Wi-Fi?', 3, 1, 1, 1)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (23, N'¿Qué hace una contraseña fuerte en tu red?', 3, 1, 1, 2)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (24, N'¿Qué debes evitar al configurar tu Wi-Fi?', 3, 1, 1, 3)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (25, N'¿Qué significa conectarte a una red pública?', 3, 1, 1, 4)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (26, N'¿Qué herramienta puede proteger tus datos en una red pública?', 3, 1, 1, 5)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (27, N'¿Qué tipo de red es más segura?', 3, 1, 1, 6)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (28, N'¿Qué debes hacer si crees que alguien usa tu red sin permiso?', 3, 1, 1, 7)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (29, N'¿Qué es una señal de red segura?', 3, 1, 1, 8)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (30, N'¿Qué no debes hacer en una red pública?', 3, 1, 1, 9)
INSERT [dbo].[pregunta] ([pre_id], [pre_pregunta], [eva_id], [tip_pre_id], [sec_id], [pre_orden]) VALUES (31, N'¿Cómo identificar una red segura?', 3, 1, 1, 10)
SET IDENTITY_INSERT [dbo].[pregunta] OFF
GO
SET IDENTITY_INSERT [dbo].[progreso] ON 

INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (457, 1018, 1, 20, 1, CAST(N'2025-01-02T22:39:55.713' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (458, 1018, 2, 20, 1, CAST(N'2025-01-02T22:39:57.567' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (459, 1018, 3, 20, 1, CAST(N'2025-01-02T22:40:41.730' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":1},{"CodigoPregunta":3,"CodigoRespuesta":7},{"CodigoPregunta":4,"CodigoRespuesta":9},{"CodigoPregunta":5,"CodigoRespuesta":15},{"CodigoPregunta":6,"CodigoRespuesta":20},{"CodigoPregunta":7,"CodigoRespuesta":22},{"CodigoPregunta":8,"CodigoRespuesta":26},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":35},{"CodigoPregunta":11,"CodigoRespuesta":39}]', 3)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (460, 1018, 4, 20, 1, CAST(N'2025-01-02T22:40:52.917' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (461, 1018, 5, 20, 1, CAST(N'2025-01-02T22:40:59.467' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (462, 1018, 6, 20, 1, CAST(N'2025-01-02T22:41:02.063' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (463, 1018, 7, 20, 1, CAST(N'2025-01-02T22:41:41.900' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":44},{"CodigoPregunta":13,"CodigoRespuesta":48},{"CodigoPregunta":14,"CodigoRespuesta":51},{"CodigoPregunta":15,"CodigoRespuesta":55},{"CodigoPregunta":16,"CodigoRespuesta":58},{"CodigoPregunta":17,"CodigoRespuesta":62},{"CodigoPregunta":18,"CodigoRespuesta":67},{"CodigoPregunta":19,"CodigoRespuesta":70},{"CodigoPregunta":20,"CodigoRespuesta":73},{"CodigoPregunta":21,"CodigoRespuesta":78}]', 2)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (464, 1018, 8, 20, 1, CAST(N'2025-01-02T22:41:48.133' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (465, 1018, 9, 20, 1, CAST(N'2025-01-02T22:41:54.243' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (466, 1018, 10, 20, 1, CAST(N'2025-01-02T22:41:56.300' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (467, 1018, 11, 20, 1, CAST(N'2025-01-02T22:42:32.307' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":82},{"CodigoPregunta":23,"CodigoRespuesta":86},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":108},{"CodigoPregunta":29,"CodigoRespuesta":111},{"CodigoPregunta":30,"CodigoRespuesta":115},{"CodigoPregunta":31,"CodigoRespuesta":120}]', 4)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (468, 1018, 12, 20, 1, CAST(N'2025-01-02T22:42:41.370' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (469, 1019, 1, 20, 1, CAST(N'2025-01-02T22:42:58.557' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (470, 1019, 2, 20, 1, CAST(N'2025-01-02T22:43:00.867' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (471, 1019, 3, 20, 1, CAST(N'2025-01-02T22:43:32.183' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":20},{"CodigoPregunta":7,"CodigoRespuesta":24},{"CodigoPregunta":8,"CodigoRespuesta":25},{"CodigoPregunta":9,"CodigoRespuesta":30},{"CodigoPregunta":10,"CodigoRespuesta":36},{"CodigoPregunta":11,"CodigoRespuesta":39}]', 4)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (472, 1019, 4, 20, 1, CAST(N'2025-01-02T22:43:36.883' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (473, 1019, 5, 20, 1, CAST(N'2025-01-02T22:43:41.870' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (474, 1019, 6, 20, 1, CAST(N'2025-01-02T22:43:44.620' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (475, 1019, 7, 20, 1, CAST(N'2025-01-02T22:44:18.513' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":52},{"CodigoPregunta":15,"CodigoRespuesta":55},{"CodigoPregunta":16,"CodigoRespuesta":58},{"CodigoPregunta":17,"CodigoRespuesta":62},{"CodigoPregunta":18,"CodigoRespuesta":67},{"CodigoPregunta":19,"CodigoRespuesta":71},{"CodigoPregunta":20,"CodigoRespuesta":75},{"CodigoPregunta":21,"CodigoRespuesta":77}]', 2)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (476, 1019, 8, 20, 1, CAST(N'2025-01-02T22:44:24.760' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (477, 1019, 9, 20, 1, CAST(N'2025-01-02T22:44:30.423' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (478, 1019, 10, 20, 1, CAST(N'2025-01-02T22:44:32.630' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (479, 1019, 11, 20, 1, CAST(N'2025-01-02T22:45:15.710' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":81},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":101},{"CodigoPregunta":28,"CodigoRespuesta":107},{"CodigoPregunta":29,"CodigoRespuesta":111},{"CodigoPregunta":30,"CodigoRespuesta":115},{"CodigoPregunta":31,"CodigoRespuesta":120}]', 4)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (480, 1019, 12, 20, 1, CAST(N'2025-01-02T22:45:34.760' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (481, 1020, 1, 20, 1, CAST(N'2025-01-02T22:45:51.933' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (482, 1020, 2, 20, 1, CAST(N'2025-01-02T22:45:54.023' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (483, 1020, 3, 20, 1, CAST(N'2025-01-02T22:46:32.413' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":1},{"CodigoPregunta":3,"CodigoRespuesta":6},{"CodigoPregunta":4,"CodigoRespuesta":11},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":22},{"CodigoPregunta":8,"CodigoRespuesta":25},{"CodigoPregunta":9,"CodigoRespuesta":31},{"CodigoPregunta":10,"CodigoRespuesta":33},{"CodigoPregunta":11,"CodigoRespuesta":39}]', 2)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (484, 1020, 4, 20, 1, CAST(N'2025-01-02T22:46:38.700' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (485, 1020, 5, 20, 1, CAST(N'2025-01-02T22:46:47.430' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (486, 1020, 6, 20, 1, CAST(N'2025-01-02T22:46:50.407' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (487, 1020, 7, 20, 1, CAST(N'2025-01-02T22:47:21.843' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":42},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":58},{"CodigoPregunta":17,"CodigoRespuesta":62},{"CodigoPregunta":18,"CodigoRespuesta":67},{"CodigoPregunta":19,"CodigoRespuesta":70},{"CodigoPregunta":20,"CodigoRespuesta":74},{"CodigoPregunta":21,"CodigoRespuesta":79}]', 3)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (488, 1020, 8, 20, 1, CAST(N'2025-01-02T22:47:31.250' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (489, 1020, 9, 20, 1, CAST(N'2025-01-02T22:47:36.063' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (490, 1020, 10, 20, 1, CAST(N'2025-01-02T22:47:38.327' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (491, 1020, 11, 20, 1, CAST(N'2025-01-02T22:48:08.477' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":83},{"CodigoPregunta":23,"CodigoRespuesta":86},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":112},{"CodigoPregunta":30,"CodigoRespuesta":115},{"CodigoPregunta":31,"CodigoRespuesta":119}]', 5)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (492, 1020, 12, 20, 1, CAST(N'2025-01-02T22:48:18.207' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (493, 1021, 1, 20, 1, CAST(N'2025-01-02T22:48:34.053' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (494, 1021, 2, 20, 1, CAST(N'2025-01-02T22:48:36.063' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (495, 1021, 3, 20, 1, CAST(N'2025-01-02T22:49:10.940' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":3},{"CodigoPregunta":3,"CodigoRespuesta":8},{"CodigoPregunta":4,"CodigoRespuesta":9},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":20},{"CodigoPregunta":7,"CodigoRespuesta":23},{"CodigoPregunta":8,"CodigoRespuesta":26},{"CodigoPregunta":9,"CodigoRespuesta":31},{"CodigoPregunta":10,"CodigoRespuesta":36},{"CodigoPregunta":11,"CodigoRespuesta":39}]', 2)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (496, 1021, 4, 20, 1, CAST(N'2025-01-02T22:49:19.087' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (497, 1021, 5, 20, 1, CAST(N'2025-01-02T22:49:23.277' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (498, 1021, 6, 20, 1, CAST(N'2025-01-02T22:49:25.927' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (499, 1021, 7, 20, 1, CAST(N'2025-01-02T22:50:06.760' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":46},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":57},{"CodigoPregunta":17,"CodigoRespuesta":61},{"CodigoPregunta":18,"CodigoRespuesta":67},{"CodigoPregunta":19,"CodigoRespuesta":72},{"CodigoPregunta":20,"CodigoRespuesta":76},{"CodigoPregunta":21,"CodigoRespuesta":80}]', 3)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (500, 1021, 8, 20, 1, CAST(N'2025-01-02T22:50:17.807' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (501, 1021, 9, 20, 1, CAST(N'2025-01-02T22:50:23.517' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (502, 1021, 10, 20, 1, CAST(N'2025-01-02T22:50:25.690' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (503, 1021, 11, 20, 1, CAST(N'2025-01-02T22:51:03.983' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":81},{"CodigoPregunta":23,"CodigoRespuesta":86},{"CodigoPregunta":24,"CodigoRespuesta":92},{"CodigoPregunta":25,"CodigoRespuesta":96},{"CodigoPregunta":26,"CodigoRespuesta":100},{"CodigoPregunta":27,"CodigoRespuesta":103},{"CodigoPregunta":28,"CodigoRespuesta":108},{"CodigoPregunta":29,"CodigoRespuesta":112},{"CodigoPregunta":30,"CodigoRespuesta":116},{"CodigoPregunta":31,"CodigoRespuesta":120}]', 0)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (504, 1021, 12, 20, 1, CAST(N'2025-01-02T22:51:20.340' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (505, 1022, 1, 20, 1, CAST(N'2025-01-02T22:51:37.317' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (506, 1022, 2, 20, 1, CAST(N'2025-01-02T22:51:40.153' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (507, 1022, 3, 20, 1, CAST(N'2025-01-02T22:51:52.737' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":4},{"CodigoPregunta":3,"CodigoRespuesta":8},{"CodigoPregunta":4,"CodigoRespuesta":12},{"CodigoPregunta":5,"CodigoRespuesta":16},{"CodigoPregunta":6,"CodigoRespuesta":20},{"CodigoPregunta":7,"CodigoRespuesta":24},{"CodigoPregunta":8,"CodigoRespuesta":28},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":36},{"CodigoPregunta":11,"CodigoRespuesta":40}]', 2)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (508, 1022, 4, 20, 1, CAST(N'2025-01-02T22:52:01.067' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (509, 1022, 5, 20, 1, CAST(N'2025-01-02T22:52:06.263' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (510, 1022, 6, 20, 1, CAST(N'2025-01-02T22:52:09.060' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (511, 1022, 7, 20, 1, CAST(N'2025-01-02T22:52:21.160' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":44},{"CodigoPregunta":13,"CodigoRespuesta":48},{"CodigoPregunta":14,"CodigoRespuesta":52},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":60},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":68},{"CodigoPregunta":19,"CodigoRespuesta":72},{"CodigoPregunta":20,"CodigoRespuesta":76},{"CodigoPregunta":21,"CodigoRespuesta":80}]', 2)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (512, 1022, 8, 20, 1, CAST(N'2025-01-02T22:52:32.237' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (513, 1022, 9, 20, 1, CAST(N'2025-01-02T22:52:37.910' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (514, 1022, 10, 20, 1, CAST(N'2025-01-02T22:52:40.030' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (515, 1022, 11, 20, 1, CAST(N'2025-01-02T22:52:52.190' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":88},{"CodigoPregunta":24,"CodigoRespuesta":92},{"CodigoPregunta":25,"CodigoRespuesta":96},{"CodigoPregunta":26,"CodigoRespuesta":100},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":108},{"CodigoPregunta":29,"CodigoRespuesta":112},{"CodigoPregunta":30,"CodigoRespuesta":116},{"CodigoPregunta":31,"CodigoRespuesta":120}]', 2)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (516, 1022, 12, 20, 1, CAST(N'2025-01-02T22:53:03.133' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (517, 1023, 1, 20, 1, CAST(N'2025-01-02T22:53:17.340' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (518, 1023, 2, 20, 1, CAST(N'2025-01-02T22:53:19.910' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (519, 1023, 3, 20, 1, CAST(N'2025-01-02T22:53:30.593' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":3},{"CodigoPregunta":3,"CodigoRespuesta":7},{"CodigoPregunta":4,"CodigoRespuesta":11},{"CodigoPregunta":5,"CodigoRespuesta":15},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":23},{"CodigoPregunta":8,"CodigoRespuesta":27},{"CodigoPregunta":9,"CodigoRespuesta":31},{"CodigoPregunta":10,"CodigoRespuesta":35},{"CodigoPregunta":11,"CodigoRespuesta":39}]', 2)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (520, 1023, 4, 20, 1, CAST(N'2025-01-02T22:53:33.693' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (521, 1023, 5, 20, 1, CAST(N'2025-01-02T22:53:38.440' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (522, 1023, 6, 20, 1, CAST(N'2025-01-02T22:53:41.243' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (523, 1023, 7, 20, 1, CAST(N'2025-01-02T22:53:54.493' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":43},{"CodigoPregunta":13,"CodigoRespuesta":47},{"CodigoPregunta":14,"CodigoRespuesta":51},{"CodigoPregunta":15,"CodigoRespuesta":55},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":63},{"CodigoPregunta":18,"CodigoRespuesta":67},{"CodigoPregunta":19,"CodigoRespuesta":71},{"CodigoPregunta":20,"CodigoRespuesta":75},{"CodigoPregunta":21,"CodigoRespuesta":79}]', 1)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (524, 1023, 8, 20, 1, CAST(N'2025-01-02T22:54:00.167' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (525, 1023, 9, 20, 1, CAST(N'2025-01-02T22:54:04.583' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (526, 1023, 10, 20, 1, CAST(N'2025-01-02T22:54:07.030' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (527, 1023, 11, 20, 1, CAST(N'2025-01-02T22:54:19.260' AS DateTime), N'[{"CodigoPregunta":31,"CodigoRespuesta":119},{"CodigoPregunta":30,"CodigoRespuesta":115},{"CodigoPregunta":29,"CodigoRespuesta":111},{"CodigoPregunta":28,"CodigoRespuesta":107},{"CodigoPregunta":27,"CodigoRespuesta":103},{"CodigoPregunta":26,"CodigoRespuesta":99},{"CodigoPregunta":25,"CodigoRespuesta":95},{"CodigoPregunta":23,"CodigoRespuesta":87},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":22,"CodigoRespuesta":83}]', 1)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (528, 1023, 12, 20, 1, CAST(N'2025-01-02T22:54:28.547' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (529, 1024, 1, 20, 1, CAST(N'2025-01-02T22:54:42.540' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (530, 1024, 2, 20, 1, CAST(N'2025-01-02T22:54:44.843' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (531, 1024, 3, 20, 1, CAST(N'2025-01-02T22:54:56.460' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":6},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":18},{"CodigoPregunta":7,"CodigoRespuesta":22},{"CodigoPregunta":8,"CodigoRespuesta":26},{"CodigoPregunta":9,"CodigoRespuesta":30},{"CodigoPregunta":10,"CodigoRespuesta":34},{"CodigoPregunta":11,"CodigoRespuesta":38}]', 4)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (532, 1024, 4, 20, 1, CAST(N'2025-01-02T22:55:01.217' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (533, 1024, 5, 20, 1, CAST(N'2025-01-02T22:55:06.533' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (534, 1024, 6, 20, 1, CAST(N'2025-01-02T22:55:09.260' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (535, 1024, 7, 20, 1, CAST(N'2025-01-02T22:55:20.537' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":42},{"CodigoPregunta":13,"CodigoRespuesta":46},{"CodigoPregunta":14,"CodigoRespuesta":50},{"CodigoPregunta":15,"CodigoRespuesta":54},{"CodigoPregunta":16,"CodigoRespuesta":58},{"CodigoPregunta":17,"CodigoRespuesta":62},{"CodigoPregunta":18,"CodigoRespuesta":66},{"CodigoPregunta":19,"CodigoRespuesta":70},{"CodigoPregunta":20,"CodigoRespuesta":74},{"CodigoPregunta":21,"CodigoRespuesta":78}]', 2)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (536, 1024, 8, 20, 1, CAST(N'2025-01-02T22:55:26.397' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (537, 1024, 9, 20, 1, CAST(N'2025-01-02T22:55:31.310' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (538, 1024, 10, 20, 1, CAST(N'2025-01-02T22:55:33.537' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (539, 1024, 11, 20, 1, CAST(N'2025-01-02T22:55:44.650' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":82},{"CodigoPregunta":23,"CodigoRespuesta":86},{"CodigoPregunta":24,"CodigoRespuesta":90},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":98},{"CodigoPregunta":27,"CodigoRespuesta":102},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":110},{"CodigoPregunta":30,"CodigoRespuesta":114},{"CodigoPregunta":31,"CodigoRespuesta":118}]', 4)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (540, 1024, 12, 20, 1, CAST(N'2025-01-02T22:55:54.070' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (541, 1025, 1, 20, 1, CAST(N'2025-01-02T22:56:07.360' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (542, 1025, 2, 20, 1, CAST(N'2025-01-02T22:56:09.770' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (543, 1025, 3, 20, 1, CAST(N'2025-01-02T22:56:20.370' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":1},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":9},{"CodigoPregunta":5,"CodigoRespuesta":13},{"CodigoPregunta":6,"CodigoRespuesta":17},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":25},{"CodigoPregunta":9,"CodigoRespuesta":29},{"CodigoPregunta":10,"CodigoRespuesta":33},{"CodigoPregunta":11,"CodigoRespuesta":37}]', 2)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (544, 1025, 4, 20, 1, CAST(N'2025-01-02T22:56:24.230' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (545, 1025, 5, 20, 1, CAST(N'2025-01-02T22:56:28.230' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (546, 1025, 6, 20, 1, CAST(N'2025-01-02T22:56:30.733' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (547, 1025, 7, 20, 1, CAST(N'2025-01-02T22:56:47.433' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":53},{"CodigoPregunta":17,"CodigoRespuesta":61},{"CodigoPregunta":18,"CodigoRespuesta":65},{"CodigoPregunta":19,"CodigoRespuesta":69},{"CodigoPregunta":20,"CodigoRespuesta":73},{"CodigoPregunta":21,"CodigoRespuesta":77},{"CodigoPregunta":16,"CodigoRespuesta":57}]', 5)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (548, 1025, 8, 20, 1, CAST(N'2025-01-02T22:56:52.763' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (549, 1025, 9, 20, 1, CAST(N'2025-01-02T22:56:57.783' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (550, 1025, 10, 20, 1, CAST(N'2025-01-02T22:57:00.540' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (551, 1025, 11, 20, 1, CAST(N'2025-01-02T22:57:11.567' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":81},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":89},{"CodigoPregunta":25,"CodigoRespuesta":93},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":101},{"CodigoPregunta":28,"CodigoRespuesta":105},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":113},{"CodigoPregunta":31,"CodigoRespuesta":117}]', 3)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (552, 1025, 12, 20, 1, CAST(N'2025-01-02T22:57:21.487' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (553, 1026, 1, 20, 1, CAST(N'2025-01-02T22:57:39.760' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (554, 1026, 2, 20, 1, CAST(N'2025-01-02T22:57:41.580' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (555, 1026, 3, 20, 1, CAST(N'2025-01-02T22:57:53.400' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":4},{"CodigoPregunta":3,"CodigoRespuesta":8},{"CodigoPregunta":4,"CodigoRespuesta":12},{"CodigoPregunta":5,"CodigoRespuesta":16},{"CodigoPregunta":6,"CodigoRespuesta":20},{"CodigoPregunta":7,"CodigoRespuesta":24},{"CodigoPregunta":8,"CodigoRespuesta":28},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":36},{"CodigoPregunta":11,"CodigoRespuesta":40}]', 2)
GO
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (556, 1026, 4, 20, 1, CAST(N'2025-01-02T22:57:57.457' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (557, 1026, 5, 20, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (558, 1026, 6, 20, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (559, 1026, 7, 20, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (560, 1026, 8, 20, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (561, 1026, 9, 20, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (562, 1026, 10, 20, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (563, 1026, 11, 20, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (564, 1026, 12, 20, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (565, 1018, 1, 21, 1, CAST(N'2025-01-02T23:02:36.127' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (566, 1018, 2, 21, 1, CAST(N'2025-01-02T23:02:37.880' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (567, 1018, 3, 21, 1, CAST(N'2025-01-02T23:03:31.790' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":20},{"CodigoPregunta":7,"CodigoRespuesta":24},{"CodigoPregunta":8,"CodigoRespuesta":27},{"CodigoPregunta":9,"CodigoRespuesta":31},{"CodigoPregunta":10,"CodigoRespuesta":33},{"CodigoPregunta":11,"CodigoRespuesta":37}]', 4)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (568, 1018, 4, 21, 1, CAST(N'2025-01-02T23:03:38.130' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (569, 1018, 5, 21, 1, CAST(N'2025-01-02T23:03:41.857' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (570, 1018, 6, 21, 1, CAST(N'2025-01-02T23:03:44.403' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (571, 1018, 7, 21, 1, CAST(N'2025-01-02T23:04:09.653' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":44},{"CodigoPregunta":13,"CodigoRespuesta":48},{"CodigoPregunta":14,"CodigoRespuesta":52},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":66},{"CodigoPregunta":19,"CodigoRespuesta":72},{"CodigoPregunta":20,"CodigoRespuesta":76},{"CodigoPregunta":21,"CodigoRespuesta":80}]', 4)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (572, 1018, 8, 21, 1, CAST(N'2025-01-02T23:04:14.760' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (573, 1018, 9, 21, 1, CAST(N'2025-01-02T23:04:18.733' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (574, 1018, 10, 21, 1, CAST(N'2025-01-02T23:04:21.223' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (575, 1018, 11, 21, 1, CAST(N'2025-01-02T23:05:00.690' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":103},{"CodigoPregunta":28,"CodigoRespuesta":108},{"CodigoPregunta":29,"CodigoRespuesta":112},{"CodigoPregunta":30,"CodigoRespuesta":116},{"CodigoPregunta":31,"CodigoRespuesta":120}]', 5)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (576, 1018, 12, 21, 1, CAST(N'2025-01-02T23:05:10.750' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (577, 1019, 1, 21, 1, CAST(N'2025-01-02T23:05:24.477' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (578, 1019, 2, 21, 1, CAST(N'2025-01-02T23:05:26.860' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (579, 1019, 3, 21, 1, CAST(N'2025-01-02T23:06:01.447' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":20},{"CodigoPregunta":7,"CodigoRespuesta":24},{"CodigoPregunta":8,"CodigoRespuesta":27},{"CodigoPregunta":9,"CodigoRespuesta":31},{"CodigoPregunta":10,"CodigoRespuesta":36},{"CodigoPregunta":11,"CodigoRespuesta":37}]', 4)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (580, 1019, 4, 21, 1, CAST(N'2025-01-02T23:06:04.783' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (581, 1019, 5, 21, 1, CAST(N'2025-01-02T23:06:08.877' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (582, 1019, 6, 21, 1, CAST(N'2025-01-02T23:06:11.670' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (583, 1019, 7, 21, 1, CAST(N'2025-01-02T23:06:40.507' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":58},{"CodigoPregunta":17,"CodigoRespuesta":63},{"CodigoPregunta":18,"CodigoRespuesta":67},{"CodigoPregunta":19,"CodigoRespuesta":71},{"CodigoPregunta":20,"CodigoRespuesta":75},{"CodigoPregunta":21,"CodigoRespuesta":79}]', 4)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (584, 1019, 8, 21, 1, CAST(N'2025-01-02T23:06:45.330' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (585, 1019, 9, 21, 1, CAST(N'2025-01-02T23:06:50.327' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (586, 1019, 10, 21, 1, CAST(N'2025-01-02T23:06:52.243' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (587, 1019, 11, 21, 1, CAST(N'2025-01-02T23:07:20.360' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":108},{"CodigoPregunta":29,"CodigoRespuesta":112},{"CodigoPregunta":30,"CodigoRespuesta":116},{"CodigoPregunta":31,"CodigoRespuesta":120}]', 6)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (588, 1019, 12, 21, 1, CAST(N'2025-01-02T23:07:29.240' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (589, 1020, 1, 21, 1, CAST(N'2025-01-02T23:07:46.143' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (590, 1020, 2, 21, 1, CAST(N'2025-01-02T23:07:47.640' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (591, 1020, 3, 21, 1, CAST(N'2025-01-02T23:08:16.867' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":24},{"CodigoPregunta":8,"CodigoRespuesta":28},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":36},{"CodigoPregunta":11,"CodigoRespuesta":39}]', 6)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (592, 1020, 4, 21, 1, CAST(N'2025-01-02T23:08:23.553' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (593, 1020, 5, 21, 1, CAST(N'2025-01-02T23:08:28.370' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (594, 1020, 6, 21, 1, CAST(N'2025-01-02T23:08:30.720' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (595, 1020, 7, 21, 1, CAST(N'2025-01-02T23:08:51.670' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":57},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":67},{"CodigoPregunta":19,"CodigoRespuesta":71},{"CodigoPregunta":20,"CodigoRespuesta":76},{"CodigoPregunta":21,"CodigoRespuesta":80}]', 5)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (596, 1020, 8, 21, 1, CAST(N'2025-01-02T23:08:58.490' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (597, 1020, 9, 21, 1, CAST(N'2025-01-02T23:09:02.313' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (598, 1020, 10, 21, 1, CAST(N'2025-01-02T23:09:04.657' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (599, 1020, 11, 21, 1, CAST(N'2025-01-02T23:09:25.083' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":108},{"CodigoPregunta":29,"CodigoRespuesta":112},{"CodigoPregunta":30,"CodigoRespuesta":116},{"CodigoPregunta":31,"CodigoRespuesta":120}]', 6)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (600, 1020, 12, 21, 1, CAST(N'2025-01-02T23:09:36.447' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (601, 1021, 1, 21, 1, CAST(N'2025-01-02T23:09:53.477' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (602, 1021, 2, 21, 1, CAST(N'2025-01-02T23:09:55.430' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (603, 1021, 3, 21, 1, CAST(N'2025-01-02T23:10:19.133' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":4,"CodigoRespuesta":12},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":27},{"CodigoPregunta":9,"CodigoRespuesta":31},{"CodigoPregunta":10,"CodigoRespuesta":33},{"CodigoPregunta":11,"CodigoRespuesta":37}]', 5)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (604, 1021, 4, 21, 1, CAST(N'2025-01-02T23:10:22.910' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (605, 1021, 5, 21, 1, CAST(N'2025-01-02T23:10:27.003' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (606, 1021, 6, 21, 1, CAST(N'2025-01-02T23:10:29.673' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (607, 1021, 7, 21, 1, CAST(N'2025-01-02T23:10:54.963' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":44},{"CodigoPregunta":13,"CodigoRespuesta":48},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":66},{"CodigoPregunta":19,"CodigoRespuesta":72},{"CodigoPregunta":20,"CodigoRespuesta":76},{"CodigoPregunta":21,"CodigoRespuesta":80}]', 5)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (608, 1021, 8, 21, 1, CAST(N'2025-01-02T23:10:59.970' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (609, 1021, 9, 21, 1, CAST(N'2025-01-02T23:11:05.080' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (610, 1021, 10, 21, 1, CAST(N'2025-01-02T23:11:06.773' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (611, 1021, 11, 21, 1, CAST(N'2025-01-02T23:11:41.830' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":83},{"CodigoPregunta":23,"CodigoRespuesta":87},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":115},{"CodigoPregunta":31,"CodigoRespuesta":120}]', 6)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (612, 1021, 12, 21, 1, CAST(N'2025-01-02T23:11:50.793' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (613, 1022, 1, 21, 1, CAST(N'2025-01-02T23:12:05.783' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (614, 1022, 2, 21, 1, CAST(N'2025-01-02T23:12:07.730' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (615, 1022, 3, 21, 1, CAST(N'2025-01-02T23:12:47.853' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":4},{"CodigoPregunta":3,"CodigoRespuesta":7},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":26},{"CodigoPregunta":9,"CodigoRespuesta":31},{"CodigoPregunta":10,"CodigoRespuesta":35},{"CodigoPregunta":11,"CodigoRespuesta":39}]', 6)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (616, 1022, 4, 21, 1, CAST(N'2025-01-02T23:12:51.130' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (617, 1022, 5, 21, 1, CAST(N'2025-01-02T23:12:54.993' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (618, 1022, 6, 21, 1, CAST(N'2025-01-02T23:12:58.350' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (619, 1022, 7, 21, 1, CAST(N'2025-01-02T23:13:18.940' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":42},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":54},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":62},{"CodigoPregunta":18,"CodigoRespuesta":66},{"CodigoPregunta":19,"CodigoRespuesta":70},{"CodigoPregunta":20,"CodigoRespuesta":74},{"CodigoPregunta":21,"CodigoRespuesta":78}]', 5)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (620, 1022, 8, 21, 1, CAST(N'2025-01-02T23:13:25.707' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (621, 1022, 9, 21, 1, CAST(N'2025-01-02T23:14:13.433' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (622, 1022, 10, 21, 1, CAST(N'2025-01-02T23:14:15.993' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (623, 1022, 11, 21, 1, CAST(N'2025-01-02T23:14:01.237' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":100},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":108},{"CodigoPregunta":29,"CodigoRespuesta":112},{"CodigoPregunta":30,"CodigoRespuesta":116},{"CodigoPregunta":31,"CodigoRespuesta":120}]', 5)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (624, 1022, 12, 21, 1, CAST(N'2025-01-02T23:14:10.057' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (625, 1023, 1, 21, 1, CAST(N'2025-01-02T23:14:33.977' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (626, 1023, 2, 21, 1, CAST(N'2025-01-02T23:14:35.833' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (627, 1023, 3, 21, 1, CAST(N'2025-01-02T23:15:06.583' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":28},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":36},{"CodigoPregunta":11,"CodigoRespuesta":40}]', 8)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (628, 1023, 4, 21, 1, CAST(N'2025-01-02T23:15:13.880' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (629, 1023, 5, 21, 1, CAST(N'2025-01-02T23:15:20.110' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (630, 1023, 6, 21, 1, CAST(N'2025-01-02T23:15:22.540' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (631, 1023, 7, 21, 1, CAST(N'2025-01-02T23:15:39.380' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":68},{"CodigoPregunta":19,"CodigoRespuesta":72},{"CodigoPregunta":20,"CodigoRespuesta":76},{"CodigoPregunta":21,"CodigoRespuesta":80}]', 6)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (632, 1023, 8, 21, 1, CAST(N'2025-01-02T23:15:43.957' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (633, 1023, 9, 21, 1, CAST(N'2025-01-02T23:15:50.370' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (634, 1023, 10, 21, 1, CAST(N'2025-01-02T23:15:52.587' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (635, 1023, 11, 21, 1, CAST(N'2025-01-02T23:16:13.200' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":88},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":108},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":114},{"CodigoPregunta":31,"CodigoRespuesta":120}]', 7)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (636, 1023, 12, 21, 1, CAST(N'2025-01-02T23:16:22.107' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (637, 1024, 1, 21, 1, CAST(N'2025-01-02T23:16:37.600' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (638, 1024, 2, 21, 1, CAST(N'2025-01-02T23:16:39.450' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (639, 1024, 3, 21, 1, CAST(N'2025-01-02T23:17:08.030' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":25},{"CodigoPregunta":9,"CodigoRespuesta":30},{"CodigoPregunta":10,"CodigoRespuesta":33},{"CodigoPregunta":11,"CodigoRespuesta":40}]', 7)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (640, 1024, 4, 21, 1, CAST(N'2025-01-02T23:17:11.247' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (641, 1024, 5, 21, 1, CAST(N'2025-01-02T23:17:15.273' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (642, 1024, 6, 21, 1, CAST(N'2025-01-02T23:17:18.353' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (643, 1024, 7, 21, 1, CAST(N'2025-01-02T23:17:32.680' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":55},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":68},{"CodigoPregunta":19,"CodigoRespuesta":72},{"CodigoPregunta":20,"CodigoRespuesta":76},{"CodigoPregunta":21,"CodigoRespuesta":80}]', 5)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (644, 1024, 8, 21, 1, CAST(N'2025-01-02T23:17:39.090' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (645, 1024, 9, 21, 1, CAST(N'2025-01-02T23:17:45.187' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (646, 1024, 10, 21, 1, CAST(N'2025-01-02T23:17:47.603' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (647, 1024, 11, 21, 1, CAST(N'2025-01-02T23:18:11.633' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":82},{"CodigoPregunta":23,"CodigoRespuesta":86},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":113},{"CodigoPregunta":31,"CodigoRespuesta":117}]', 6)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (648, 1024, 12, 21, 1, CAST(N'2025-01-02T23:18:21.877' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (649, 1025, 1, 21, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (650, 1025, 2, 21, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (651, 1025, 3, 21, 1, CAST(N'2025-01-02T23:18:58.977' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":6},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":25},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":36},{"CodigoPregunta":11,"CodigoRespuesta":40}]', 7)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (652, 1025, 4, 21, 1, CAST(N'2025-01-02T23:19:02.187' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (653, 1025, 5, 21, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (654, 1025, 6, 21, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (655, 1025, 7, 21, 1, CAST(N'2025-01-02T23:19:27.457' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":68},{"CodigoPregunta":19,"CodigoRespuesta":72},{"CodigoPregunta":20,"CodigoRespuesta":74},{"CodigoPregunta":21,"CodigoRespuesta":77}]', 6)
GO
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (656, 1025, 8, 21, 1, CAST(N'2025-01-02T23:19:33.030' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (657, 1025, 9, 21, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (658, 1025, 10, 21, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (659, 1025, 11, 21, 1, CAST(N'2025-01-02T23:20:04.707' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":83},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":108},{"CodigoPregunta":29,"CodigoRespuesta":110},{"CodigoPregunta":30,"CodigoRespuesta":115},{"CodigoPregunta":31,"CodigoRespuesta":119}]', 5)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (660, 1025, 12, 21, 1, CAST(N'2025-01-02T23:20:13.563' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (661, 1026, 1, 21, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (662, 1026, 2, 21, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (663, 1026, 3, 21, 1, CAST(N'2025-01-02T23:21:04.293' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":25},{"CodigoPregunta":9,"CodigoRespuesta":29},{"CodigoPregunta":10,"CodigoRespuesta":33},{"CodigoPregunta":11,"CodigoRespuesta":37}]', 6)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (664, 1026, 4, 21, 1, CAST(N'2025-01-02T23:21:08.040' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (665, 1026, 5, 21, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (666, 1026, 6, 21, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (667, 1026, 7, 21, 1, CAST(N'2025-01-02T23:21:33.243' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":57},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":67},{"CodigoPregunta":19,"CodigoRespuesta":71},{"CodigoPregunta":20,"CodigoRespuesta":75},{"CodigoPregunta":21,"CodigoRespuesta":78}]', 6)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (668, 1026, 8, 21, 1, CAST(N'2025-01-02T23:21:38.153' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (669, 1026, 9, 21, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (670, 1026, 10, 21, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (671, 1026, 11, 21, 1, CAST(N'2025-01-02T23:22:11.477' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":103},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":114},{"CodigoPregunta":31,"CodigoRespuesta":119}]', 8)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (672, 1026, 12, 21, 1, CAST(N'2025-01-02T23:22:19.843' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (673, 1018, 1, 22, 1, CAST(N'2025-01-02T23:24:40.417' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (674, 1018, 2, 22, 1, CAST(N'2025-01-02T23:24:42.187' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (675, 1018, 3, 22, 1, CAST(N'2025-01-02T23:25:10.103' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":26},{"CodigoPregunta":9,"CodigoRespuesta":30},{"CodigoPregunta":10,"CodigoRespuesta":35},{"CodigoPregunta":11,"CodigoRespuesta":40}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (676, 1018, 4, 22, 1, CAST(N'2025-01-02T23:25:13.170' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (677, 1018, 5, 22, 1, CAST(N'2025-01-02T23:25:17.617' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (678, 1018, 6, 22, 1, CAST(N'2025-01-02T23:25:21.210' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (679, 1018, 7, 22, 1, CAST(N'2025-01-02T23:25:51.710' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":66},{"CodigoPregunta":19,"CodigoRespuesta":69},{"CodigoPregunta":20,"CodigoRespuesta":73},{"CodigoPregunta":21,"CodigoRespuesta":80}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (680, 1018, 8, 22, 1, CAST(N'2025-01-02T23:25:57.153' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (681, 1018, 9, 22, 1, CAST(N'2025-01-02T23:26:01.390' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (682, 1018, 10, 22, 1, CAST(N'2025-01-02T23:26:03.540' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (683, 1018, 11, 22, 1, CAST(N'2025-01-02T23:26:26.943' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":113},{"CodigoPregunta":31,"CodigoRespuesta":118}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (684, 1018, 12, 22, 1, CAST(N'2025-01-02T23:26:36.130' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (685, 1019, 1, 22, 1, CAST(N'2025-01-02T23:26:54.490' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (686, 1019, 2, 22, 1, CAST(N'2025-01-02T23:26:56.573' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (687, 1019, 3, 22, 1, CAST(N'2025-01-02T23:27:26.790' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":26},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":36},{"CodigoPregunta":11,"CodigoRespuesta":40}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (688, 1019, 4, 22, 1, CAST(N'2025-01-02T23:27:29.653' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (689, 1019, 5, 22, 1, CAST(N'2025-01-02T23:27:38.890' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (690, 1019, 6, 22, 1, CAST(N'2025-01-02T23:27:42.157' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (691, 1019, 7, 22, 1, CAST(N'2025-01-02T23:28:06.563' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":66},{"CodigoPregunta":19,"CodigoRespuesta":69},{"CodigoPregunta":20,"CodigoRespuesta":73},{"CodigoPregunta":21,"CodigoRespuesta":80}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (692, 1019, 8, 22, 1, CAST(N'2025-01-02T23:28:11.283' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (693, 1019, 9, 22, 1, CAST(N'2025-01-02T23:28:15.423' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (694, 1019, 10, 22, 1, CAST(N'2025-01-02T23:28:17.727' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (695, 1019, 11, 22, 1, CAST(N'2025-01-02T23:28:51.480' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":114},{"CodigoPregunta":31,"CodigoRespuesta":120}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (696, 1019, 12, 22, 1, CAST(N'2025-01-02T23:29:00.497' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (697, 1020, 1, 22, 1, CAST(N'2025-01-02T23:29:13.850' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (698, 1020, 2, 22, 1, CAST(N'2025-01-02T23:29:15.500' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (699, 1020, 3, 22, 1, CAST(N'2025-01-02T23:29:54.207' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":7},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":26},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":35},{"CodigoPregunta":11,"CodigoRespuesta":39}]', 8)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (700, 1020, 4, 22, 1, CAST(N'2025-01-02T23:29:58.163' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (701, 1020, 5, 22, 1, CAST(N'2025-01-02T23:30:02.203' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (702, 1020, 6, 22, 1, CAST(N'2025-01-02T23:30:05.357' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (703, 1020, 7, 22, 1, CAST(N'2025-01-02T23:30:28.447' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":66},{"CodigoPregunta":19,"CodigoRespuesta":69},{"CodigoPregunta":20,"CodigoRespuesta":74},{"CodigoPregunta":21,"CodigoRespuesta":78}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (704, 1020, 8, 22, 1, CAST(N'2025-01-02T23:30:33.227' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (705, 1020, 9, 22, 1, CAST(N'2025-01-02T23:30:37.940' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (706, 1020, 10, 22, 1, CAST(N'2025-01-02T23:30:40.180' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (707, 1020, 11, 22, 1, CAST(N'2025-01-02T23:31:07.633' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":114},{"CodigoPregunta":31,"CodigoRespuesta":120}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (708, 1020, 12, 22, 1, CAST(N'2025-01-02T23:31:16.767' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (709, 1021, 1, 22, 1, CAST(N'2025-01-02T23:33:49.533' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (710, 1021, 2, 22, 1, CAST(N'2025-01-02T23:33:51.617' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (711, 1021, 3, 22, 1, CAST(N'2025-01-02T23:34:16.103' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":26},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":35},{"CodigoPregunta":11,"CodigoRespuesta":39}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (712, 1021, 4, 22, 1, CAST(N'2025-01-02T23:34:18.947' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (713, 1021, 5, 22, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (714, 1021, 6, 22, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (715, 1021, 7, 22, 1, CAST(N'2025-01-02T23:34:41.250' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":61},{"CodigoPregunta":18,"CodigoRespuesta":66},{"CodigoPregunta":19,"CodigoRespuesta":69},{"CodigoPregunta":20,"CodigoRespuesta":73},{"CodigoPregunta":21,"CodigoRespuesta":78}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (716, 1021, 8, 22, 1, CAST(N'2025-01-02T23:34:45.907' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (717, 1021, 9, 22, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (718, 1021, 10, 22, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (719, 1021, 11, 22, 1, CAST(N'2025-01-02T23:35:14.470' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":83},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":114},{"CodigoPregunta":31,"CodigoRespuesta":118}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (720, 1021, 12, 22, 1, CAST(N'2025-01-02T23:35:25.577' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (721, 1022, 1, 22, 1, CAST(N'2025-01-02T23:35:41.713' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (722, 1022, 2, 22, 1, CAST(N'2025-01-02T23:35:43.590' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (723, 1022, 3, 22, 1, CAST(N'2025-01-02T23:36:10.463' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":26},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":35},{"CodigoPregunta":11,"CodigoRespuesta":39}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (724, 1022, 4, 22, 1, CAST(N'2025-01-02T23:36:14.037' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (725, 1022, 5, 22, 1, CAST(N'2025-01-02T23:36:57.593' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (726, 1022, 6, 22, 1, CAST(N'2025-01-02T23:37:00.300' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (727, 1022, 7, 22, 1, CAST(N'2025-01-02T23:37:16.720' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":66},{"CodigoPregunta":19,"CodigoRespuesta":69},{"CodigoPregunta":20,"CodigoRespuesta":73},{"CodigoPregunta":21,"CodigoRespuesta":77}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (728, 1022, 8, 22, 1, CAST(N'2025-01-02T23:37:20.640' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (729, 1022, 9, 22, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (730, 1022, 10, 22, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (731, 1022, 11, 22, 1, CAST(N'2025-01-02T23:36:42.207' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":114},{"CodigoPregunta":31,"CodigoRespuesta":119}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (732, 1022, 12, 22, 1, CAST(N'2025-01-02T23:36:52.273' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (733, 1023, 1, 22, 1, CAST(N'2025-01-02T23:37:36.403' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (734, 1023, 2, 22, 1, CAST(N'2025-01-02T23:37:38.740' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (735, 1023, 3, 22, 1, CAST(N'2025-01-02T23:38:03.663' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":26},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":35},{"CodigoPregunta":11,"CodigoRespuesta":37}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (736, 1023, 4, 22, 1, CAST(N'2025-01-02T23:38:06.793' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (737, 1023, 5, 22, 1, CAST(N'2025-01-02T23:38:11.547' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (738, 1023, 6, 22, 1, CAST(N'2025-01-02T23:38:14.250' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (739, 1023, 7, 22, 1, CAST(N'2025-01-02T23:38:31.657' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":68},{"CodigoPregunta":19,"CodigoRespuesta":69},{"CodigoPregunta":20,"CodigoRespuesta":73},{"CodigoPregunta":21,"CodigoRespuesta":78}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (740, 1023, 8, 22, 1, CAST(N'2025-01-02T23:38:36.403' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (741, 1023, 9, 22, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (742, 1023, 10, 22, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (743, 1023, 11, 22, 1, CAST(N'2025-01-02T23:38:57.730' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":114},{"CodigoPregunta":31,"CodigoRespuesta":117}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (744, 1023, 12, 22, 1, CAST(N'2025-01-02T23:39:07.400' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (745, 1024, 1, 22, 1, CAST(N'2025-01-02T23:39:25.573' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (746, 1024, 2, 22, 1, CAST(N'2025-01-02T23:39:27.903' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (747, 1024, 3, 22, 1, CAST(N'2025-01-02T23:39:48.177' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":23},{"CodigoPregunta":8,"CodigoRespuesta":26},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":35},{"CodigoPregunta":11,"CodigoRespuesta":40}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (748, 1024, 4, 22, 1, CAST(N'2025-01-02T23:39:51.970' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (749, 1024, 5, 22, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (750, 1024, 6, 22, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (751, 1024, 7, 22, 1, CAST(N'2025-01-02T23:40:11.177' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":63},{"CodigoPregunta":18,"CodigoRespuesta":67},{"CodigoPregunta":19,"CodigoRespuesta":69},{"CodigoPregunta":20,"CodigoRespuesta":73},{"CodigoPregunta":21,"CodigoRespuesta":78}]', 8)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (752, 1024, 8, 22, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (753, 1024, 9, 22, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (754, 1024, 10, 22, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (755, 1024, 11, 22, 1, CAST(N'2025-01-02T23:40:51.520' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":114},{"CodigoPregunta":31,"CodigoRespuesta":118}]', 10)
GO
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (756, 1024, 12, 22, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (757, 1025, 1, 22, 1, CAST(N'2025-01-02T23:41:11.820' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (758, 1025, 2, 22, 1, CAST(N'2025-01-02T23:41:13.693' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (759, 1025, 3, 22, 1, CAST(N'2025-01-02T23:41:38.193' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":27},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":35},{"CodigoPregunta":11,"CodigoRespuesta":40}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (760, 1025, 4, 22, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (761, 1025, 5, 22, 1, CAST(N'2025-01-02T23:41:49.083' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (762, 1025, 6, 22, 1, CAST(N'2025-01-02T23:41:52.563' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (763, 1025, 7, 22, 1, CAST(N'2025-01-02T23:42:13.233' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":66},{"CodigoPregunta":19,"CodigoRespuesta":69},{"CodigoPregunta":20,"CodigoRespuesta":73},{"CodigoPregunta":21,"CodigoRespuesta":77}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (764, 1025, 8, 22, 1, CAST(N'2025-01-02T23:42:17.687' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (765, 1025, 9, 22, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (766, 1025, 10, 22, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (767, 1025, 11, 22, 1, CAST(N'2025-01-02T23:42:47.763' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":114},{"CodigoPregunta":31,"CodigoRespuesta":118}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (768, 1025, 12, 22, 1, CAST(N'2025-01-02T23:42:57.843' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (769, 1026, 1, 22, 1, CAST(N'2025-01-02T23:43:13.503' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (770, 1026, 2, 22, 1, CAST(N'2025-01-02T23:43:15.160' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (771, 1026, 3, 22, 1, CAST(N'2025-01-02T23:43:33.273' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":3},{"CodigoPregunta":3,"CodigoRespuesta":7},{"CodigoPregunta":4,"CodigoRespuesta":11},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":26},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":35},{"CodigoPregunta":11,"CodigoRespuesta":40}]', 7)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (772, 1026, 4, 22, 1, CAST(N'2025-01-02T23:43:36.990' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (773, 1026, 5, 22, 1, CAST(N'2025-01-02T23:43:40.843' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (774, 1026, 6, 22, 1, CAST(N'2025-01-02T23:43:43.813' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (775, 1026, 7, 22, 1, CAST(N'2025-01-02T23:44:03.937' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":66},{"CodigoPregunta":19,"CodigoRespuesta":69},{"CodigoPregunta":20,"CodigoRespuesta":74},{"CodigoPregunta":21,"CodigoRespuesta":78}]', 9)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (776, 1026, 8, 22, 1, CAST(N'2025-01-02T23:44:08.403' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (777, 1026, 9, 22, 1, CAST(N'2025-01-02T23:44:12.833' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (778, 1026, 10, 22, 1, CAST(N'2025-01-02T23:44:14.847' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (779, 1026, 11, 22, 1, CAST(N'2025-01-02T23:44:31.760' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":114},{"CodigoPregunta":31,"CodigoRespuesta":118}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (780, 1026, 12, 22, 1, CAST(N'2025-01-02T23:44:39.840' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (781, 1018, 1, 23, 1, CAST(N'2025-01-02T23:49:05.507' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (782, 1018, 2, 23, 1, CAST(N'2025-01-02T23:49:07.260' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (783, 1018, 3, 23, 1, CAST(N'2025-01-02T23:49:28.577' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":26},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":35},{"CodigoPregunta":11,"CodigoRespuesta":40}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (784, 1018, 4, 23, 1, CAST(N'2025-01-02T23:49:31.580' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (785, 1018, 5, 23, 1, CAST(N'2025-01-02T23:49:35.583' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (786, 1018, 6, 23, 1, CAST(N'2025-01-02T23:49:38.283' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (787, 1018, 7, 23, 1, CAST(N'2025-01-02T23:50:01.187' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":66},{"CodigoPregunta":19,"CodigoRespuesta":69},{"CodigoPregunta":20,"CodigoRespuesta":73},{"CodigoPregunta":21,"CodigoRespuesta":78}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (788, 1018, 8, 23, 1, CAST(N'2025-01-02T23:50:07.257' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (789, 1018, 9, 23, 1, CAST(N'2025-01-02T23:50:11.980' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (790, 1018, 10, 23, 1, CAST(N'2025-01-02T23:50:14.077' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (791, 1018, 11, 23, 1, CAST(N'2025-01-02T23:50:34.897' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":114},{"CodigoPregunta":31,"CodigoRespuesta":118}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (792, 1018, 12, 23, 1, CAST(N'2025-01-02T23:50:44.327' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (793, 1019, 1, 23, 1, CAST(N'2025-01-02T23:51:00.053' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (794, 1019, 2, 23, 1, CAST(N'2025-01-02T23:51:01.567' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (795, 1019, 3, 23, 1, CAST(N'2025-01-02T23:51:24.020' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":26},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":35},{"CodigoPregunta":11,"CodigoRespuesta":40}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (796, 1019, 4, 23, 1, CAST(N'2025-01-02T23:51:26.560' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (797, 1019, 5, 23, 1, CAST(N'2025-01-02T23:51:31.093' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (798, 1019, 6, 23, 1, CAST(N'2025-01-02T23:51:33.990' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (799, 1019, 7, 23, 1, CAST(N'2025-01-02T23:51:57.007' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":66},{"CodigoPregunta":19,"CodigoRespuesta":69},{"CodigoPregunta":20,"CodigoRespuesta":73},{"CodigoPregunta":21,"CodigoRespuesta":78}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (800, 1019, 8, 23, 1, CAST(N'2025-01-02T23:52:01.290' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (801, 1019, 9, 23, 1, CAST(N'2025-01-02T23:52:05.630' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (802, 1019, 10, 23, 1, CAST(N'2025-01-02T23:52:08.173' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (803, 1019, 11, 23, 1, CAST(N'2025-01-02T23:52:28.313' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":114},{"CodigoPregunta":31,"CodigoRespuesta":118}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (804, 1019, 12, 23, 1, CAST(N'2025-01-02T23:52:36.860' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (805, 1020, 1, 23, 1, CAST(N'2025-01-02T23:52:52.410' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (806, 1020, 2, 23, 1, CAST(N'2025-01-02T23:52:54.157' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (807, 1020, 3, 23, 1, CAST(N'2025-01-02T23:53:14.297' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":26},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":35},{"CodigoPregunta":11,"CodigoRespuesta":40}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (808, 1020, 4, 23, 1, CAST(N'2025-01-02T23:53:17.797' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (809, 1020, 5, 23, 1, CAST(N'2025-01-02T23:53:22.660' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (810, 1020, 6, 23, 1, CAST(N'2025-01-02T23:53:26.283' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (811, 1020, 7, 23, 1, CAST(N'2025-01-02T23:53:56.157' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":66},{"CodigoPregunta":19,"CodigoRespuesta":69},{"CodigoPregunta":20,"CodigoRespuesta":73},{"CodigoPregunta":21,"CodigoRespuesta":78}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (812, 1020, 8, 23, 1, CAST(N'2025-01-02T23:54:00.513' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (813, 1020, 9, 23, 1, CAST(N'2025-01-02T23:54:04.797' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (814, 1020, 10, 23, 1, CAST(N'2025-01-02T23:54:06.843' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (815, 1020, 11, 23, 1, CAST(N'2025-01-02T23:54:23.063' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":114},{"CodigoPregunta":31,"CodigoRespuesta":118}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (816, 1020, 12, 23, 1, CAST(N'2025-01-02T23:54:32.297' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (817, 1021, 1, 23, 1, CAST(N'2025-01-02T23:54:47.630' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (818, 1021, 2, 23, 1, CAST(N'2025-01-02T23:54:49.430' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (819, 1021, 3, 23, 1, CAST(N'2025-01-02T23:55:11.547' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":26},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":35},{"CodigoPregunta":11,"CodigoRespuesta":40}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (820, 1021, 4, 23, 1, CAST(N'2025-01-02T23:55:14.190' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (821, 1021, 5, 23, 1, CAST(N'2025-01-02T23:55:18.287' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (822, 1021, 6, 23, 1, CAST(N'2025-01-02T23:55:21.220' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (823, 1021, 7, 23, 1, CAST(N'2025-01-02T23:55:44.863' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":66},{"CodigoPregunta":19,"CodigoRespuesta":69},{"CodigoPregunta":20,"CodigoRespuesta":73},{"CodigoPregunta":21,"CodigoRespuesta":78}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (824, 1021, 8, 23, 1, CAST(N'2025-01-02T23:55:49.963' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (825, 1021, 9, 23, 1, CAST(N'2025-01-02T23:55:53.893' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (826, 1021, 10, 23, 1, CAST(N'2025-01-02T23:55:55.850' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (827, 1021, 11, 23, 1, CAST(N'2025-01-02T23:56:26.873' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":114},{"CodigoPregunta":31,"CodigoRespuesta":118}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (828, 1021, 12, 23, 1, CAST(N'2025-01-02T23:56:34.407' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (829, 1022, 1, 23, 1, CAST(N'2025-01-02T23:56:50.133' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (830, 1022, 2, 23, 1, CAST(N'2025-01-02T23:56:51.937' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (831, 1022, 3, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (832, 1022, 4, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (833, 1022, 5, 23, 1, CAST(N'2025-01-02T23:56:57.717' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (834, 1022, 6, 23, 1, CAST(N'2025-01-02T23:57:01.220' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (835, 1022, 7, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (836, 1022, 8, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (837, 1022, 9, 23, 1, CAST(N'2025-01-02T23:57:07.470' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (838, 1022, 10, 23, 1, CAST(N'2025-01-02T23:57:09.357' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (839, 1022, 11, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (840, 1022, 12, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (841, 1023, 1, 23, 1, CAST(N'2025-01-02T23:57:26.493' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (842, 1023, 2, 23, 1, CAST(N'2025-01-02T23:57:27.927' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (843, 1023, 3, 23, 1, CAST(N'2025-01-02T23:57:56.540' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":26},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":35},{"CodigoPregunta":11,"CodigoRespuesta":40}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (844, 1023, 4, 23, 1, CAST(N'2025-01-02T23:58:00.127' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (845, 1023, 5, 23, 1, CAST(N'2025-01-02T23:58:04.023' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (846, 1023, 6, 23, 1, CAST(N'2025-01-02T23:58:06.263' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (847, 1023, 7, 23, 1, CAST(N'2025-01-02T23:58:22.077' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":66},{"CodigoPregunta":19,"CodigoRespuesta":69},{"CodigoPregunta":20,"CodigoRespuesta":73},{"CodigoPregunta":21,"CodigoRespuesta":78}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (848, 1023, 8, 23, 1, CAST(N'2025-01-02T23:58:27.570' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (849, 1023, 9, 23, 1, CAST(N'2025-01-02T23:58:31.840' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (850, 1023, 10, 23, 1, CAST(N'2025-01-02T23:58:33.870' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (851, 1023, 11, 23, 1, CAST(N'2025-01-02T23:59:00.970' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":114},{"CodigoPregunta":31,"CodigoRespuesta":118}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (852, 1023, 12, 23, 1, CAST(N'2025-01-02T23:59:09.960' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (853, 1024, 1, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (854, 1024, 2, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (855, 1024, 3, 23, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (856, 1024, 4, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (857, 1024, 5, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (858, 1024, 6, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (859, 1024, 7, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (860, 1024, 8, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (861, 1024, 9, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (862, 1024, 10, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (863, 1024, 11, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (864, 1024, 12, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (865, 1025, 1, 23, 1, CAST(N'2025-01-02T23:59:27.657' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (866, 1025, 2, 23, 1, CAST(N'2025-01-02T23:59:29.440' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (867, 1025, 3, 23, 1, CAST(N'2025-01-02T23:59:45.937' AS DateTime), N'[{"CodigoPregunta":2,"CodigoRespuesta":2},{"CodigoPregunta":3,"CodigoRespuesta":5},{"CodigoPregunta":4,"CodigoRespuesta":10},{"CodigoPregunta":5,"CodigoRespuesta":14},{"CodigoPregunta":6,"CodigoRespuesta":19},{"CodigoPregunta":7,"CodigoRespuesta":21},{"CodigoPregunta":8,"CodigoRespuesta":26},{"CodigoPregunta":9,"CodigoRespuesta":32},{"CodigoPregunta":10,"CodigoRespuesta":35},{"CodigoPregunta":11,"CodigoRespuesta":40}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (868, 1025, 4, 23, 1, CAST(N'2025-01-02T23:59:49.127' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (869, 1025, 5, 23, 1, CAST(N'2025-01-02T23:59:53.320' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (870, 1025, 6, 23, 1, CAST(N'2025-01-02T23:59:56.273' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (871, 1025, 7, 23, 1, CAST(N'2025-01-03T00:00:27.720' AS DateTime), N'[{"CodigoPregunta":12,"CodigoRespuesta":41},{"CodigoPregunta":13,"CodigoRespuesta":45},{"CodigoPregunta":14,"CodigoRespuesta":49},{"CodigoPregunta":15,"CodigoRespuesta":56},{"CodigoPregunta":16,"CodigoRespuesta":59},{"CodigoPregunta":17,"CodigoRespuesta":64},{"CodigoPregunta":18,"CodigoRespuesta":66},{"CodigoPregunta":19,"CodigoRespuesta":69},{"CodigoPregunta":20,"CodigoRespuesta":73},{"CodigoPregunta":21,"CodigoRespuesta":78}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (872, 1025, 8, 23, 1, CAST(N'2025-01-03T00:00:32.023' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (873, 1025, 9, 23, 1, CAST(N'2025-01-03T00:00:36.737' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (874, 1025, 10, 23, 1, CAST(N'2025-01-03T00:00:38.890' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (875, 1025, 11, 23, 1, CAST(N'2025-01-03T00:00:59.107' AS DateTime), N'[{"CodigoPregunta":22,"CodigoRespuesta":84},{"CodigoPregunta":23,"CodigoRespuesta":85},{"CodigoPregunta":24,"CodigoRespuesta":91},{"CodigoPregunta":25,"CodigoRespuesta":94},{"CodigoPregunta":26,"CodigoRespuesta":97},{"CodigoPregunta":27,"CodigoRespuesta":104},{"CodigoPregunta":28,"CodigoRespuesta":106},{"CodigoPregunta":29,"CodigoRespuesta":109},{"CodigoPregunta":30,"CodigoRespuesta":114},{"CodigoPregunta":31,"CodigoRespuesta":118}]', 10)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (876, 1025, 12, 23, 1, CAST(N'2025-01-03T00:01:07.900' AS DateTime), N'', NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (877, 1026, 1, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (878, 1026, 2, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (879, 1026, 3, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (880, 1026, 4, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (881, 1026, 5, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (882, 1026, 6, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (883, 1026, 7, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (884, 1026, 8, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (885, 1026, 9, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (886, 1026, 10, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (887, 1026, 11, 23, 0, NULL, NULL, NULL)
INSERT [dbo].[progreso] ([pro_id], [us_id], [ac_id], [cam_id], [pro_estado], [pro_fecha_finalizacion], [pro_respuesta], [pro_puntaje]) VALUES (888, 1026, 12, 23, 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[progreso] OFF
GO
SET IDENTITY_INSERT [dbo].[respuesta] ON 

INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (1, 2, N'Solo letras minúsculas', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (2, 2, N' Contiene letras, números y símbolos', 2, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (3, 2, N'Es tu nombre o fecha de nacimiento', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (4, 2, N'Tiene menos de 6 caracteres', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (5, 3, N'Usar una palabra común', 1, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (6, 3, N'Mezclar letras y números', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (7, 3, N'Usar un generador de contraseñas', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (8, 3, N'Cambiarla regularmente', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (9, 4, N'Podría olvidarse', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (10, 4, N'Podría caer en manos equivocadas', 2, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (11, 4, N'Nadie quiere saberla', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (12, 4, N'No es necesario protegerla', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (13, 5, N'12345678', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (14, 5, N'IGMiPerro2023!.', 2, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (15, 5, N'password', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (16, 5, N'abcdef', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (17, 6, N'Nunca', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (18, 6, N'Solo si alguien la descubre', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (19, 6, N'Regularmente, por ejemplo, cada 3-6 meses', 3, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (20, 6, N'Cuando lo recuerdes', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (21, 7, N'Un gestor de contraseñas', 1, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (22, 7, N'Una libreta en tu escritorio', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (23, 7, N'Tu navegador sin protección', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (24, 7, N'Una aplicación cualquiera', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (25, 8, N'Una que tiene al menos 12 caracteres', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (26, 8, N'Una que es corta y fácil de adivinar', 2, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (27, 8, N'Una con símbolos y números', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (28, 8, N'Una generada aleatoriamente', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (29, 9, N'Ignorar el problema', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (30, 9, N'Escribirla en otro lugar', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (31, 9, N'Esperar hasta que alguien te avise', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (32, 9, N'Cambiarla de inmediato', 4, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (33, 10, N'Sí, si es fácil de recordar', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (34, 10, N'Solo para cuentas no importantes', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (35, 10, N'No, porque si alguien la descubre, puede acceder a todo', 3, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (36, 10, N'Sí, si la contraseña es larga', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (37, 11, N'Una que incluye palabras comunes', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (38, 11, N'Una con un patrón en el teclado', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (39, 11, N'Una igual a tu nombre', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (40, 11, N'Una completamente aleatoria', 4, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (41, 12, N'Robar datos mediante sitios falsos', 1, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (42, 12, N'Una forma de proteger tus datos', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (43, 12, N'Un tipo de archivo peligroso', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (44, 12, N'Un virus de computadora', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (45, 13, N'Tiene faltas de ortografía y errores en el texto', 1, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (46, 13, N'Proviene de tu banco legítimo', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (47, 13, N'No pide ninguna información', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (48, 13, N'Es igual a los correos normales', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (49, 14, N'Hacer clic en él', 1, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (50, 14, N'Ignorarlo', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (51, 14, N'Borrarlo', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (52, 14, N'Consultar con alguien', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (53, 15, N'Tu comida favorita', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (54, 15, N'Información irrelevante', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (55, 15, N'Un saludo amistoso', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (56, 15, N'Datos personales o financieros', 4, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (57, 16, N'Usa HTTPS', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (58, 16, N'Es igual a la página oficial', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (59, 16, N'Tiene un diseño diferente al original', 3, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (60, 16, N'No contiene enlaces', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (61, 17, N'Abrirlo y ver qué dice', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (62, 17, N'Contestar educadamente', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (63, 17, N'Guardarlo por si acaso', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (64, 17, N'Reportarlo como spam', 4, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (65, 18, N'Nada, son datos irrelevantes', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (66, 18, N'Robar tu identidad', 2, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (67, 18, N'Enviarte más correos', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (68, 18, N'Mejorar la seguridad de tu cuenta', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (69, 19, N'Un antivirus actualizado', 1, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (70, 19, N'Un gestor de contraseñas', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (71, 19, N'Un navegador sin protección', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (72, 19, N'No usar internet', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (73, 20, N'Comprobar que el sitio sea seguro', 1, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (74, 20, N'Escribir cualquier dato sin revisarlo', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (75, 20, N'Aceptar cualquier solicitud', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (76, 20, N'Ignorar las advertencias del navegador', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (77, 21, N'Tener buena memoria', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (78, 21, N'Estar alerta y no confiar en mensajes sospechosos', 2, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (79, 21, N'Usar contraseñas fuertes', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (80, 21, N'No usar correos electrónicos', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (81, 22, N'Para evitar anuncios', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (82, 22, N'Para que funcione el router', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (83, 22, N'Porque no necesitas internet rápido', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (84, 22, N'Para que nadie robe tu conexión', 4, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (85, 23, N'Evita que se conecten personas no autorizadas', 1, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (86, 23, N'Aumenta la velocidad del internet', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (87, 23, N'Cambia la red automáticamente', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (88, 23, N'Desactiva el router', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (89, 24, N'Cambiar el nombre de la red', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (90, 24, N'Usar letras y números en la contraseña', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (91, 24, N'Usar una contraseña fácil como "123456"', 3, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (92, 24, N'Revisar la configuración', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (93, 25, N'Usar tu red personal', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (94, 25, N'Conectarte a una red sin contraseña', 2, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (95, 25, N'Usar internet con un cable', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (96, 25, N'Mejorar la seguridad', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (97, 26, N'Una VPN', 1, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (98, 26, N'Una contraseña débil', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (99, 26, N'No usar antivirus', 3, 0)
GO
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (100, 26, N'Abrir cualquier red', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (101, 27, N'Una sin cifrado', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (102, 27, N'Una red pública', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (103, 27, N'Una red abierta', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (104, 27, N'Una red con contraseña fuerte', 4, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (105, 28, N'Ignorar el problema', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (106, 28, N'Cambiar la contraseña', 2, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (107, 28, N'Compartir más la red', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (108, 28, N'Apagar el router', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (109, 29, N'Tiene cifrado WPA2 o WPA3', 1, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (110, 29, N'Es abierta', 2, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (111, 29, N'No pide contraseña', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (112, 29, N'Es gratuita', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (113, 30, N'Revisar redes sociales', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (114, 30, N'Realizar transacciones bancarias', 2, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (115, 30, N'Ver videos', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (116, 30, N'Usar contraseñas', 4, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (117, 31, N'Tiene nombre genérico', 1, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (118, 31, N'Pide autenticación y tiene cifrado', 2, 1)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (119, 31, N'No necesita contraseña', 3, 0)
INSERT [dbo].[respuesta] ([resp_id], [pre_id], [resp_respuesta], [resp_orden], [resp_correcta]) VALUES (120, 31, N'Es la más rápida', 4, 0)
SET IDENTITY_INSERT [dbo].[respuesta] OFF
GO
SET IDENTITY_INSERT [dbo].[rol] ON 

INSERT [dbo].[rol] ([ro_id], [ro_nombre], [ro_descripcion]) VALUES (1, N'administrador', N'administrador del sistema, acceso a todas las funciones de administrador')
INSERT [dbo].[rol] ([ro_id], [ro_nombre], [ro_descripcion]) VALUES (2, N'usuario', N'usuario del sistema con acceso solo a ciertos modulos')
SET IDENTITY_INSERT [dbo].[rol] OFF
GO
SET IDENTITY_INSERT [dbo].[seccion] ON 

INSERT [dbo].[seccion] ([sec_id], [sec_nombre]) VALUES (1, N'Seccion 1')
SET IDENTITY_INSERT [dbo].[seccion] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_actividad] ON 

INSERT [dbo].[tipo_actividad] ([ti_id], [ti_nombre]) VALUES (1, N'Literatura')
INSERT [dbo].[tipo_actividad] ([ti_id], [ti_nombre]) VALUES (2, N'Ejemplo')
INSERT [dbo].[tipo_actividad] ([ti_id], [ti_nombre]) VALUES (3, N'Cuestionario')
INSERT [dbo].[tipo_actividad] ([ti_id], [ti_nombre]) VALUES (4, N'Ejercicio o Caso de Estudio')
SET IDENTITY_INSERT [dbo].[tipo_actividad] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_pregunta] ON 

INSERT [dbo].[tipo_pregunta] ([tip_pre_id], [tip_pre_descripcion], [tip_pre_neumonico]) VALUES (1, N'Unica respuesta, opcion multiple', N'RAD       ')
SET IDENTITY_INSERT [dbo].[tipo_pregunta] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([us_id], [us_alias], [us_clave], [ro_id], [us_estado], [us_numero_intentos], [pe_id], [us_salt]) VALUES (1013, N'segurityeducation@gmail.com', N'94bdd0d627dfc12e25c9b8bf288d33021839daf1e5684028d272ec008445a209', 1, 0, 0, 1013, N'fSGm7z12xfoqmoAFc4qv8g==')
INSERT [dbo].[usuario] ([us_id], [us_alias], [us_clave], [ro_id], [us_estado], [us_numero_intentos], [pe_id], [us_salt]) VALUES (1018, N'luismendoza123@gmail.com', N'9915d1d1c81ba3fceac28794f42bb91a442f11892b66ea56a8f3781630e7798e', 2, 0, 0, 1018, N'u57gROx26LpWMOxua964Kg==')
INSERT [dbo].[usuario] ([us_id], [us_alias], [us_clave], [ro_id], [us_estado], [us_numero_intentos], [pe_id], [us_salt]) VALUES (1019, N'danielamoreira123@gmail.com', N'dc286b908a4549a9879d557cfd3887318280c38d2b991fda3208d79b52319f00', 2, 0, 0, 1019, N'SW/E8T8IGNUkN589jXlTnw==')
INSERT [dbo].[usuario] ([us_id], [us_alias], [us_clave], [ro_id], [us_estado], [us_numero_intentos], [pe_id], [us_salt]) VALUES (1020, N'carlosvalle1997@gmail.com', N'cb9e6753ebd3093f7f53caded72422036a2cb20b31c531580ad67e7ecf4b476a', 2, 0, 0, 1020, N'c1TFhgHTC+2h1x6Dc0VXAw==')
INSERT [dbo].[usuario] ([us_id], [us_alias], [us_clave], [ro_id], [us_estado], [us_numero_intentos], [pe_id], [us_salt]) VALUES (1021, N'brianalfredo@gmail.com', N'f4f0aad5c077589ec50718eb4ca449e18702e64b82146609f0f199a1801cbcc8', 2, 0, 0, 1021, N'b2wk6uU62imiXcYe03GRsg==')
INSERT [dbo].[usuario] ([us_id], [us_alias], [us_clave], [ro_id], [us_estado], [us_numero_intentos], [pe_id], [us_salt]) VALUES (1022, N'juantorres122@gmail.com', N'943cffc2364c99187e5487ff3953183a931e256bcd6fb821199883115f8ee678', 2, 0, 0, 1022, N'cZ8DiqexErtvBMvymVsRiQ==')
INSERT [dbo].[usuario] ([us_id], [us_alias], [us_clave], [ro_id], [us_estado], [us_numero_intentos], [pe_id], [us_salt]) VALUES (1023, N'magnoestiven444@gmail.com', N'2ebd98c9e749b223a6f7ea0413e04992923aaf6fb7d9da4f64534799d892af4d', 2, 0, 0, 1023, N'JSXNa9DXXagtcFWouYjAtw==')
INSERT [dbo].[usuario] ([us_id], [us_alias], [us_clave], [ro_id], [us_estado], [us_numero_intentos], [pe_id], [us_salt]) VALUES (1024, N'andreacasanova990@gmail.com', N'9220d875f42e32a606bd1e3dd1c53987be667564792a50141f206062f342a859', 2, 0, 0, 1024, N'ZBDIiroig6N0pYezgg1s2A==')
INSERT [dbo].[usuario] ([us_id], [us_alias], [us_clave], [ro_id], [us_estado], [us_numero_intentos], [pe_id], [us_salt]) VALUES (1025, N'luismoreira123@gmail.com', N'50bd2dc46923a7b09b042aa9ed2e72e14ee836e12e97bb026e553006876e45bf', 2, 0, 0, 1025, N'Zm2W4On2l7bG9poIUfhhkg==')
INSERT [dbo].[usuario] ([us_id], [us_alias], [us_clave], [ro_id], [us_estado], [us_numero_intentos], [pe_id], [us_salt]) VALUES (1026, N'pedropilataxi123@gmail.com', N'e309a14fd0a4a6765a67a5e8f0632fa90c814da850d59f79c60267ec39d1bcb8', 2, 0, 0, 1026, N'L6zpr+PU/UNcMkvD7JMLJQ==')
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
ALTER TABLE [dbo].[actividad]  WITH CHECK ADD  CONSTRAINT [FK_actividad_modulo] FOREIGN KEY([mo_id])
REFERENCES [dbo].[modulo] ([mo_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[actividad] CHECK CONSTRAINT [FK_actividad_modulo]
GO
ALTER TABLE [dbo].[actividad]  WITH CHECK ADD  CONSTRAINT [FK_actividad_tipo_actividad] FOREIGN KEY([ti_id])
REFERENCES [dbo].[tipo_actividad] ([ti_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[actividad] CHECK CONSTRAINT [FK_actividad_tipo_actividad]
GO
ALTER TABLE [dbo].[campania_modulo]  WITH CHECK ADD  CONSTRAINT [FK_campania_modulo_campania] FOREIGN KEY([cam_id])
REFERENCES [dbo].[campania] ([cam_id])
GO
ALTER TABLE [dbo].[campania_modulo] CHECK CONSTRAINT [FK_campania_modulo_campania]
GO
ALTER TABLE [dbo].[campania_modulo]  WITH CHECK ADD  CONSTRAINT [FK_campania_modulo_modulo] FOREIGN KEY([mo_id])
REFERENCES [dbo].[modulo] ([mo_id])
GO
ALTER TABLE [dbo].[campania_modulo] CHECK CONSTRAINT [FK_campania_modulo_modulo]
GO
ALTER TABLE [dbo].[certificado]  WITH CHECK ADD  CONSTRAINT [FK_certificado_usuario] FOREIGN KEY([ce_usuario_id])
REFERENCES [dbo].[usuario] ([us_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[certificado] CHECK CONSTRAINT [FK_certificado_usuario]
GO
ALTER TABLE [dbo].[detalle_actividad]  WITH CHECK ADD  CONSTRAINT [FK_detalle_actividad_actividad] FOREIGN KEY([ac_id])
REFERENCES [dbo].[actividad] ([ac_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detalle_actividad] CHECK CONSTRAINT [FK_detalle_actividad_actividad]
GO
ALTER TABLE [dbo].[evaluacion]  WITH CHECK ADD  CONSTRAINT [FK_evaluacion_evaluacion] FOREIGN KEY([de_id])
REFERENCES [dbo].[detalle_actividad] ([de_id])
GO
ALTER TABLE [dbo].[evaluacion] CHECK CONSTRAINT [FK_evaluacion_evaluacion]
GO
ALTER TABLE [dbo].[pregunta]  WITH CHECK ADD  CONSTRAINT [FK_pregunta_evaluacion] FOREIGN KEY([eva_id])
REFERENCES [dbo].[evaluacion] ([eva_id])
GO
ALTER TABLE [dbo].[pregunta] CHECK CONSTRAINT [FK_pregunta_evaluacion]
GO
ALTER TABLE [dbo].[pregunta]  WITH CHECK ADD  CONSTRAINT [FK_pregunta_pregunta] FOREIGN KEY([tip_pre_id])
REFERENCES [dbo].[tipo_pregunta] ([tip_pre_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[pregunta] CHECK CONSTRAINT [FK_pregunta_pregunta]
GO
ALTER TABLE [dbo].[pregunta]  WITH CHECK ADD  CONSTRAINT [FK_pregunta_seccion] FOREIGN KEY([sec_id])
REFERENCES [dbo].[seccion] ([sec_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[pregunta] CHECK CONSTRAINT [FK_pregunta_seccion]
GO
ALTER TABLE [dbo].[progreso]  WITH CHECK ADD  CONSTRAINT [FK_progreso_actividad] FOREIGN KEY([ac_id])
REFERENCES [dbo].[actividad] ([ac_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[progreso] CHECK CONSTRAINT [FK_progreso_actividad]
GO
ALTER TABLE [dbo].[progreso]  WITH CHECK ADD  CONSTRAINT [FK_progreso_usuario] FOREIGN KEY([us_id])
REFERENCES [dbo].[usuario] ([us_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[progreso] CHECK CONSTRAINT [FK_progreso_usuario]
GO
ALTER TABLE [dbo].[respuesta]  WITH CHECK ADD  CONSTRAINT [FK_respuesta_pregunta] FOREIGN KEY([pre_id])
REFERENCES [dbo].[pregunta] ([pre_id])
GO
ALTER TABLE [dbo].[respuesta] CHECK CONSTRAINT [FK_respuesta_pregunta]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_persona] FOREIGN KEY([pe_id])
REFERENCES [dbo].[persona] ([pe_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_persona]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_rol] FOREIGN KEY([ro_id])
REFERENCES [dbo].[rol] ([ro_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_rol]
GO
/****** Object:  StoredProcedure [dbo].[sp_validar_fechas_campania]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_validar_fechas_campania]
    @i_fecha_inicio datetime,
    @i_fecha_fin datetime
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @ExisteSolapamiento bit = 0;
    -- Verificar si existe alguna campaña con fechas que se solapan
    SELECT @ExisteSolapamiento = 1
    FROM campania
    WHERE (
        ((@i_fecha_inicio BETWEEN cam_fecha_inicio AND cam_fecha_fin)
        OR (@i_fecha_fin BETWEEN cam_fecha_inicio AND cam_fecha_fin)
        OR (cam_fecha_inicio BETWEEN @i_fecha_inicio AND @i_fecha_fin)
        OR (cam_fecha_fin BETWEEN @i_fecha_inicio AND @i_fecha_fin)) AND cam_desactivar = 1
    );
	 -- Si existe un solapamiento, mostrar mensaje de error
    IF @ExisteSolapamiento = 1
    BEGIN
        Select @ExisteSolapamiento as respuesta
        RETURN;
    END
    ELSE
    BEGIN
        -- Si no existe ningún solapamiento, las fechas son válidas
         Select @ExisteSolapamiento as respuesta
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_validar_nombre_campania]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_validar_nombre_campania]
    @i_nombre nvarchar(200)
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @ExisteSolapamiento bit = 0;
    -- Verificar si existe alguna campaña con fechas que se solapan
    SELECT @ExisteSolapamiento = 1
    FROM campania
    WHERE cam_nombre=@i_nombre AND cam_desactivar = 1
	 -- Si existe un solapamiento, mostrar mensaje de error
    IF @ExisteSolapamiento = 1
    BEGIN
        Select @ExisteSolapamiento as respuesta
        RETURN;
    END
    ELSE
    BEGIN
        -- Si no existe ningún solapamiento, las fechas son válidas
         Select @ExisteSolapamiento as respuesta
    END
END
GO
/****** Object:  StoredProcedure [dbo].[spd_campania]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spd_campania]
@i_id_campania int
AS
BEGIN TRAN
BEGIN TRY
	UPDATE campania SET cam_desactivar = 0 WHERE cam_id=@i_id_campania
COMMIT TRAN
END TRY
BEGIN CATCH
	 -- Captura información del error
    DECLARE @ErrorNumber INT = ERROR_NUMBER(); -- Número del error
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE(); -- Mensaje de error
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY(); -- Gravedad del error
    DECLARE @ErrorLine INT = ERROR_LINE(); -- Línea donde ocurrió el error
    DECLARE @ErrorProcedure NVARCHAR(200) = ERROR_PROCEDURE(); -- Procedimiento donde ocurrió el error
	INSERT INTO log_procedimiento_almacenado (log_numero,log_severidad,los_procedimiento,log_linea,log_mensaje)
	VALUES(@ErrorNumber,@ErrorSeverity,@ErrorProcedure,@ErrorLine,@ErrorMessage)
	ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spi_campania]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spi_campania]
(
	@i_nombre AS NVARCHAR(200),
	@i_fecha_inicio AS DATE,
	@i_fecha_fin AS DATE,
	@i_modulo AS INT,
	@i_estado AS NVARCHAR(50)
)
AS
DECLARE @campania_id INT;
BEGIN TRAN
BEGIN TRY
	IF EXISTS (SELECT * FROM campania WHERE cam_nombre = @i_nombre and cam_desactivar = 1)
	BEGIN
		SELECT @campania_id = cam_id FROM campania WHERE cam_nombre = @i_nombre and cam_desactivar = 1
	END
	ELSE
	BEGIN
		INSERT INTO campania (cam_nombre,cam_fecha_inicio, cam_fecha_fin, cam_estado, cam_desactivar) VALUES 
		(@i_nombre,@i_fecha_inicio, @i_fecha_fin,@i_estado, 1)
		SELECT @campania_id = cam_id FROM campania WHERE cam_nombre = @i_nombre
	END
	IF NOT EXISTS (SELECT * FROM campania_modulo where cam_id = @campania_id and mo_id = @i_modulo)
	BEGIN 
		INSERT INTO campania_modulo (cam_id, mo_id) values (@campania_id,@i_modulo)
	END
COMMIT TRAN
END TRY
BEGIN CATCH
	 -- Captura información del error
    DECLARE @ErrorNumber INT = ERROR_NUMBER(); -- Número del error
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE(); -- Mensaje de error
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY(); -- Gravedad del error
    DECLARE @ErrorLine INT = ERROR_LINE(); -- Línea donde ocurrió el error
    DECLARE @ErrorProcedure NVARCHAR(200) = ERROR_PROCEDURE(); -- Procedimiento donde ocurrió el error
	INSERT INTO log_procedimiento_almacenado (log_numero,log_severidad,los_procedimiento,log_linea,log_mensaje)
	VALUES(@ErrorNumber,@ErrorSeverity,@ErrorProcedure,@ErrorLine,@ErrorMessage)
	ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spi_inicializar_usuario_actividad]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spi_inicializar_usuario_actividad]
(
	@i_usuario int
)
AS
DECLARE @ac_id INT;
DECLARE @id_campania INT;
BEGIN TRAN
BEGIN TRY
SET NOCOUNT ON;
IF EXISTS (SELECT cam_id FROM campania WHERE cam_estado = 'Activa')
BEGIN
	SELECT @id_campania=cam_id FROM campania WHERE cam_estado = 'Activa'
	DECLARE cursor_actividades CURSOR FOR
	SELECT ac.ac_id FROM campania ca INNER JOIN campania_modulo det ON ca.cam_id=det.cam_id INNER JOIN modulo mo ON det.mo_id=mo.mo_id
	INNER JOIN actividad ac ON mo.mo_id=ac.mo_id WHERE ca.cam_id=@id_campania
	OPEN cursor_actividades;
	FETCH NEXT FROM cursor_actividades INTO @ac_id;
	WHILE @@FETCH_STATUS = 0
	BEGIN

		INSERT INTO progreso (us_id,ac_id,pro_estado, cam_id)
		VALUES(@i_usuario,@ac_id,0,@id_campania)
		FETCH NEXT FROM cursor_actividades INTO @ac_id;

	END
	CLOSE cursor_actividades;
	DEALLOCATE cursor_actividades;
END
COMMIT TRAN
END TRY
BEGIN CATCH
	 -- Captura información del error
    DECLARE @ErrorNumber INT = ERROR_NUMBER(); -- Número del error
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE(); -- Mensaje de error
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY(); -- Gravedad del error
    DECLARE @ErrorLine INT = ERROR_LINE(); -- Línea donde ocurrió el error
    DECLARE @ErrorProcedure NVARCHAR(200) = ERROR_PROCEDURE(); -- Procedimiento donde ocurrió el error
	INSERT INTO log_procedimiento_almacenado (log_numero,log_severidad,los_procedimiento,log_linea,log_mensaje)
	VALUES(@ErrorNumber,@ErrorSeverity,@ErrorProcedure,@ErrorLine,@ErrorMessage)
	ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spi_modulos_usuarios]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spi_modulos_usuarios]
AS
DECLARE @mo_nombre NVARCHAR(200);
DECLARE @mo_id INT;
DECLARE @ti_id INT;
DECLARE @ti_nombre NVARCHAR(200);
BEGIN TRAN
BEGIN TRY
DECLARE modulos_actividades CURSOR FOR
SELECT mo_id, mo_nombre
FROM modulo
OPEN modulos_actividades;
FETCH NEXT FROM modulos_actividades INTO @mo_id, @mo_nombre;
WHILE @@FETCH_STATUS = 0
BEGIN
	--Inicializo nuevo cursor
    DECLARE tipo_actividades CURSOR FOR
	SELECT ti_id,ti_nombre FROM tipo_actividad
	OPEN tipo_actividades;
	FETCH NEXT FROM tipo_actividades INTO @ti_id,@ti_nombre;
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO actividad(ac_nombre,ac_descripcion,ac_estado,ti_id,mo_id)
		VALUES (@mo_nombre,@ti_nombre,1,@ti_id,@mo_id)
		FETCH NEXT FROM tipo_actividades INTO @ti_id,@ti_nombre;
	END
	CLOSE tipo_actividades;
	DEALLOCATE tipo_actividades;

    FETCH NEXT FROM modulos_actividades INTO @mo_id, @mo_nombre;
END
CLOSE modulos_actividades;
DEALLOCATE modulos_actividades;
COMMIT TRAN
SELECT CAST(1 AS BIT) AS exito, 'Actividades registradas con exito' as mensaje
END TRY
BEGIN CATCH
	SELECT CAST(0 AS BIT) AS exito, 'Error al registrar las actividades de los modulos' as mensaje
	ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spi_usuario]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spi_usuario]
(
@i_nombre as nvarchar(200),
@i_correo as nvarchar(200),
@i_fecha_nacimiento as date,
@i_pais as nvarchar(100),
@i_ocupacion as nvarchar(200),
@i_clave as nvarchar(100),
@i_salt as nvarchar(max)
)
as
declare @rol int
declare @codigo_persona int
declare @usuario_id int
begin tran
begin try
if not exists (select * from persona where pe_correo = @i_correo)
begin

	Insert into persona(pe_nombre, pe_correo, pe_fecha_nacimiento, pe_pais, pe_ocupacion)
	values (@i_nombre, @i_correo, @i_fecha_nacimiento, @i_pais, @i_ocupacion)

	set @codigo_persona = SCOPE_IDENTITY()
	
	if not exists (select * from usuario where us_alias = @i_correo)
	begin
		select @rol=ro_id from rol where ro_nombre like '%usuario%'
		Insert into usuario(us_alias, us_clave,ro_id, pe_id, us_estado, us_salt)
		values (@i_correo,@i_clave, @rol, @codigo_persona,0, @i_salt)

	end

	if(@@ROWCOUNT > 0)
	begin
		select cast(1 as bit) as exito, 'Usuario registrado exitosamente' as mensaje
	end
end
else
begin 
	select cast(0 as bit) as exito, 'El correo ya se encuentra registrado' as mensaje
end
Select @usuario_id = us_id from usuario where us_alias = @i_correo
exec spi_inicializar_usuario_actividad @usuario_id
commit tran
end try
begin catch
	select cast(0 as bit) as exito, 'Error al registrar el usuario' as mensaje
	Rollback tran
end catch
GO
/****** Object:  StoredProcedure [dbo].[sps_actividades_modulo]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sps_actividades_modulo]
(
	@i_usuario AS int,
	@i_modulo AS int
)
AS
DECLARE @id_campania INT;
BEGIN

	Select @id_campania=cam_id from campania where cam_estado = 'Activa'
	SELECT actividad.ac_id as Codigo,tipo_actividad.ti_nombre AS Actividad, pro_estado AS Estado, pro_fecha_finalizacion AS Fecha, modulo.mo_nombre AS Modulo, modulo.mo_ruta as Ruta
	FROM campania INNER JOIN progreso ON campania.cam_id=progreso.cam_id INNER JOIN actividad ON progreso.ac_id = actividad.ac_id INNER JOIN modulo ON modulo.mo_id = actividad.mo_id INNER JOIN tipo_actividad 
	ON actividad.ti_id = tipo_actividad.ti_id 
	where actividad.mo_id = @i_modulo AND us_id = @i_usuario AND campania.cam_id = @id_campania
END
GO
/****** Object:  StoredProcedure [dbo].[sps_campania]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sps_campania]
AS
BEGIN
	Select cam_id as Id, cam_nombre as Nombre, cam_fecha_inicio as FechaInicio, cam_fecha_fin as FechaFin, cam_estado as Estado from campania where cam_desactivar = 1
END
GO
/****** Object:  StoredProcedure [dbo].[sps_datos_usuario]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sps_datos_usuario]
AS
BEGIN
	SELECT us_id as Codigo, us_alias as Correo FROM usuario WHERE ro_id=2
END
GO
/****** Object:  StoredProcedure [dbo].[sps_detalle_actividad]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sps_detalle_actividad]
(
	@i_actividad int,
	@i_nombre_actividad nvarchar(100)
)
AS
BEGIN
	IF(@i_nombre_actividad = 'literatura' OR @i_nombre_actividad = 'ejemplo' )
	BEGIN
		SELECT de_id AS Codigo, de_contenido AS Contenido,de_plantilla AS Plantilla FROM detalle_actividad WHERE  de_estado = 1 and ac_id=@i_actividad
	END
	ELSE IF (@i_nombre_actividad = 'cuestionario')
	BEGIN
		Select ev.eva_id as CodigoEvaluacion,pre.pre_id as CodigoPregunta,pre.pre_pregunta as Pregunta,tip.tip_pre_neumonico as TipoPregunta,pre.sec_id as Seccion,pre.pre_orden as Orden,
		(
		Select resp.resp_id as CodigoRespuesta,resp.resp_respuesta as Respuesta,resp_orden as Orden
		from respuesta resp where pre.pre_id=resp.pre_id  FOR JSON PATH
		) AS Respuestas
		from detalle_actividad det inner join evaluacion ev on det.de_id=ev.de_id inner join pregunta pre on ev.eva_id=pre.eva_id inner join tipo_pregunta tip on pre.tip_pre_id=tip.tip_pre_id
		where det.ac_id=@i_actividad and det.de_estado=1 and eva_estado=1
	END
	ELSE IF (@i_nombre_actividad = 'ejercicio')
	BEGIN
		SELECT * FROM detalle_actividad
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sps_estado_actividad]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sps_estado_actividad]
(
	@i_usuario int,
	@i_actividad int,
	@o_estado BIT OUTPUT
)
AS
DECLARE @id_campania INT;
BEGIN
	Select @id_campania=cam_id from campania where cam_estado = 'Activa'
	IF EXISTS( Select * from progreso where pro_fecha_finalizacion is not NULL and pro_respuesta is not NULL and us_id=@i_usuario and ac_id=@i_actividad and cam_id = @id_campania)
	 BEGIN
        SET @o_estado = 1; -- True
    END
    ELSE
    BEGIN
        SET @o_estado = 0; -- False
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sps_existe_usuario]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sps_existe_usuario]
@i_correo NVARCHAR(100)
AS
BEGIN
	IF EXISTS (SELECT * FROM usuario WHERE us_alias = @i_correo)
	BEGIN
		SELECT CAST(1 AS BIT) AS ExisteUsuario
	END
	ELSE
	BEGIN
		SELECT CAST(0 AS BIT) AS ExisteUsuario
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sps_iniciar_sesion_usuario]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sps_iniciar_sesion_usuario]
(
@i_usuario AS NVARCHAR(100),
@i_clave AS NVARCHAR(max)
)
AS
DECLARE @numero_intentos INT = 0;
BEGIN 
	IF EXISTS (SELECT * FROM usuario WHERE us_alias = @i_usuario and us_estado = 0 and us_clave=@i_clave )
	BEGIN
			SELECT usuario.ro_id as Rol, persona.pe_nombre as Nombre, persona.pe_correo as Correo,persona.pe_fecha_nacimiento as FechaNacimiento, usuario.us_alias as Usuario, usuario.us_id as CodigoUsuario FROM usuario inner join persona ON usuario.pe_id = persona.pe_id WHERE usuario.us_alias = @i_usuario
			UPDATE usuario SET us_numero_intentos = 0 WHERE us_alias = @i_usuario
	END
	ELSE
	BEGIN 
		IF exists (SELECT * FROM usuario WHERE us_alias = @i_usuario and us_estado = 1)
		BEGIN
			SELECT cast(0 AS BIT) AS Exito, 'Usuario bloqueado, contacte al administrador' AS Mensaje
		END
		ELSE
		BEGIN
			SELECT @numero_intentos=isNull(us_numero_intentos, 0) FROM usuario WHERE us_alias = @i_usuario
				IF (@numero_intentos = 3)
				BEGIN
					UPDATE usuario SET us_estado = 1 WHERE us_alias = @i_usuario
				END
				ELSE
				BEGIN
					SET @numero_intentos= @numero_intentos + 1
					UPDATE usuario set us_numero_intentos = @numero_intentos WHERE us_alias = @i_usuario
				END
			SELECT CAST(0 AS BIT) AS Exito, 'Credenciales incorrectas' as Mensaje
		END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sps_mejores_puntajes]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sps_mejores_puntajes]
(
	@i_id_campania INT,
	@i_numero_participantes INT = 10,
	@i_tipo nvarchar(100)
)
AS
BEGIN
	SET NOCOUNT ON;
	IF @i_tipo = 'TOP'
    BEGIN
        SELECT TOP (@i_numero_participantes) Correo, Nombre, Puntaje 
        FROM (
            SELECT
				per.pe_correo AS Correo,
                per.pe_nombre AS Nombre, 
                ISNULL(SUM(pro.pro_puntaje) / (SELECT COUNT(*) FROM campania_modulo WHERE cam_id = @i_id_campania), 0) AS Puntaje  
            FROM progreso pro 
            INNER JOIN usuario us ON pro.us_id = us.us_id 
            INNER JOIN persona per ON us.pe_id = per.pe_id  
            WHERE cam_id = @i_id_campania
            GROUP BY per.pe_nombre, per.pe_correo
        ) AS A
        ORDER BY Puntaje DESC;
    END
    ELSE IF @i_tipo = 'GLOBAL'
    BEGIN
        SELECT TOP (@i_numero_participantes) Correo, Nombre, Puntaje 
        FROM (
            SELECT 
				per.pe_correo AS Correo,
                per.pe_nombre AS Nombre, 
                ISNULL(SUM(pro.pro_puntaje) / (SELECT COUNT(*) FROM campania_modulo WHERE cam_id = pro.cam_id), 0) AS Puntaje  
            FROM progreso pro 
            INNER JOIN usuario us ON pro.us_id = us.us_id 
            INNER JOIN persona per ON us.pe_id = per.pe_id
            GROUP BY per.pe_nombre, pro.cam_id, per.pe_correo
        ) AS A
        ORDER BY Puntaje DESC;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[sps_modulos]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sps_modulos]
AS
BEGIN
	SELECT mo_id as Codigo, mo_nombre as Modulo FROM modulo WHERE mo_estado = 1
END
GO
/****** Object:  StoredProcedure [dbo].[sps_modulos_usuario]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sps_modulos_usuario]
(
	@i_usuario int
)
AS
Declare @id_campania int
BEGIN

	Select @id_campania=cam_id from campania where cam_estado = 'Activa'

	Select modulo.mo_id  AS Codigo,mo_nombre AS Nombre ,mo_descripcion AS Descripcion,mo_imagen AS Imagen,mo_ruta AS Ruta,
	((CAST( CAST( (SELECT COUNT(*) FROM progreso INNER JOIN actividad ON progreso.ac_id=actividad.ac_id 
	WHERE actividad.mo_id=modulo.mo_id and progreso.pro_estado=0 and progreso.us_id = @i_usuario and progreso.cam_id=@id_campania) AS DECIMAL(10,2)) / 
	(SELECT COUNT(*) FROM actividad WHERE actividad.mo_id=modulo.mo_id) AS DECIMAL(10,2))) - 1) * (-1)   AS progreso
	FROM campania INNER JOIN  campania_modulo on campania.cam_id=campania_modulo.cam_id INNER JOIN modulo on campania_modulo.mo_id=modulo.mo_id 
	INNER JOIN actividad ON modulo.mo_id=actividad.mo_id INNER JOIN progreso ON actividad.ac_id=progreso.ac_id
	WHERE progreso.us_id = @i_usuario AND campania.cam_id=@id_campania  GROUP BY modulo.mo_id, mo_nombre,mo_descripcion,mo_imagen,mo_ruta

END 
GO
/****** Object:  StoredProcedure [dbo].[sps_obtener_respuestas]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sps_obtener_respuestas]
(
	@i_actividad int
)
AS
BEGIN
	SELECT pre.pre_id as CodigoPregunta, resp.resp_id as CodigoRespuesta
	FROM detalle_actividad det inner join evaluacion ev on det.de_id=ev.de_id inner join pregunta pre on ev.eva_id=pre.eva_id 
	inner join respuesta resp on pre.pre_id=resp.pre_id where resp.resp_correcta=1 and det.ac_id=@i_actividad
END
GO
/****** Object:  StoredProcedure [dbo].[sps_obtener_respuestas_usuario]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sps_obtener_respuestas_usuario]
(
	@i_usuario int,
	@i_actividad int
)
AS
BEGIN
	WITH ProgresoData AS (
    SELECT pro_respuesta
    FROM progreso
    WHERE us_id = @i_usuario AND ac_id = @i_actividad
)
SELECT 
    CodigoPregunta, 
    CodigoRespuesta
FROM ProgresoData
CROSS APPLY OPENJSON(pro_respuesta)
WITH (
    CodigoPregunta INT '$.CodigoPregunta',
    CodigoRespuesta INT '$.CodigoRespuesta'
) AS jsonData;
END
GO
/****** Object:  StoredProcedure [dbo].[sps_reporte_actividades]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sps_reporte_actividades]
(
	@i_codigo_campania INT = 0 
)
AS
BEGIN
	IF(@i_codigo_campania = 0)
	BEGIN
		SELECT top 1 @i_codigo_campania=cam_id FROM campania where cam_estado = 'Activa'
	END
	SELECT 
		pe.pe_nombre AS Nombre, 
		pe.pe_correo AS Correo, 
		ac.ac_nombre AS Modulo, 
		STRING_AGG(ac.ac_descripcion, ', ') AS Actividades
	FROM 
		actividad ac 
		INNER JOIN progreso pr ON ac.ac_id = pr.ac_id 
		INNER JOIN usuario us ON pr.us_id = us.us_id  
		INNER JOIN persona pe ON us.pe_id = pe.pe_id 
	WHERE 
		pr.cam_id = @i_codigo_campania 
		AND pr.pro_fecha_finalizacion IS NULL
	GROUP BY 
		pe.pe_nombre, pe.pe_correo, ac.ac_nombre;
END
GO
/****** Object:  StoredProcedure [dbo].[sps_reporte_evaluacion]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE PROCEDURE [dbo].[sps_reporte_evaluacion]
		(
			@id_usuario INT,
			@id_campania INT,
			@id_modulo INT
		)
		AS
		BEGIN
			SELECT Pregunta, RespuestaSeleccionada, RespuestaCorrecta, Estado FROM(
			SELECT pre.pre_pregunta AS Pregunta, (SELECT resp_respuesta FROM respuesta WHERE resp_id = dpe.resp_id) AS RespuestaSeleccionada , (SELECT resp_respuesta FROM respuesta WHERE pre_id = dpe.pre_id and resp_correcta=1) AS RespuestaCorrecta, dpe.dp_estado AS Estado
			FROM modulo mo inner join actividad ac ON mo.mo_id=ac.mo_id inner join progreso po ON ac.ac_id=po.ac_id inner join detalle_progreso_evaluacion dpe ON 
			po.pro_id=dpe.pro_id inner join pregunta pre ON dpe.pre_id = pre.pre_id inner join respuesta resp ON pre.pre_id=resp.pre_id
			WHERE po.us_id= @id_usuario and po.cam_id = @id_campania and mo.mo_id=@id_modulo) AS T
			GROUP BY Pregunta, RespuestaSeleccionada, RespuestaCorrecta, Estado
		END
GO
/****** Object:  StoredProcedure [dbo].[sps_tipo_actividad]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[sps_tipo_actividad]
(
	@i_actividad int
)
AS
BEGIN
	select ac_descripcion as descripcion from actividad inner join detalle_actividad on actividad.ac_id = detalle_actividad.ac_id where actividad.ac_id=@i_actividad
END
GO
/****** Object:  StoredProcedure [dbo].[sps_usuario_historial_progreso]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sps_usuario_historial_progreso]
(
@i_usuario INT
)
AS
BEGIN
	select ca.cam_nombre AS Campania, us.us_alias AS Correo,pe.pe_nombre as Nombre,  ISNULL(AVG(pro.pro_puntaje),0) as NotaFinal
	from campania ca inner join progreso pro on ca.cam_id = pro.cam_id inner join usuario us on pro.us_id=us.us_id inner join persona pe on us.pe_id=pe.pe_id
	Where pro.us_id=@i_usuario
	Group by ca.cam_id, ca.cam_nombre,us.us_alias,pe.pe_nombre
	Order by ca.cam_id asc
END
GO
/****** Object:  StoredProcedure [dbo].[sps_usuario_salt]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sps_usuario_salt]
@i_usuario NVARCHAR(100)
AS
BEGIN
	IF EXISTS (SELECT * FROM usuario WHERE us_alias = @i_usuario)
	BEGIN
		SELECT us_salt AS Codigo FROM usuario WHERE us_alias = @i_usuario
	END
	ELSE
	BEGIN
		SELECT CAST(0 AS BIT) AS Exito, 'Credenciales incorrectas' AS Mensaje
	END
END
GO
/****** Object:  StoredProcedure [dbo].[sps_usuarios]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sps_usuarios]
AS
BEGIN
	SELECT us_id as CodigoUsuario FROM usuario Where ro_id = 2
END
GO
/****** Object:  StoredProcedure [dbo].[spu_actualizar_progreso]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[spu_actualizar_progreso]
(
	@i_usuario int,
	@i_actividad int,
	@i_respuesta nvarchar(max),
	@i_puntaje int
)
AS
DECLARE @id_campania INT;
DECLARE @id_progreso INT;
BEGIN TRAN
BEGIN TRY
SET NOCOUNT ON;
IF EXISTS (Select cam_id from campania where cam_estado = 'Activa')
BEGIN
	Select @id_campania=cam_id from campania where cam_estado = 'Activa'
	IF (@i_puntaje = -1)
	BEGIN
		Update progreso set pro_estado=1, pro_respuesta=@i_respuesta, pro_fecha_finalizacion=GETDATE() where us_id=@i_usuario and ac_id=@i_actividad and cam_id=@id_campania
	END
	ELSE
	BEGIN
		Update progreso set pro_estado=1, pro_respuesta=@i_respuesta, pro_fecha_finalizacion=GETDATE(), pro_puntaje=@i_puntaje  where us_id=@i_usuario and ac_id=@i_actividad and cam_id=@id_campania
		Select @id_progreso = pro_id from progreso  where us_id=@i_usuario and ac_id=@i_actividad and cam_id=@id_campania
		--Guardar respuestas y preguntas
		Insert into detalle_progreso_evaluacion (pro_id, pre_id, resp_id,dp_estado)
		 SELECT 
			@id_progreso,
            CodigoPregunta,
            CodigoRespuesta,
            CASE 
                WHEN p.resp_id = j.CodigoRespuesta THEN 'C'
                ELSE 'I'
            END AS Estado
        FROM OPENJSON(@i_respuesta)
        WITH (
            CodigoPregunta INT '$.CodigoPregunta',
            CodigoRespuesta INT '$.CodigoRespuesta'
        ) j LEFT JOIN respuesta p
        ON j.CodigoPregunta = p.pre_id Where p.resp_correcta=1;
	END
END
COMMIT TRAN
END TRY
BEGIN CATCH
 -- Captura información del error
    DECLARE @ErrorNumber INT = ERROR_NUMBER(); -- Número del error
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE(); -- Mensaje de error
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY(); -- Gravedad del error
    DECLARE @ErrorLine INT = ERROR_LINE(); -- Línea donde ocurrió el error
    DECLARE @ErrorProcedure NVARCHAR(200) = ERROR_PROCEDURE(); -- Procedimiento donde ocurrió el error
	INSERT INTO log_procedimiento_almacenado (log_numero,log_severidad,los_procedimiento,log_linea,log_mensaje)
	VALUES(@ErrorNumber,@ErrorSeverity,@ErrorProcedure,@ErrorLine,@ErrorMessage)
	ROLLBACK TRAN
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spu_campania]    Script Date: 3/1/2025 22:57:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spu_campania]
@i_fecha_fin DATETIME,
@i_id_campania INT
AS
BEGIN TRAN
BEGIN TRY
	UPDATE campania SET cam_fecha_fin = @i_fecha_fin, cam_estado = 'Finalizada' WHERE cam_id=@i_id_campania
COMMIT TRAN
END TRY
BEGIN CATCH
	 -- Captura información del error
    DECLARE @ErrorNumber INT = ERROR_NUMBER(); -- Número del error
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE(); -- Mensaje de error
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY(); -- Gravedad del error
    DECLARE @ErrorLine INT = ERROR_LINE(); -- Línea donde ocurrió el error
    DECLARE @ErrorProcedure NVARCHAR(200) = ERROR_PROCEDURE(); -- Procedimiento donde ocurrió el error
	INSERT INTO log_procedimiento_almacenado (log_numero,log_severidad,los_procedimiento,log_linea,log_mensaje)
	VALUES(@ErrorNumber,@ErrorSeverity,@ErrorProcedure,@ErrorLine,@ErrorMessage)
	ROLLBACK TRAN
END CATCH
GO
USE [master]
GO
ALTER DATABASE [SecurityEducationDB] SET  READ_WRITE 
GO
