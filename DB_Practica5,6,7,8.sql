USE [CONSULTORIO_LSTI]
GO
/****** Object:  Trigger [Products_AU]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TRIGGER IF EXISTS [dbo].[Products_AU]
GO
/****** Object:  Trigger [Products_AI]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TRIGGER IF EXISTS [dbo].[Products_AI]
GO
/****** Object:  Trigger [Products_AD]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TRIGGER IF EXISTS [dbo].[Products_AD]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [CK_UnitsOnOrder]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [CK_UnitsInStock]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [CK_ReorderLevel]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [CK_Products_UnitPrice]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order Details]') AND type in (N'U'))
ALTER TABLE [dbo].[Order Details] DROP CONSTRAINT IF EXISTS [CK_UnitPrice]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order Details]') AND type in (N'U'))
ALTER TABLE [dbo].[Order Details] DROP CONSTRAINT IF EXISTS [CK_Quantity]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order Details]') AND type in (N'U'))
ALTER TABLE [dbo].[Order Details] DROP CONSTRAINT IF EXISTS [CK_Discount]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Territories]') AND type in (N'U'))
ALTER TABLE [dbo].[Territories] DROP CONSTRAINT IF EXISTS [FK_Territories_Region]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_Suppliers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_Categories]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Prescription_Product]') AND type in (N'U'))
ALTER TABLE [dbo].[Prescription_Product] DROP CONSTRAINT IF EXISTS [FK_Prescription_Product_Prescription]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patient]') AND type in (N'U'))
ALTER TABLE [dbo].[Patient] DROP CONSTRAINT IF EXISTS [FK_Patient_Expedient]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Patient]') AND type in (N'U'))
ALTER TABLE [dbo].[Patient] DROP CONSTRAINT IF EXISTS [FK_Patient_Address]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT IF EXISTS [FK_Orders_Shippers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT IF EXISTS [FK_Orders_Employee]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT IF EXISTS [FK_Orders_Customers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order Details]') AND type in (N'U'))
ALTER TABLE [dbo].[Order Details] DROP CONSTRAINT IF EXISTS [FK_Order_Details_Products]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order Details]') AND type in (N'U'))
ALTER TABLE [dbo].[Order Details] DROP CONSTRAINT IF EXISTS [FK_Order_Details_Orders]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeTerritories]') AND type in (N'U'))
ALTER TABLE [dbo].[EmployeeTerritories] DROP CONSTRAINT IF EXISTS [FK_EmployeeTerritories_Territories]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EmployeeTerritories]') AND type in (N'U'))
ALTER TABLE [dbo].[EmployeeTerritories] DROP CONSTRAINT IF EXISTS [FK_EmployeeTerritories_Employee]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT IF EXISTS [FK_Employee_Schedule]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT IF EXISTS [FK_Employee_Role]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT IF EXISTS [FK_Employee_Certificate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT IF EXISTS [FK_Employee_Address]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [DF_Products_Discontinued]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [DF_Products_ReorderLevel]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [DF_Products_UnitsOnOrder]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [DF_Products_UnitsInStock]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [DF_Products_UnitPrice]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
ALTER TABLE [dbo].[Orders] DROP CONSTRAINT IF EXISTS [DF_Orders_Freight]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order Details]') AND type in (N'U'))
ALTER TABLE [dbo].[Order Details] DROP CONSTRAINT IF EXISTS [DF_Order_Details_Discount]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order Details]') AND type in (N'U'))
ALTER TABLE [dbo].[Order Details] DROP CONSTRAINT IF EXISTS [DF_Order_Details_Quantity]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order Details]') AND type in (N'U'))
ALTER TABLE [dbo].[Order Details] DROP CONSTRAINT IF EXISTS [DF_Order_Details_UnitPrice]
GO
/****** Object:  Table [dbo].[Territories]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Territories]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Suppliers]
GO
/****** Object:  Table [dbo].[Specialty]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Specialty]
GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Shippers]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Schedule]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Role]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Region]
GO
/****** Object:  Table [dbo].[Products_LOG]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Products_LOG]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Products]
GO
/****** Object:  Table [dbo].[Prescription_Product]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Prescription_Product]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Prescription]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Patient]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Orders]
GO
/****** Object:  Table [dbo].[Order Details]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Order Details]
GO
/****** Object:  Table [dbo].[Health_Care]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Health_Care]
GO
/****** Object:  Table [dbo].[Expedient]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Expedient]
GO
/****** Object:  Table [dbo].[EmployeeTerritories]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[EmployeeTerritories]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Doctors_Office]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Doctors_Office]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Doctor]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Customers]
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Certificate]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Categories]
GO
/****** Object:  Table [dbo].[Booth]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Booth]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Appointment]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP TABLE IF EXISTS [dbo].[Address]
GO
USE [master]
GO
/****** Object:  Database [CONSULTORIO_LSTI]    Script Date: 27/10/2018 05:23:13 a. m. ******/
DROP DATABASE IF EXISTS [CONSULTORIO_LSTI]
GO
/****** Object:  Database [CONSULTORIO_LSTI]    Script Date: 27/10/2018 05:23:13 a. m. ******/
CREATE DATABASE [CONSULTORIO_LSTI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CONSULTORIO_LSTI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CONSULTORIO_LSTI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CONSULTORIO_LSTI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CONSULTORIO_LSTI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CONSULTORIO_LSTI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET ARITHABORT OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET RECOVERY FULL 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET  MULTI_USER 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CONSULTORIO_LSTI', N'ON'
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET QUERY_STORE = OFF
GO
USE [CONSULTORIO_LSTI]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 27/10/2018 05:23:13 a. m. ******/
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
/****** Object:  Table [dbo].[Appointment]    Script Date: 27/10/2018 05:23:14 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[ID_Appointment] [uniqueidentifier] NOT NULL,
	[ID_Patient] [uniqueidentifier] NOT NULL,
	[ID_Doctor] [int] NOT NULL,
	[ID_Doctors_Office] [int] NOT NULL,
	[ID_Prescription] [uniqueidentifier] NOT NULL,
	[ID_Health_Care] [int] NOT NULL,
	[Fecha] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[ID_Appointment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booth]    Script Date: 27/10/2018 05:23:14 a. m. ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 27/10/2018 05:23:14 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 27/10/2018 05:23:14 a. m. ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 27/10/2018 05:23:14 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [nchar](5) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 27/10/2018 05:23:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[ID_Employee] [int] NOT NULL,
	[ID_Doctor] [int] NOT NULL,
	[ID_Specialty] [tinyint] NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[ID_Doctor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors_Office]    Script Date: 27/10/2018 05:23:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 27/10/2018 05:23:15 a. m. ******/
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
/****** Object:  Table [dbo].[EmployeeTerritories]    Script Date: 27/10/2018 05:23:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeTerritories](
	[ID_Employee] [int] NOT NULL,
	[TerritoryID] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY NONCLUSTERED 
(
	[ID_Employee] ASC,
	[TerritoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Expedient]    Script Date: 27/10/2018 05:23:15 a. m. ******/
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
/****** Object:  Table [dbo].[Health_Care]    Script Date: 27/10/2018 05:23:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Health_Care](
	[ID_Health_Care] [int] NOT NULL,
	[Height] [decimal](4, 2) NOT NULL,
	[Weight] [decimal](4, 2) NOT NULL,
	[BMI]  AS ([Weight]/([Height]*[Height])),
 CONSTRAINT [PK_Health_Care] PRIMARY KEY CLUSTERED 
(
	[ID_Health_Care] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order Details]    Script Date: 27/10/2018 05:23:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Details](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Discount] [real] NOT NULL,
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27/10/2018 05:23:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nchar](5) NULL,
	[ID_Employee] [int] NOT NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[ShipVia] [int] NULL,
	[Freight] [money] NULL,
	[ShipName] [nvarchar](40) NULL,
	[ShipAddress] [nvarchar](60) NULL,
	[ShipCity] [nvarchar](15) NULL,
	[ShipRegion] [nvarchar](15) NULL,
	[ShipPostalCode] [nvarchar](10) NULL,
	[ShipCountry] [nvarchar](15) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 27/10/2018 05:23:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[ID_Patient] [uniqueidentifier] NOT NULL,
	[Patient_num] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[First_Surname] [varchar](50) NOT NULL,
	[Second_Surname] [varchar](50) NOT NULL,
	[Birthdate] [date] NOT NULL,
	[Age]  AS (floor(datediff(day,[Birthdate],getdate())/(365.25))),
	[ID_Address] [int] NOT NULL,
	[ID_Expedient] [int] NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[ID_Patient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 27/10/2018 05:23:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[ID_Prescription] [uniqueidentifier] NOT NULL,
	[ID_Appointment] [uniqueidentifier] NOT NULL,
	[Diagnosis] [text] NOT NULL,
 CONSTRAINT [PK_Prescription] PRIMARY KEY CLUSTERED 
(
	[ID_Prescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription_Product]    Script Date: 27/10/2018 05:23:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription_Product](
	[ID_Prescription_Product] [int] NOT NULL,
	[ID_Prescription] [uniqueidentifier] NOT NULL,
	[ID_Product] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Prescription_Product] PRIMARY KEY CLUSTERED 
(
	[ID_Prescription_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 27/10/2018 05:23:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_LOG]    Script Date: 27/10/2018 05:23:15 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_LOG](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NOT NULL,
	[Event] [varchar](10) NULL,
	[EventDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 27/10/2018 05:23:16 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[RegionID] [int] NOT NULL,
	[RegionDescription] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY NONCLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 27/10/2018 05:23:16 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID_Role] [tinyint] NOT NULL,
	[Role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 27/10/2018 05:23:16 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ID_Schedule] [tinyint] NOT NULL,
	[Schedule] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Horario] PRIMARY KEY CLUSTERED 
(
	[ID_Schedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 27/10/2018 05:23:16 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippers](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[Phone] [nvarchar](24) NULL,
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialty]    Script Date: 27/10/2018 05:23:16 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialty](
	[ID_Specialty] [tinyint] NOT NULL,
	[Specialty] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Specialty] PRIMARY KEY CLUSTERED 
(
	[ID_Specialty] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 27/10/2018 05:23:16 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
	[HomePage] [ntext] NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Territories]    Script Date: 27/10/2018 05:23:16 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Territories](
	[TerritoryID] [nvarchar](20) NOT NULL,
	[TerritoryDescription] [nchar](50) NOT NULL,
	[RegionID] [int] NOT NULL,
 CONSTRAINT [PK_Territories] PRIMARY KEY NONCLUSTERED 
(
	[TerritoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order Details] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[Order Details] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Order Details] ADD  CONSTRAINT [DF_Order_Details_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Freight]  DEFAULT ((0)) FOR [Freight]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitsInStock]  DEFAULT ((0)) FOR [UnitsInStock]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitsOnOrder]  DEFAULT ((0)) FOR [UnitsOnOrder]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ReorderLevel]  DEFAULT ((0)) FOR [ReorderLevel]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Discontinued]  DEFAULT ((0)) FOR [Discontinued]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Address] FOREIGN KEY([ID_Address])
REFERENCES [dbo].[Address] ([ID_Address])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Address]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Certificate] FOREIGN KEY([ID_Certificate])
REFERENCES [dbo].[Certificate] ([ID_Certificate])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Certificate]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([ID_Role])
REFERENCES [dbo].[Role] ([ID_Role])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Schedule] FOREIGN KEY([ID_Schedule])
REFERENCES [dbo].[Schedule] ([ID_Schedule])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Schedule]
GO
ALTER TABLE [dbo].[EmployeeTerritories]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTerritories_Employee] FOREIGN KEY([ID_Employee])
REFERENCES [dbo].[Employee] ([ID_Employee])
GO
ALTER TABLE [dbo].[EmployeeTerritories] CHECK CONSTRAINT [FK_EmployeeTerritories_Employee]
GO
ALTER TABLE [dbo].[EmployeeTerritories]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeTerritories_Territories] FOREIGN KEY([TerritoryID])
REFERENCES [dbo].[Territories] ([TerritoryID])
GO
ALTER TABLE [dbo].[EmployeeTerritories] CHECK CONSTRAINT [FK_EmployeeTerritories_Territories]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order_Details_Orders]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order_Details_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Employee] FOREIGN KEY([ID_Employee])
REFERENCES [dbo].[Employee] ([ID_Employee])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employee]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY([ShipVia])
REFERENCES [dbo].[Shippers] ([ShipperID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shippers]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Address] FOREIGN KEY([ID_Address])
REFERENCES [dbo].[Address] ([ID_Address])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Address]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Expedient] FOREIGN KEY([ID_Expedient])
REFERENCES [dbo].[Expedient] ([ID_Expedient])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Expedient]
GO
ALTER TABLE [dbo].[Prescription_Product]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Product_Prescription] FOREIGN KEY([ID_Prescription])
REFERENCES [dbo].[Prescription] ([ID_Prescription])
GO
ALTER TABLE [dbo].[Prescription_Product] CHECK CONSTRAINT [FK_Prescription_Product_Prescription]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[Territories]  WITH CHECK ADD  CONSTRAINT [FK_Territories_Region] FOREIGN KEY([RegionID])
REFERENCES [dbo].[Region] ([RegionID])
GO
ALTER TABLE [dbo].[Territories] CHECK CONSTRAINT [FK_Territories_Region]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [CK_Discount] CHECK  (([Discount]>=(0) AND [Discount]<=(1)))
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [CK_Discount]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [CK_Quantity] CHECK  (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [CK_Quantity]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitPrice] CHECK  (([UnitPrice]>=(0)))
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [CK_UnitPrice]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_Products_UnitPrice] CHECK  (([UnitPrice]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_Products_UnitPrice]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_ReorderLevel] CHECK  (([ReorderLevel]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_ReorderLevel]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitsInStock] CHECK  (([UnitsInStock]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_UnitsInStock]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitsOnOrder] CHECK  (([UnitsOnOrder]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_UnitsOnOrder]
GO
/****** Object:  Trigger [dbo].[Products_AD]    Script Date: 27/10/2018 05:23:16 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Products_AD]
ON [dbo].[Products]
AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Products_LOG(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued,Event,EventDate)
	SELECT ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued,'Delete',GETDATE()
	FROM deleted
END
GO
ALTER TABLE [dbo].[Products] ENABLE TRIGGER [Products_AD]
GO
/****** Object:  Trigger [dbo].[Products_AI]    Script Date: 27/10/2018 05:23:16 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Products_AI]
ON [dbo].[Products]
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Products_LOG(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued,Event,EventDate)
	SELECT ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued,'Insert',GETDATE()
	FROM inserted
END
GO
ALTER TABLE [dbo].[Products] ENABLE TRIGGER [Products_AI]
GO
/****** Object:  Trigger [dbo].[Products_AU]    Script Date: 27/10/2018 05:23:16 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Products_AU]
ON [dbo].[Products]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Products_LOG(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued,Event,EventDate)
	SELECT ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued,'Update',GETDATE()
	FROM inserted
END
GO
ALTER TABLE [dbo].[Products] ENABLE TRIGGER [Products_AU]
GO
USE [master]
GO
ALTER DATABASE [CONSULTORIO_LSTI] SET  READ_WRITE 
GO
