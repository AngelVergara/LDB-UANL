USE [master]
GO
/****** Object:  Database [Practica_1_LBDO_Version5]    Script Date: 29/09/2018 5:19:56 ******/
CREATE DATABASE [Practica_1_LBDO_Version5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practica_1_LBDO_Version5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Practica_1_LBDO_Version5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Practica_1_LBDO_Version5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Practica_1_LBDO_Version5_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practica_1_LBDO_Version5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET RECOVERY FULL 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET  MULTI_USER 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Practica_1_LBDO_Version5', N'ON'
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET QUERY_STORE = OFF
GO
USE [Practica_1_LBDO_Version5]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Practica_1_LBDO_Version5]
GO
/****** Object:  Table [dbo].[Costos]    Script Date: 29/09/2018 5:19:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Costos](
	[Fecha_pago] [date] NULL,
	[nombre_paciente] [varchar](30) NULL,
	[Folio_paciente] [tinyint] NULL,
	[Medicamentos_usado] [varchar](50) NULL,
	[Precio_Med] [money] NULL,
	[Pago_Medico] [money] NULL,
	[CostoTotal]  AS ([Precio_Med]+[Pago_Medico])
) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [INX_CostoT]    Script Date: 29/09/2018 5:19:58 ******/
CREATE CLUSTERED INDEX [INX_CostoT] ON [dbo].[Costos]
(
	[CostoTotal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 29/09/2018 5:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal](
	[Fecha_Naci] [date] NULL,
	[RFC] [varchar](30) NULL,
	[idCurp] [varchar](50) NOT NULL,
	[NumSeg] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[Edad] [tinyint] NULL,
	[Direccion] [varchar](50) NULL,
	[Telefeno] [int] NULL,
	[Antecedentes] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCurp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 29/09/2018 5:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[Folio] [varchar](100) NULL,
	[Fecha] [datetime] NULL,
	[Cedula_Prof] [varchar](30) NULL,
	[Nombre_medic] [varchar](50) NULL,
	[Nombre_Pacien] [varchar](50) NULL,
	[Edad_paciente] [tinyint] NULL,
	[Direccion] [varchar](50) NULL,
	[Telefeno] [int] NULL,
	[Medicamentos] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tratamiento]    Script Date: 29/09/2018 5:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tratamiento](
	[Fecha_Asignacion] [date] NULL,
	[nombre_paciente] [varchar](30) NULL,
	[años_paciente] [tinyint] NULL,
	[Descripccion] [varchar](2000) NULL,
	[Medicamentos_usado] [varchar](50) NULL,
	[Medico_Asign] [int] NULL,
	[Costo_trat] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehiculos]    Script Date: 29/09/2018 5:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculos](
	[Fecha_Comp] [date] NULL,
	[idModelo] [varchar](50) NOT NULL,
	[NumSeg] [int] NULL,
	[Encargado] [varchar](50) NULL,
	[Años_Uso] [tinyint] NULL,
	[Direccion_resguardo] [varchar](50) NULL,
	[Telefeno_asignado] [int] NULL,
	[Kilometros] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[idModelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Practica_1_LBDO_Version5] SET  READ_WRITE 
GO
