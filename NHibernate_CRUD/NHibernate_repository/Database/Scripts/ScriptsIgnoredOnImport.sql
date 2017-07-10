
USE [master]
GO

/****** Object:  Database [NHibernate_Repository]    Script Date: 09/07/2017 2:46:06 CH ******/
CREATE DATABASE [NHibernate_Repository]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NHibernate_Repository', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\NHibernate_Repository.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NHibernate_Repository_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\NHibernate_Repository_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [NHibernate_Repository] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NHibernate_Repository].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [NHibernate_Repository] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [NHibernate_Repository] SET ANSI_NULLS OFF
GO

ALTER DATABASE [NHibernate_Repository] SET ANSI_PADDING OFF
GO

ALTER DATABASE [NHibernate_Repository] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [NHibernate_Repository] SET ARITHABORT OFF
GO

ALTER DATABASE [NHibernate_Repository] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [NHibernate_Repository] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [NHibernate_Repository] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [NHibernate_Repository] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [NHibernate_Repository] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [NHibernate_Repository] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [NHibernate_Repository] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [NHibernate_Repository] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [NHibernate_Repository] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [NHibernate_Repository] SET  DISABLE_BROKER
GO

ALTER DATABASE [NHibernate_Repository] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO

ALTER DATABASE [NHibernate_Repository] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [NHibernate_Repository] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [NHibernate_Repository] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [NHibernate_Repository] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [NHibernate_Repository] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [NHibernate_Repository] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [NHibernate_Repository] SET RECOVERY FULL
GO

ALTER DATABASE [NHibernate_Repository] SET  MULTI_USER
GO

ALTER DATABASE [NHibernate_Repository] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [NHibernate_Repository] SET DB_CHAINING OFF
GO

ALTER DATABASE [NHibernate_Repository] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO

ALTER DATABASE [NHibernate_Repository] SET TARGET_RECOVERY_TIME = 0 SECONDS
GO

ALTER DATABASE [NHibernate_Repository] SET DELAYED_DURABILITY = DISABLED
GO

EXEC sys.sp_db_vardecimal_storage_format N'NHibernate_Repository', N'ON'
GO

USE [NHibernate_Repository]
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 09/07/2017 2:46:07 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Order]    Script Date: 09/07/2017 2:46:07 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET IDENTITY_INSERT [dbo].[Customer] ON
GO

INSERT [dbo].[Customer] ([CustomerID], [CompanyName], [ContactName]) VALUES (1, N'NoCompany', N'NoContact')
GO

INSERT [dbo].[Customer] ([CustomerID], [CompanyName], [ContactName]) VALUES (2, N'NoCompany 2', N'NoContact 2')
GO

SET IDENTITY_INSERT [dbo].[Customer] OFF
GO

SET IDENTITY_INSERT [dbo].[Order] ON
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (1, 1, CAST(N'2017-07-09 00:00:00.000' AS DateTime), N'NoAddress')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (1, 3, CAST(N'2017-07-09 00:00:00.000' AS DateTime), N'NoAddress')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (2, 4, CAST(N'2017-07-09 00:00:00.000' AS DateTime), N'NoAddress')
GO

SET IDENTITY_INSERT [dbo].[Order] OFF
GO

USE [master]
GO

ALTER DATABASE [NHibernate_Repository] SET  READ_WRITE
GO

USE [master]
GO

/****** Object:  Database [NHibernate_Repository]    Script Date: 10/07/2017 7:57:53 SA ******/
CREATE DATABASE [NHibernate_Repository]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NHibernate_Repository', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\NHibernate_Repository.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NHibernate_Repository_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\NHibernate_Repository_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [NHibernate_Repository] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NHibernate_Repository].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [NHibernate_Repository] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [NHibernate_Repository] SET ANSI_NULLS OFF
GO

ALTER DATABASE [NHibernate_Repository] SET ANSI_PADDING OFF
GO

ALTER DATABASE [NHibernate_Repository] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [NHibernate_Repository] SET ARITHABORT OFF
GO

ALTER DATABASE [NHibernate_Repository] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [NHibernate_Repository] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [NHibernate_Repository] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [NHibernate_Repository] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [NHibernate_Repository] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [NHibernate_Repository] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [NHibernate_Repository] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [NHibernate_Repository] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [NHibernate_Repository] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [NHibernate_Repository] SET  DISABLE_BROKER
GO

ALTER DATABASE [NHibernate_Repository] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO

ALTER DATABASE [NHibernate_Repository] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [NHibernate_Repository] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [NHibernate_Repository] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [NHibernate_Repository] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [NHibernate_Repository] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [NHibernate_Repository] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [NHibernate_Repository] SET RECOVERY FULL
GO

ALTER DATABASE [NHibernate_Repository] SET  MULTI_USER
GO

ALTER DATABASE [NHibernate_Repository] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [NHibernate_Repository] SET DB_CHAINING OFF
GO

