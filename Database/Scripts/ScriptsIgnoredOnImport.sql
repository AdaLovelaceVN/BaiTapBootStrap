
USE [master]
GO

/****** Object:  Database [BaiTapBootStrap]    Script Date: 05/07/2017 4:12:12 CH ******/
CREATE DATABASE [BaiTapBootStrap]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BaiTapBootStrap', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BaiTapBootStrap_Primary.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BaiTapBootStrap_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BaiTapBootStrap_Primary.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [BaiTapBootStrap] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BaiTapBootStrap].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [BaiTapBootStrap] SET ANSI_NULL_DEFAULT ON
GO

ALTER DATABASE [BaiTapBootStrap] SET ANSI_NULLS ON
GO

ALTER DATABASE [BaiTapBootStrap] SET ANSI_PADDING ON
GO

ALTER DATABASE [BaiTapBootStrap] SET ANSI_WARNINGS ON
GO

ALTER DATABASE [BaiTapBootStrap] SET ARITHABORT ON
GO

ALTER DATABASE [BaiTapBootStrap] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [BaiTapBootStrap] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET CURSOR_DEFAULT  LOCAL
GO

ALTER DATABASE [BaiTapBootStrap] SET CONCAT_NULL_YIELDS_NULL ON
GO

ALTER DATABASE [BaiTapBootStrap] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET QUOTED_IDENTIFIER ON
GO

ALTER DATABASE [BaiTapBootStrap] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET  DISABLE_BROKER
GO

ALTER DATABASE [BaiTapBootStrap] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [BaiTapBootStrap] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET RECOVERY FULL
GO

ALTER DATABASE [BaiTapBootStrap] SET  MULTI_USER
GO

ALTER DATABASE [BaiTapBootStrap] SET PAGE_VERIFY NONE
GO

ALTER DATABASE [BaiTapBootStrap] SET DB_CHAINING OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO

ALTER DATABASE [BaiTapBootStrap] SET TARGET_RECOVERY_TIME = 0 SECONDS
GO

ALTER DATABASE [BaiTapBootStrap] SET DELAYED_DURABILITY = DISABLED
GO

EXEC sys.sp_db_vardecimal_storage_format N'BaiTapBootStrap', N'ON'
GO

USE [BaiTapBootStrap]
GO

/****** Object:  Table [dbo].[Book]    Script Date: 05/07/2017 4:12:12 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 05/07/2017 4:12:12 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Order]    Script Date: 05/07/2017 4:12:12 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET IDENTITY_INSERT [dbo].[Book] ON
GO

INSERT [dbo].[Book] ([Id], [Title], [Author], [Genre]) VALUES (3, N'Phieu luu', N'Connan', N'aaaujyhkyugfytyktuyh')
GO

INSERT [dbo].[Book] ([Id], [Title], [Author], [Genre]) VALUES (4, N'Phieu luu', N'Connan', N'bbb')
GO

INSERT [dbo].[Book] ([Id], [Title], [Author], [Genre]) VALUES (5, N'Phieu luu', N'Connan', N'aaa')
GO

INSERT [dbo].[Book] ([Id], [Title], [Author], [Genre]) VALUES (6, N'Phieu luu', N'Connan', N'aaa')
GO

INSERT [dbo].[Book] ([Id], [Title], [Author], [Genre]) VALUES (7, N'Phieu luu', N'Connan', N'aaahvhvuvhj')
GO

SET IDENTITY_INSERT [dbo].[Book] OFF
GO

SET IDENTITY_INSERT [dbo].[Customers] ON
GO

INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName]) VALUES (2, N'NoCompany', N'NoName')
GO

SET IDENTITY_INSERT [dbo].[Customers] OFF
GO

SET IDENTITY_INSERT [dbo].[Order] ON
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (2, 4, CAST(N'2017-07-05 15:38:10.920' AS DateTime), N'test 1')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (2, 5, CAST(N'2017-07-05 15:38:10.920' AS DateTime), N'test 2')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (2, 6, CAST(N'2017-07-05 15:38:10.920' AS DateTime), N'test 3')
GO

SET IDENTITY_INSERT [dbo].[Order] OFF
GO

USE [master]
GO

ALTER DATABASE [BaiTapBootStrap] SET  READ_WRITE
GO

USE [master]
GO

/****** Object:  Database [BaiTapBootStrap]    Script Date: 05/07/2017 4:12:12 CH ******/
CREATE DATABASE [BaiTapBootStrap]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BaiTapBootStrap', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BaiTapBootStrap_Primary.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BaiTapBootStrap_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BaiTapBootStrap_Primary.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [BaiTapBootStrap] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BaiTapBootStrap].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [BaiTapBootStrap] SET ANSI_NULL_DEFAULT ON
GO

