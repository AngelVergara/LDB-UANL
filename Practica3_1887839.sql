USE [master]
GO
/****** Object:  Database [Consultorio_Lab]    Script Date: 26/10/2018 0:34:47 ******/
CREATE DATABASE [Consultorio_Lab]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Consultorio_Lab', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Consultorio_Lab.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Consultorio_Lab_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Consultorio_Lab_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Consultorio_Lab] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Consultorio_Lab].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Consultorio_Lab] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET ARITHABORT OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Consultorio_Lab] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Consultorio_Lab] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Consultorio_Lab] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Consultorio_Lab] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET RECOVERY FULL 
GO
ALTER DATABASE [Consultorio_Lab] SET  MULTI_USER 
GO
ALTER DATABASE [Consultorio_Lab] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Consultorio_Lab] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Consultorio_Lab] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Consultorio_Lab] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Consultorio_Lab] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Consultorio_Lab', N'ON'
GO
ALTER DATABASE [Consultorio_Lab] SET QUERY_STORE = OFF
GO
USE [Consultorio_Lab]
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
USE [Consultorio_Lab]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 26/10/2018 0:34:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[ID_Address] [int] NOT NULL,
	[Street_Number] [varchar](50) NOT NULL,
	[Neighborhood] [varchar](50) NOT NULL,
	[District] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[ID_Address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booth]    Script Date: 26/10/2018 0:34:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booth](
	[ID_Booth] [int] NOT NULL,
	[Booth] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Booth] PRIMARY KEY CLUSTERED 
(
	[ID_Booth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 26/10/2018 0:34:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificate](
	[ID_Certificate] [int] NOT NULL,
	[Certificate] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Certificate] PRIMARY KEY CLUSTERED 
(
	[ID_Certificate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 26/10/2018 0:34:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID_Employee] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[First_Surname] [varchar](50) NOT NULL,
	[Second_Surname] [varchar](50) NOT NULL,
	[Birthdate] [date] NOT NULL,
	[Age]  AS (floor(datediff(day,[Birthdate],getdate())/(365.25))),
	[Gender] [char](1) NOT NULL,
	[ID_Address] [int] NOT NULL,
	[Phone_Number] [int] NOT NULL,
	[ID_Certificate] [int] NULL,
	[ID_Role] [tinyint] NOT NULL,
	[ID_Schedule] [tinyint] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID_Employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expedient]    Script Date: 26/10/2018 0:34:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expedient](
	[ID_Expedient] [int] NOT NULL,
	[Expedient] [text] NOT NULL,
 CONSTRAINT [PK_Expedient] PRIMARY KEY CLUSTERED 
(
	[ID_Expedient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Consultorio_Lab] SET  READ_WRITE 
GO