ALTER DATABASE [NHibernate_Repository] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO

ALTER DATABASE [NHibernate_Repository] SET TARGET_RECOVERY_TIME = 0 SECONDS
GO

ALTER DATABASE [NHibernate_Repository] SET DELAYED_DURABILITY = DISABLED
GO

EXEC sys.sp_db_vardecimal_storage_format N'NHibernate_Repository', N'ON'
GO

USE [NHibernate_Repository]
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 10/07/2017 7:57:53 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Order]    Script Date: 10/07/2017 7:57:53 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET IDENTITY_INSERT [dbo].[Customer] ON
GO

INSERT [dbo].[Customer] ([CustomerID], [CompanyName], [ContactName]) VALUES (10, N'NoComany 1', N'NoContack 1')
GO

SET IDENTITY_INSERT [dbo].[Customer] OFF
GO

SET IDENTITY_INSERT [dbo].[Order] ON
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 19, N'10/07/2017', N'No Address 12')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 22, N'10/07/2017', N'No Address 1')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 23, N'10/07/2017', N'No Address 122')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 24, N'10/07/2017', N'No Address 12')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 25, N'10/07/2017', N'No Address 1')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 26, N'10/07/2017', N'No Address 1')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 27, N'10/07/2017', N'No Address 12')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 31, N'10/07/2017', N'No Address 12')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 32, N'10/07/2017', N'No Address 1')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 33, N'10/07/2017', N'No Address 12')
GO

SET IDENTITY_INSERT [dbo].[Order] OFF
GO

USE [master]
GO

ALTER DATABASE [NHibernate_Repository] SET  READ_WRITE
GO

USE [master]
GO

/****** Object:  Database [NHibernate_Repository]    Script Date: 10/07/2017 7:57:53 SA ******/
CREATE DATABASE [NHibernate_Repository]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NHibernate_Repository', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\NHibernate_Repository.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NHibernate_Repository_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\NHibernate_Repository_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [NHibernate_Repository] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NHibernate_Repository].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [NHibernate_Repository] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [NHibernate_Repository] SET ANSI_NULLS OFF
GO

ALTER DATABASE [NHibernate_Repository] SET ANSI_PADDING OFF
GO

ALTER DATABASE [NHibernate_Repository] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [NHibernate_Repository] SET ARITHABORT OFF
GO

ALTER DATABASE [NHibernate_Repository] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [NHibernate_Repository] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [NHibernate_Repository] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [NHibernate_Repository] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [NHibernate_Repository] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [NHibernate_Repository] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [NHibernate_Repository] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [NHibernate_Repository] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [NHibernate_Repository] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [NHibernate_Repository] SET  DISABLE_BROKER
GO

ALTER DATABASE [NHibernate_Repository] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO

ALTER DATABASE [NHibernate_Repository] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [NHibernate_Repository] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [NHibernate_Repository] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [NHibernate_Repository] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [NHibernate_Repository] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [NHibernate_Repository] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [NHibernate_Repository] SET RECOVERY FULL
GO

ALTER DATABASE [NHibernate_Repository] SET  MULTI_USER
GO

ALTER DATABASE [NHibernate_Repository] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [NHibernate_Repository] SET DB_CHAINING OFF
GO

ALTER DATABASE [NHibernate_Repository] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO

ALTER DATABASE [NHibernate_Repository] SET TARGET_RECOVERY_TIME = 0 SECONDS
GO

ALTER DATABASE [NHibernate_Repository] SET DELAYED_DURABILITY = DISABLED
GO

EXEC sys.sp_db_vardecimal_storage_format N'NHibernate_Repository', N'ON'
GO

USE [NHibernate_Repository]
GO

/****** Object:  Table [dbo].[Customer]    Script Date: 10/07/2017 7:57:53 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Order]    Script Date: 10/07/2017 7:57:53 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET IDENTITY_INSERT [dbo].[Customer] ON
GO

INSERT [dbo].[Customer] ([CustomerID], [CompanyName], [ContactName]) VALUES (10, N'NoComany 1', N'NoContack 1')
GO

SET IDENTITY_INSERT [dbo].[Customer] OFF
GO

SET IDENTITY_INSERT [dbo].[Order] ON
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 19, N'10/07/2017', N'No Address 12')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 22, N'10/07/2017', N'No Address 1')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 23, N'10/07/2017', N'No Address 122')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 24, N'10/07/2017', N'No Address 12')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 25, N'10/07/2017', N'No Address 1')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 26, N'10/07/2017', N'No Address 1')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 27, N'10/07/2017', N'No Address 12')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 31, N'10/07/2017', N'No Address 12')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 32, N'10/07/2017', N'No Address 1')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (10, 33, N'10/07/2017', N'No Address 12')
GO

SET IDENTITY_INSERT [dbo].[Order] OFF
GO

USE [master]
GO

ALTER DATABASE [NHibernate_Repository] SET  READ_WRITE
GO
