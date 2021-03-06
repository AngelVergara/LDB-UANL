USE [Consultorio_Lab_V2]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 26/10/2018 2:46:48 ******/
DROP TABLE IF EXISTS [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Doctors_Office]    Script Date: 26/10/2018 2:46:48 ******/
DROP TABLE IF EXISTS [dbo].[Doctors_Office]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 26/10/2018 2:46:48 ******/
DROP TABLE IF EXISTS [dbo].[Doctor]
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 26/10/2018 2:46:48 ******/
DROP TABLE IF EXISTS [dbo].[Certificate]
GO
/****** Object:  Table [dbo].[Booth]    Script Date: 26/10/2018 2:46:48 ******/
DROP TABLE IF EXISTS [dbo].[Booth]
GO
USE [master]
GO
/****** Object:  Database [Consultorio_Lab_V2]    Script Date: 26/10/2018 2:46:48 ******/
DROP DATABASE IF EXISTS [Consultorio_Lab_V2]
GO
/****** Object:  Database [Consultorio_Lab_V2]    Script Date: 26/10/2018 2:46:48 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Consultorio_Lab_V2')
BEGIN
CREATE DATABASE [Consultorio_Lab_V2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Consultorio_Lab_V2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Consultorio_Lab_V2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Consultorio_Lab_V2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Consultorio_Lab_V2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [Consultorio_Lab_V2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Consultorio_Lab_V2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Consultorio_Lab_V2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET RECOVERY FULL 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET  MULTI_USER 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Consultorio_Lab_V2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Consultorio_Lab_V2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Consultorio_Lab_V2', N'ON'
GO
ALTER DATABASE [Consultorio_Lab_V2] SET QUERY_STORE = OFF
GO
USE [Consultorio_Lab_V2]
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
USE [Consultorio_Lab_V2]
GO
/****** Object:  Table [dbo].[Booth]    Script Date: 26/10/2018 2:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Booth]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Booth](
	[ID_Booth] [int] NOT NULL,
	[Booth] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Booth] PRIMARY KEY CLUSTERED 
(
	[ID_Booth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 26/10/2018 2:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Certificate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Certificate](
	[ID_Certificate] [int] NOT NULL,
	[Certificate] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Certificate] PRIMARY KEY CLUSTERED 
(
	[ID_Certificate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 26/10/2018 2:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Doctor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Doctor](
	[ID_Employee] [int] NOT NULL,
	[ID_Doctor] [int] NOT NULL,
	[ID_Specialty] [tinyint] NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[ID_Doctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Doctors_Office]    Script Date: 26/10/2018 2:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Doctors_Office]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Doctors_Office](
	[ID_Doctors_Office] [int] NOT NULL,
	[ID_Branch] [int] NOT NULL,
	[ID_Booth] [int] NOT NULL,
	[ID_Schedule] [tinyint] NOT NULL,
	[ID_Employee] [int] NOT NULL,
 CONSTRAINT [PK_Doctors_Office] PRIMARY KEY CLUSTERED 
(
	[ID_Doctors_Office] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 26/10/2018 2:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
BEGIN
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
END
GO
INSERT [dbo].[Booth] ([ID_Booth], [Booth]) VALUES (1, N' Dermatologia ')
INSERT [dbo].[Booth] ([ID_Booth], [Booth]) VALUES (2, N' Urgencias')
INSERT [dbo].[Booth] ([ID_Booth], [Booth]) VALUES (3, N' Dermatologia ')
INSERT [dbo].[Booth] ([ID_Booth], [Booth]) VALUES (4, N' Urgencias')
INSERT [dbo].[Booth] ([ID_Booth], [Booth]) VALUES (5, N' Pediatria ')
INSERT [dbo].[Booth] ([ID_Booth], [Booth]) VALUES (6, N' Dermatologia ')
INSERT [dbo].[Booth] ([ID_Booth], [Booth]) VALUES (7, N' Pediatria ')
INSERT [dbo].[Booth] ([ID_Booth], [Booth]) VALUES (8, N' Oftalmologia ')
INSERT [dbo].[Booth] ([ID_Booth], [Booth]) VALUES (9, N' Oftalmologia ')
INSERT [dbo].[Booth] ([ID_Booth], [Booth]) VALUES (10, N' Oftalmologia ')
INSERT [dbo].[Booth] ([ID_Booth], [Booth]) VALUES (11, N'Cardiologia ')
INSERT [dbo].[Booth] ([ID_Booth], [Booth]) VALUES (13, N' Urgencias')
INSERT [dbo].[Booth] ([ID_Booth], [Booth]) VALUES (14, N' Oftalmologia ')
INSERT [dbo].[Booth] ([ID_Booth], [Booth]) VALUES (15, N' Oftalmologia ')
INSERT [dbo].[Certificate] ([ID_Certificate], [Certificate]) VALUES (1, N'E2P 2E2')
INSERT [dbo].[Certificate] ([ID_Certificate], [Certificate]) VALUES (2, N'Q3E 0U3')
INSERT [dbo].[Certificate] ([ID_Certificate], [Certificate]) VALUES (3, N'D7B 6K3')
INSERT [dbo].[Certificate] ([ID_Certificate], [Certificate]) VALUES (4, N'E2U 5G6')
INSERT [dbo].[Certificate] ([ID_Certificate], [Certificate]) VALUES (5, N'K9H 8C7')
INSERT [dbo].[Certificate] ([ID_Certificate], [Certificate]) VALUES (6, N'C5Y 8R3')
INSERT [dbo].[Certificate] ([ID_Certificate], [Certificate]) VALUES (7, N'Q3J 5T7')
INSERT [dbo].[Certificate] ([ID_Certificate], [Certificate]) VALUES (8, N'W9O 0I7')
INSERT [dbo].[Certificate] ([ID_Certificate], [Certificate]) VALUES (9, N'Z1U 5Q1')
INSERT [dbo].[Certificate] ([ID_Certificate], [Certificate]) VALUES (10, N'A1A 0N1')
INSERT [dbo].[Certificate] ([ID_Certificate], [Certificate]) VALUES (11, N'A8Q 8U6')
INSERT [dbo].[Certificate] ([ID_Certificate], [Certificate]) VALUES (12, N'R2U 5A0')
INSERT [dbo].[Certificate] ([ID_Certificate], [Certificate]) VALUES (14, N'A3T 2F4')
INSERT [dbo].[Certificate] ([ID_Certificate], [Certificate]) VALUES (15, N'R5G 8I9')
INSERT [dbo].[Doctor] ([ID_Employee], [ID_Doctor], [ID_Specialty]) VALUES (1, 1, 4)
INSERT [dbo].[Doctor] ([ID_Employee], [ID_Doctor], [ID_Specialty]) VALUES (2, 2, 3)
INSERT [dbo].[Doctor] ([ID_Employee], [ID_Doctor], [ID_Specialty]) VALUES (3, 3, 4)
INSERT [dbo].[Doctor] ([ID_Employee], [ID_Doctor], [ID_Specialty]) VALUES (4, 4, 3)
INSERT [dbo].[Doctor] ([ID_Employee], [ID_Doctor], [ID_Specialty]) VALUES (5, 5, 2)
INSERT [dbo].[Doctor] ([ID_Employee], [ID_Doctor], [ID_Specialty]) VALUES (6, 6, 8)
INSERT [dbo].[Doctor] ([ID_Employee], [ID_Doctor], [ID_Specialty]) VALUES (7, 7, 2)
INSERT [dbo].[Doctor] ([ID_Employee], [ID_Doctor], [ID_Specialty]) VALUES (8, 8, 2)
INSERT [dbo].[Doctor] ([ID_Employee], [ID_Doctor], [ID_Specialty]) VALUES (9, 9, 2)
INSERT [dbo].[Doctor] ([ID_Employee], [ID_Doctor], [ID_Specialty]) VALUES (10, 10, 2)
INSERT [dbo].[Doctor] ([ID_Employee], [ID_Doctor], [ID_Specialty]) VALUES (12, 12, 8)
INSERT [dbo].[Doctor] ([ID_Employee], [ID_Doctor], [ID_Specialty]) VALUES (13, 13, 8)
INSERT [dbo].[Doctor] ([ID_Employee], [ID_Doctor], [ID_Specialty]) VALUES (14, 14, 2)
INSERT [dbo].[Doctor] ([ID_Employee], [ID_Doctor], [ID_Specialty]) VALUES (15, 15, 8)
INSERT [dbo].[Doctors_Office] ([ID_Doctors_Office], [ID_Branch], [ID_Booth], [ID_Schedule], [ID_Employee]) VALUES (1, 1, 1, 3, 1)
INSERT [dbo].[Doctors_Office] ([ID_Doctors_Office], [ID_Branch], [ID_Booth], [ID_Schedule], [ID_Employee]) VALUES (2, 2, 2, 2, 2)
INSERT [dbo].[Doctors_Office] ([ID_Doctors_Office], [ID_Branch], [ID_Booth], [ID_Schedule], [ID_Employee]) VALUES (3, 3, 3, 1, 3)
INSERT [dbo].[Doctors_Office] ([ID_Doctors_Office], [ID_Branch], [ID_Booth], [ID_Schedule], [ID_Employee]) VALUES (4, 4, 4, 1, 4)
INSERT [dbo].[Doctors_Office] ([ID_Doctors_Office], [ID_Branch], [ID_Booth], [ID_Schedule], [ID_Employee]) VALUES (5, 5, 5, 2, 5)
INSERT [dbo].[Doctors_Office] ([ID_Doctors_Office], [ID_Branch], [ID_Booth], [ID_Schedule], [ID_Employee]) VALUES (6, 6, 6, 1, 6)
INSERT [dbo].[Doctors_Office] ([ID_Doctors_Office], [ID_Branch], [ID_Booth], [ID_Schedule], [ID_Employee]) VALUES (7, 7, 7, 2, 7)
INSERT [dbo].[Doctors_Office] ([ID_Doctors_Office], [ID_Branch], [ID_Booth], [ID_Schedule], [ID_Employee]) VALUES (8, 8, 8, 3, 8)
INSERT [dbo].[Doctors_Office] ([ID_Doctors_Office], [ID_Branch], [ID_Booth], [ID_Schedule], [ID_Employee]) VALUES (9, 9, 9, 3, 9)
INSERT [dbo].[Doctors_Office] ([ID_Doctors_Office], [ID_Branch], [ID_Booth], [ID_Schedule], [ID_Employee]) VALUES (10, 10, 10, 2, 10)
INSERT [dbo].[Doctors_Office] ([ID_Doctors_Office], [ID_Branch], [ID_Booth], [ID_Schedule], [ID_Employee]) VALUES (11, 11, 11, 1, 11)
INSERT [dbo].[Doctors_Office] ([ID_Doctors_Office], [ID_Branch], [ID_Booth], [ID_Schedule], [ID_Employee]) VALUES (12, 12, 12, 1, 12)
INSERT [dbo].[Doctors_Office] ([ID_Doctors_Office], [ID_Branch], [ID_Booth], [ID_Schedule], [ID_Employee]) VALUES (13, 13, 13, 2, 13)
INSERT [dbo].[Doctors_Office] ([ID_Doctors_Office], [ID_Branch], [ID_Booth], [ID_Schedule], [ID_Employee]) VALUES (14, 14, 14, 1, 14)
INSERT [dbo].[Employee] ([ID_Employee], [Name], [First_Surname], [Second_Surname], [Birthdate], [Gender], [ID_Address], [Phone_Number], [ID_Certificate], [ID_Role], [ID_Schedule]) VALUES (1, N'Uriah', N'Rocha', N'Warner', CAST(N'1998-05-02' AS Date), N'M', 1, 85981954, 1, 3, 1)
INSERT [dbo].[Employee] ([ID_Employee], [Name], [First_Surname], [Second_Surname], [Birthdate], [Gender], [ID_Address], [Phone_Number], [ID_Certificate], [ID_Role], [ID_Schedule]) VALUES (2, N'Charles', N'Vasquez', N'Hodge', CAST(N'1993-07-13' AS Date), N'M', 2, 99319548, 2, 2, 4)
INSERT [dbo].[Employee] ([ID_Employee], [Name], [First_Surname], [Second_Surname], [Birthdate], [Gender], [ID_Address], [Phone_Number], [ID_Certificate], [ID_Role], [ID_Schedule]) VALUES (3, N'Griffin', N'Kirk', N'Anderson', CAST(N'1983-12-29' AS Date), N'M', 3, 75624931, 3, 3, 4)
INSERT [dbo].[Employee] ([ID_Employee], [Name], [First_Surname], [Second_Surname], [Birthdate], [Gender], [ID_Address], [Phone_Number], [ID_Certificate], [ID_Role], [ID_Schedule]) VALUES (4, N'Jakeem', N'Osborne', N'Cunningham', CAST(N'1940-02-02' AS Date), N'M', 4, 97613682, 4, 1, 4)
INSERT [dbo].[Employee] ([ID_Employee], [Name], [First_Surname], [Second_Surname], [Birthdate], [Gender], [ID_Address], [Phone_Number], [ID_Certificate], [ID_Role], [ID_Schedule]) VALUES (5, N'Shelley', N'Lindsay', N'Hutchinson', CAST(N'1949-02-16' AS Date), N'F', 5, 81562559, 5, 2, 2)
INSERT [dbo].[Employee] ([ID_Employee], [Name], [First_Surname], [Second_Surname], [Birthdate], [Gender], [ID_Address], [Phone_Number], [ID_Certificate], [ID_Role], [ID_Schedule]) VALUES (7, N'Lionel', N'Carrillo', N'Stephens', CAST(N'2008-05-10' AS Date), N'F', 7, 30524460, 7, 2, 2)
INSERT [dbo].[Employee] ([ID_Employee], [Name], [First_Surname], [Second_Surname], [Birthdate], [Gender], [ID_Address], [Phone_Number], [ID_Certificate], [ID_Role], [ID_Schedule]) VALUES (8, N'Lars', N'Summers', N'Brennan', CAST(N'1947-11-01' AS Date), N'M', 8, 61613868, 8, 2, 3)
INSERT [dbo].[Employee] ([ID_Employee], [Name], [First_Surname], [Second_Surname], [Birthdate], [Gender], [ID_Address], [Phone_Number], [ID_Certificate], [ID_Role], [ID_Schedule]) VALUES (9, N'Portia', N'Dunlap', N'Hyde', CAST(N'1981-09-02' AS Date), N'M', 9, 40758246, 9, 4, 4)
INSERT [dbo].[Employee] ([ID_Employee], [Name], [First_Surname], [Second_Surname], [Birthdate], [Gender], [ID_Address], [Phone_Number], [ID_Certificate], [ID_Role], [ID_Schedule]) VALUES (10, N'Christopher', N'Townsend', N'Mcmahon', CAST(N'1943-12-16' AS Date), N'M', 10, 56662153, 10, 3, 2)
INSERT [dbo].[Employee] ([ID_Employee], [Name], [First_Surname], [Second_Surname], [Birthdate], [Gender], [ID_Address], [Phone_Number], [ID_Certificate], [ID_Role], [ID_Schedule]) VALUES (11, N'Aidan', N'Gamble', N'Mercado', CAST(N'1949-07-01' AS Date), N'M', 11, 39792777, 11, 4, 4)
INSERT [dbo].[Employee] ([ID_Employee], [Name], [First_Surname], [Second_Surname], [Birthdate], [Gender], [ID_Address], [Phone_Number], [ID_Certificate], [ID_Role], [ID_Schedule]) VALUES (12, N'Octavia', N'Jordan', N'Becker', CAST(N'1997-10-30' AS Date), N'F', 12, 85216312, 12, 4, 2)
INSERT [dbo].[Employee] ([ID_Employee], [Name], [First_Surname], [Second_Surname], [Birthdate], [Gender], [ID_Address], [Phone_Number], [ID_Certificate], [ID_Role], [ID_Schedule]) VALUES (13, N'Benjamin', N'Mays', N'Gilmore', CAST(N'1984-05-27' AS Date), N'M', 13, 14842278, 13, 3, 1)
INSERT [dbo].[Employee] ([ID_Employee], [Name], [First_Surname], [Second_Surname], [Birthdate], [Gender], [ID_Address], [Phone_Number], [ID_Certificate], [ID_Role], [ID_Schedule]) VALUES (14, N'Jayme', N'Howard', N'Beard', CAST(N'1987-11-27' AS Date), N'M', 14, 48187190, 14, 4, 3)
INSERT [dbo].[Employee] ([ID_Employee], [Name], [First_Surname], [Second_Surname], [Birthdate], [Gender], [ID_Address], [Phone_Number], [ID_Certificate], [ID_Role], [ID_Schedule]) VALUES (15, N'Jackson', N'Hall', N'Battle', CAST(N'1947-09-26' AS Date), N'F', 15, 57332041, 15, 1, 4)
INSERT [dbo].[Employee] ([ID_Employee], [Name], [First_Surname], [Second_Surname], [Birthdate], [Gender], [ID_Address], [Phone_Number], [ID_Certificate], [ID_Role], [ID_Schedule]) VALUES (16, N'Sophia', N'Wong', N'Castillo', CAST(N'1988-03-11' AS Date), N'F', 16, 58933055, 16, 3, 4)
INSERT [dbo].[Employee] ([ID_Employee], [Name], [First_Surname], [Second_Surname], [Birthdate], [Gender], [ID_Address], [Phone_Number], [ID_Certificate], [ID_Role], [ID_Schedule]) VALUES (17, N'Dale', N'Kennedy', N'Suarez', CAST(N'1920-02-09' AS Date), N'M', 17, 18925413, 17, 1, 3)
INSERT [dbo].[Employee] ([ID_Employee], [Name], [First_Surname], [Second_Surname], [Birthdate], [Gender], [ID_Address], [Phone_Number], [ID_Certificate], [ID_Role], [ID_Schedule]) VALUES (18, N'Keelie', N'Oneill', N'Delaney', CAST(N'1998-06-21' AS Date), N'M', 18, 48549470, 18, 3, 2)
INSERT [dbo].[Employee] ([ID_Employee], [Name], [First_Surname], [Second_Surname], [Birthdate], [Gender], [ID_Address], [Phone_Number], [ID_Certificate], [ID_Role], [ID_Schedule]) VALUES (19, N'Axel', N'Levy', N'Schneider', CAST(N'2000-12-05' AS Date), N'M', 19, 58261603, 19, 4, 4)
USE [master]
GO
ALTER DATABASE [Consultorio_Lab_V2] SET  READ_WRITE 
GO
