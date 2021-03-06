USE [master]
GO
/****** Object:  Database [BD_PEA]    Script Date: 20/03/2014 04:01:09 p.m. ******/
CREATE DATABASE [BD_PEA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_PEA', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BD_PEA.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BD_PEA_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BD_PEA_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BD_PEA] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_PEA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_PEA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_PEA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_PEA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_PEA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_PEA] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_PEA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_PEA] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BD_PEA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_PEA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_PEA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_PEA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_PEA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_PEA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_PEA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_PEA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_PEA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_PEA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_PEA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_PEA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_PEA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_PEA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_PEA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_PEA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_PEA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BD_PEA] SET  MULTI_USER 
GO
ALTER DATABASE [BD_PEA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_PEA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_PEA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_PEA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BD_PEA]
GO
/****** Object:  Table [dbo].[EAEMFADMIN]    Script Date: 20/03/2014 04:01:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EAEMFADMIN](
	[ID_ADMIN] [int] IDENTITY(1,1) NOT NULL,
	[NOM_NOMBRE] [varchar](50) NOT NULL,
	[NOM_APELLIDO] [varchar](50) NOT NULL,
	[ID_FKUSUARIO] [int] NOT NULL,
 CONSTRAINT [PK_PEA_Admin] PRIMARY KEY CLUSTERED 
(
	[ID_ADMIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EAEMFBITACORA]    Script Date: 20/03/2014 04:01:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EAEMFBITACORA](
	[ID_BITACORA] [int] IDENTITY(1,1) NOT NULL,
	[NUM_HINICIO] [time](7) NOT NULL,
	[NUM_HFIN] [time](7) NOT NULL,
	[FEC_FECHA] [date] NOT NULL,
	[CAN_ESTUDINTES] [int] NOT NULL,
	[DSC_TPREPARADO] [varchar](50) NOT NULL,
	[DSC_TDESARROLLADO] [varchar](50) NOT NULL,
	[DSC_ACTIVIDADES] [varchar](max) NOT NULL,
	[DSC_DUDAS] [varchar](max) NOT NULL,
	[DSC_OBSERVACIONES] [varchar](max) NOT NULL,
 CONSTRAINT [PK_PEA_Bitacora] PRIMARY KEY CLUSTERED 
(
	[ID_BITACORA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EAEMFBITACORATUTOR]    Script Date: 20/03/2014 04:01:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EAEMFBITACORATUTOR](
	[ID_BITACORATUTOR] [int] IDENTITY(1,1) NOT NULL,
	[ID_FKBITACORA] [int] NOT NULL,
	[ID_FKTUTOR] [int] NOT NULL,
 CONSTRAINT [PK_PEA_Bitacora_tutor] PRIMARY KEY CLUSTERED 
(
	[ID_BITACORATUTOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EAEMFDOCUMENTO]    Script Date: 20/03/2014 04:01:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EAEMFDOCUMENTO](
	[ID_DOCUMENTO] [int] NOT NULL,
	[TXT_ARCHIVO] [varchar](50) NOT NULL,
	[FEC_FECHA] [date] NOT NULL,
 CONSTRAINT [PK_PEA_Documentos] PRIMARY KEY CLUSTERED 
(
	[ID_DOCUMENTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EAEMFDOCUMENTOSTALLER]    Script Date: 20/03/2014 04:01:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EAEMFDOCUMENTOSTALLER](
	[ID_DOCUMENTOTALLER] [int] IDENTITY(1,1) NOT NULL,
	[ID_FKDOCUMENTO] [int] NOT NULL,
	[ID_FKTALLER] [int] NOT NULL,
 CONSTRAINT [PK_PEA_Documentos_taller] PRIMARY KEY CLUSTERED 
(
	[ID_DOCUMENTOTALLER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EAEMFESTUDIANTE]    Script Date: 20/03/2014 04:01:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EAEMFESTUDIANTE](
	[ID_ESTUDIANTE] [int] IDENTITY(1,1) NOT NULL,
	[NOM_NOMBRE] [varchar](50) NOT NULL,
	[NOM_APELLIDO] [varchar](50) NOT NULL,
	[TXT_EMAIL] [varchar](50) NOT NULL,
	[TXT_CARRERA] [varchar](50) NOT NULL,
	[NUM_RN] [int] NOT NULL,
	[ID_FKUSUARIO] [int] NOT NULL,
 CONSTRAINT [PK_PEA_Estudiante] PRIMARY KEY CLUSTERED 
(
	[ID_ESTUDIANTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EAEMFESTUDIANTETALLER]    Script Date: 20/03/2014 04:01:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EAEMFESTUDIANTETALLER](
	[ID_ESTUDIANTETALLER] [int] IDENTITY(1,1) NOT NULL,
	[ID_FKESTUDIANTE] [int] NOT NULL,
	[ID_FKTALLER] [int] NOT NULL,
 CONSTRAINT [PK_PEA_Estudiante_taller] PRIMARY KEY CLUSTERED 
(
	[ID_ESTUDIANTETALLER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EAEMFEVALUACION]    Script Date: 20/03/2014 04:01:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EAEMFEVALUACION](
	[ID_EVALUACION] [int] NOT NULL,
	[TXT_FORMULARIO] [varchar](50) NOT NULL,
	[TXT_PERIODO] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PEA_Evaluacion] PRIMARY KEY CLUSTERED 
(
	[ID_EVALUACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EAEMFEVALUACIONTUTOR]    Script Date: 20/03/2014 04:01:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EAEMFEVALUACIONTUTOR](
	[ID_EVALUACIONTUTOR] [int] IDENTITY(1,1) NOT NULL,
	[NUM_VALOR] [int] NOT NULL,
	[ID_FKTUTOR] [int] NOT NULL,
	[ID_FKEVALUACION] [int] NOT NULL,
 CONSTRAINT [PK_PEA_Evaluacion_tutor] PRIMARY KEY CLUSTERED 
(
	[ID_EVALUACIONTUTOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EAEMFMATRICULA]    Script Date: 20/03/2014 04:01:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EAEMFMATRICULA](
	[ID_MATRICULA] [int] IDENTITY(1,1) NOT NULL,
	[NUM_HINICIO] [time](7) NOT NULL,
	[NUM_HFIN] [time](7) NOT NULL,
	[FEC_FINICIO] [date] NOT NULL,
	[FEC_FFIN] [date] NOT NULL,
	[TXT_PERIODO] [varchar](50) NOT NULL,
	[TEXT_SEDE] [varchar](50) NOT NULL,
	[NUM_ESTADO] [int] NOT NULL,
 CONSTRAINT [PK_PEA_Matricula] PRIMARY KEY CLUSTERED 
(
	[ID_MATRICULA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EAEMFSOLICITUD]    Script Date: 20/03/2014 04:01:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EAEMFSOLICITUD](
	[ID_SOLICITUD] [int] IDENTITY(1,1) NOT NULL,
	[ID_FKESTUDIANTE] [int] NOT NULL,
	[ID_FKTALLER] [int] NOT NULL,
 CONSTRAINT [PK_PEA_Solicitud] PRIMARY KEY CLUSTERED 
(
	[ID_SOLICITUD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EAEMFTALLER]    Script Date: 20/03/2014 04:01:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EAEMFTALLER](
	[ID_TALLER] [int] NOT NULL,
	[NOM_NOMBRE] [varchar](50) NOT NULL,
	[TXT_PERIODO] [varchar](50) NOT NULL,
	[NUM_NUMERO] [int] NOT NULL,
	[TXT_SEDE] [varchar](50) NOT NULL,
	[TXT_HORARIO] [varchar](50) NOT NULL,
	[NUM_CUPO] [int] NOT NULL,
	[NUM_MATRICULADOS] [int] NOT NULL,
	[NUM_NUMEROMATRICULA] [int] NOT NULL,
	[ID_FKTUTOR] [int] NOT NULL,
 CONSTRAINT [PK_PEA_Taller] PRIMARY KEY CLUSTERED 
(
	[ID_TALLER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EAEMFTALLERMATRICULA]    Script Date: 20/03/2014 04:01:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EAEMFTALLERMATRICULA](
	[ID_TALLERMATRICULA] [int] IDENTITY(1,1) NOT NULL,
	[ID_FKTALLER] [int] NOT NULL,
	[ID_FKMATRICULA] [int] NOT NULL,
 CONSTRAINT [PK_PEA_Taller_matricula] PRIMARY KEY CLUSTERED 
(
	[ID_TALLERMATRICULA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EAEMFTUTOR]    Script Date: 20/03/2014 04:01:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EAEMFTUTOR](
	[ID_TUTOR] [int] IDENTITY(1,1) NOT NULL,
	[NOM_NOMBRE] [varchar](50) NOT NULL,
	[NOM_APELLIDO] [varchar](50) NOT NULL,
	[TXT_TELEFONO] [varchar](50) NOT NULL,
	[TXT_EMAIL] [varchar](50) NOT NULL,
	[NUM_CUENTA] [varchar](50) NOT NULL,
	[ID_FKUSUARIO] [int] NOT NULL,
 CONSTRAINT [PK_PEA_Tutor] PRIMARY KEY CLUSTERED 
(
	[ID_TUTOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EAEMFUSUARIO]    Script Date: 20/03/2014 04:01:11 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EAEMFUSUARIO](
	[ID_USUARIO] [int] IDENTITY(1,1) NOT NULL,
	[TXT_USUARIO] [varchar](50) NOT NULL,
	[TXT_CONTRASENA] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PEA_Usuario_1] PRIMARY KEY CLUSTERED 
(
	[ID_USUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[EAEMFADMIN]  WITH CHECK ADD  CONSTRAINT [FK_PEA_Admin_PEA_Usuario] FOREIGN KEY([ID_FKUSUARIO])
REFERENCES [dbo].[EAEMFUSUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[EAEMFADMIN] CHECK CONSTRAINT [FK_PEA_Admin_PEA_Usuario]
GO
ALTER TABLE [dbo].[EAEMFBITACORATUTOR]  WITH CHECK ADD  CONSTRAINT [FK_PEA_Bitacora_tutor_PEA_Bitacora] FOREIGN KEY([ID_FKBITACORA])
REFERENCES [dbo].[EAEMFBITACORA] ([ID_BITACORA])
GO
ALTER TABLE [dbo].[EAEMFBITACORATUTOR] CHECK CONSTRAINT [FK_PEA_Bitacora_tutor_PEA_Bitacora]
GO
ALTER TABLE [dbo].[EAEMFBITACORATUTOR]  WITH CHECK ADD  CONSTRAINT [FK_PEA_Bitacora_tutor_PEA_Tutor] FOREIGN KEY([ID_FKTUTOR])
REFERENCES [dbo].[EAEMFTUTOR] ([ID_TUTOR])
GO
ALTER TABLE [dbo].[EAEMFBITACORATUTOR] CHECK CONSTRAINT [FK_PEA_Bitacora_tutor_PEA_Tutor]
GO
ALTER TABLE [dbo].[EAEMFDOCUMENTOSTALLER]  WITH CHECK ADD  CONSTRAINT [FK_PEA_Documentos_taller_PEA_Documentos] FOREIGN KEY([ID_FKDOCUMENTO])
REFERENCES [dbo].[EAEMFDOCUMENTO] ([ID_DOCUMENTO])
GO
ALTER TABLE [dbo].[EAEMFDOCUMENTOSTALLER] CHECK CONSTRAINT [FK_PEA_Documentos_taller_PEA_Documentos]
GO
ALTER TABLE [dbo].[EAEMFDOCUMENTOSTALLER]  WITH CHECK ADD  CONSTRAINT [FK_PEA_Documentos_taller_PEA_Taller] FOREIGN KEY([ID_FKTALLER])
REFERENCES [dbo].[EAEMFTALLER] ([ID_TALLER])
GO
ALTER TABLE [dbo].[EAEMFDOCUMENTOSTALLER] CHECK CONSTRAINT [FK_PEA_Documentos_taller_PEA_Taller]
GO
ALTER TABLE [dbo].[EAEMFESTUDIANTE]  WITH CHECK ADD  CONSTRAINT [FK_PEA_Estudiante_PEA_Usuario] FOREIGN KEY([ID_FKUSUARIO])
REFERENCES [dbo].[EAEMFUSUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[EAEMFESTUDIANTE] CHECK CONSTRAINT [FK_PEA_Estudiante_PEA_Usuario]
GO
ALTER TABLE [dbo].[EAEMFESTUDIANTETALLER]  WITH CHECK ADD  CONSTRAINT [FK_PEA_Estudiante_taller_PEA_Estudiante] FOREIGN KEY([ID_FKESTUDIANTE])
REFERENCES [dbo].[EAEMFESTUDIANTE] ([ID_ESTUDIANTE])
GO
ALTER TABLE [dbo].[EAEMFESTUDIANTETALLER] CHECK CONSTRAINT [FK_PEA_Estudiante_taller_PEA_Estudiante]
GO
ALTER TABLE [dbo].[EAEMFESTUDIANTETALLER]  WITH CHECK ADD  CONSTRAINT [FK_PEA_Estudiante_taller_PEA_Taller] FOREIGN KEY([ID_FKTALLER])
REFERENCES [dbo].[EAEMFTALLER] ([ID_TALLER])
GO
ALTER TABLE [dbo].[EAEMFESTUDIANTETALLER] CHECK CONSTRAINT [FK_PEA_Estudiante_taller_PEA_Taller]
GO
ALTER TABLE [dbo].[EAEMFEVALUACIONTUTOR]  WITH CHECK ADD  CONSTRAINT [FK_PEA_Evaluacion_tutor_PEA_Evaluacion] FOREIGN KEY([ID_FKEVALUACION])
REFERENCES [dbo].[EAEMFEVALUACION] ([ID_EVALUACION])
GO
ALTER TABLE [dbo].[EAEMFEVALUACIONTUTOR] CHECK CONSTRAINT [FK_PEA_Evaluacion_tutor_PEA_Evaluacion]
GO
ALTER TABLE [dbo].[EAEMFEVALUACIONTUTOR]  WITH CHECK ADD  CONSTRAINT [FK_PEA_Evaluacion_tutor_PEA_Tutor] FOREIGN KEY([ID_FKTUTOR])
REFERENCES [dbo].[EAEMFTUTOR] ([ID_TUTOR])
GO
ALTER TABLE [dbo].[EAEMFEVALUACIONTUTOR] CHECK CONSTRAINT [FK_PEA_Evaluacion_tutor_PEA_Tutor]
GO
ALTER TABLE [dbo].[EAEMFSOLICITUD]  WITH CHECK ADD  CONSTRAINT [FK_PEA_Solicitud_PEA_Estudiante] FOREIGN KEY([ID_FKESTUDIANTE])
REFERENCES [dbo].[EAEMFESTUDIANTE] ([ID_ESTUDIANTE])
GO
ALTER TABLE [dbo].[EAEMFSOLICITUD] CHECK CONSTRAINT [FK_PEA_Solicitud_PEA_Estudiante]
GO
ALTER TABLE [dbo].[EAEMFSOLICITUD]  WITH CHECK ADD  CONSTRAINT [FK_PEA_Solicitud_PEA_Taller] FOREIGN KEY([ID_FKTALLER])
REFERENCES [dbo].[EAEMFTALLER] ([ID_TALLER])
GO
ALTER TABLE [dbo].[EAEMFSOLICITUD] CHECK CONSTRAINT [FK_PEA_Solicitud_PEA_Taller]
GO
ALTER TABLE [dbo].[EAEMFTALLER]  WITH CHECK ADD  CONSTRAINT [FK_PEA_Taller_PEA_Tutor] FOREIGN KEY([ID_FKTUTOR])
REFERENCES [dbo].[EAEMFTUTOR] ([ID_TUTOR])
GO
ALTER TABLE [dbo].[EAEMFTALLER] CHECK CONSTRAINT [FK_PEA_Taller_PEA_Tutor]
GO
ALTER TABLE [dbo].[EAEMFTALLERMATRICULA]  WITH CHECK ADD  CONSTRAINT [FK_PEA_Taller_matricula_PEA_Matricula] FOREIGN KEY([ID_FKMATRICULA])
REFERENCES [dbo].[EAEMFMATRICULA] ([ID_MATRICULA])
GO
ALTER TABLE [dbo].[EAEMFTALLERMATRICULA] CHECK CONSTRAINT [FK_PEA_Taller_matricula_PEA_Matricula]
GO
ALTER TABLE [dbo].[EAEMFTALLERMATRICULA]  WITH CHECK ADD  CONSTRAINT [FK_PEA_Taller_matricula_PEA_Taller] FOREIGN KEY([ID_FKTALLER])
REFERENCES [dbo].[EAEMFTALLER] ([ID_TALLER])
GO
ALTER TABLE [dbo].[EAEMFTALLERMATRICULA] CHECK CONSTRAINT [FK_PEA_Taller_matricula_PEA_Taller]
GO
ALTER TABLE [dbo].[EAEMFTUTOR]  WITH CHECK ADD  CONSTRAINT [FK_PEA_Tutor_PEA_Usuario] FOREIGN KEY([ID_FKUSUARIO])
REFERENCES [dbo].[EAEMFUSUARIO] ([ID_USUARIO])
GO
ALTER TABLE [dbo].[EAEMFTUTOR] CHECK CONSTRAINT [FK_PEA_Tutor_PEA_Usuario]
GO
USE [master]
GO
ALTER DATABASE [BD_PEA] SET  READ_WRITE 
GO