ALTER DATABASE [BaiTapBootStrap] SET ANSI_NULLS ON
GO

ALTER DATABASE [BaiTapBootStrap] SET ANSI_PADDING ON
GO

ALTER DATABASE [BaiTapBootStrap] SET ANSI_WARNINGS ON
GO

ALTER DATABASE [BaiTapBootStrap] SET ARITHABORT ON
GO

ALTER DATABASE [BaiTapBootStrap] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [BaiTapBootStrap] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET CURSOR_DEFAULT  LOCAL
GO

ALTER DATABASE [BaiTapBootStrap] SET CONCAT_NULL_YIELDS_NULL ON
GO

ALTER DATABASE [BaiTapBootStrap] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET QUOTED_IDENTIFIER ON
GO

ALTER DATABASE [BaiTapBootStrap] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET  DISABLE_BROKER
GO

ALTER DATABASE [BaiTapBootStrap] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [BaiTapBootStrap] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET RECOVERY FULL
GO

ALTER DATABASE [BaiTapBootStrap] SET  MULTI_USER
GO

ALTER DATABASE [BaiTapBootStrap] SET PAGE_VERIFY NONE
GO

ALTER DATABASE [BaiTapBootStrap] SET DB_CHAINING OFF
GO

ALTER DATABASE [BaiTapBootStrap] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO

ALTER DATABASE [BaiTapBootStrap] SET TARGET_RECOVERY_TIME = 0 SECONDS
GO

ALTER DATABASE [BaiTapBootStrap] SET DELAYED_DURABILITY = DISABLED
GO

EXEC sys.sp_db_vardecimal_storage_format N'BaiTapBootStrap', N'ON'
GO

USE [BaiTapBootStrap]
GO

/****** Object:  Table [dbo].[Book]    Script Date: 05/07/2017 4:12:12 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 05/07/2017 4:12:12 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Order]    Script Date: 05/07/2017 4:12:12 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET IDENTITY_INSERT [dbo].[Book] ON
GO

INSERT [dbo].[Book] ([Id], [Title], [Author], [Genre]) VALUES (3, N'Phieu luu', N'Connan', N'aaaujyhkyugfytyktuyh')
GO

INSERT [dbo].[Book] ([Id], [Title], [Author], [Genre]) VALUES (4, N'Phieu luu', N'Connan', N'bbb')
GO

INSERT [dbo].[Book] ([Id], [Title], [Author], [Genre]) VALUES (5, N'Phieu luu', N'Connan', N'aaa')
GO

INSERT [dbo].[Book] ([Id], [Title], [Author], [Genre]) VALUES (6, N'Phieu luu', N'Connan', N'aaa')
GO

INSERT [dbo].[Book] ([Id], [Title], [Author], [Genre]) VALUES (7, N'Phieu luu', N'Connan', N'aaahvhvuvhj')
GO

SET IDENTITY_INSERT [dbo].[Book] OFF
GO

SET IDENTITY_INSERT [dbo].[Customers] ON
GO

INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName]) VALUES (2, N'NoCompany', N'NoName')
GO

SET IDENTITY_INSERT [dbo].[Customers] OFF
GO

SET IDENTITY_INSERT [dbo].[Order] ON
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (2, 4, CAST(N'2017-07-05 15:38:10.920' AS DateTime), N'test 1')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (2, 5, CAST(N'2017-07-05 15:38:10.920' AS DateTime), N'test 2')
GO

INSERT [dbo].[Order] ([CustomerID], [OrderID], [OrderDate], [ShipToName]) VALUES (2, 6, CAST(N'2017-07-05 15:38:10.920' AS DateTime), N'test 3')
GO

SET IDENTITY_INSERT [dbo].[Order] OFF
GO

USE [master]
GO

ALTER DATABASE [BaiTapBootStrap] SET  READ_WRITE
GO
