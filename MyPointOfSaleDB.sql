USE [master]
GO
/****** Object:  Database [MyPointOfSaleDB]    Script Date: 4/7/2025 9:37:07 PM ******/
CREATE DATABASE [MyPointOfSaleDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyPointOfSaleDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MyPointOfSaleDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'MyPointOfSaleDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\MyPointOfSaleDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MyPointOfSaleDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyPointOfSaleDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyPointOfSaleDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyPointOfSaleDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyPointOfSaleDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyPointOfSaleDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyPointOfSaleDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MyPointOfSaleDB] SET  MULTI_USER 
GO
ALTER DATABASE [MyPointOfSaleDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyPointOfSaleDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyPointOfSaleDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyPointOfSaleDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyPointOfSaleDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyPointOfSaleDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyPointOfSaleDB', N'ON'
GO
ALTER DATABASE [MyPointOfSaleDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [MyPointOfSaleDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MyPointOfSaleDB]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/7/2025 9:37:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 4/7/2025 9:37:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[DocumentId] [int] NULL,
	[DucmentNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 4/7/2025 9:37:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[DocumentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceLines]    Script Date: 4/7/2025 9:37:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceLines](
	[InvoiceLineId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NULL,
	[ProductId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[Cantidad] [float] NOT NULL,
	[ITBIS] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_InvoiceLine] PRIMARY KEY CLUSTERED 
(
	[InvoiceLineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 4/7/2025 9:37:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[CreateAt] [date] NOT NULL,
	[ClientId] [int] NOT NULL,
	[Total] [money] NOT NULL,
	[ITBIS] [money] NOT NULL,
	[UserId] [int] NOT NULL,
	[NCF] [int] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCFs]    Script Date: 4/7/2025 9:37:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCFs](
	[NCFId] [int] IDENTITY(1,1) NOT NULL,
	[Serial] [nchar](1) NOT NULL,
	[TypeOfReceipt] [nchar](2) NOT NULL,
	[Sequence] [nchar](8) NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_NCF_1] PRIMARY KEY CLUSTERED 
(
	[NCFId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/7/2025 9:37:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Price] [money] NOT NULL,
	[ITBIS] [decimal](18, 0) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/7/2025 9:37:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Position] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[DocumentId] [int] NOT NULL,
	[DocumentNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Users__3214EC074358E001] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (1, N'Teclado')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (2, N'Monitore')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (3, N'Ratón')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (4, N'Bocina')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (5, N'Tarjeta Grafica')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (6, N'Procesador')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (7, N'Memoria RAM')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (8, N'UPC')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (9, N'Memoria Flash')
INSERT [dbo].[Categories] ([CategoryId], [Name]) VALUES (10, N'SmartPhone')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ClientId], [FirstName], [LastName], [Email], [DocumentId], [DucmentNumber]) VALUES (1, N'Descontado', N'Descontado', NULL, NULL, NULL)
INSERT [dbo].[Clients] ([ClientId], [FirstName], [LastName], [Email], [DocumentId], [DucmentNumber]) VALUES (2, N'Juana', N'Baez', NULL, 1, N'059-9635966-9')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Documents] ON 

INSERT [dbo].[Documents] ([DocumentId], [Name]) VALUES (1, N'Cédula de Identidad')
INSERT [dbo].[Documents] ([DocumentId], [Name]) VALUES (2, N'Pasaporte')
INSERT [dbo].[Documents] ([DocumentId], [Name]) VALUES (3, N'RNC')
SET IDENTITY_INSERT [dbo].[Documents] OFF
GO
SET IDENTITY_INSERT [dbo].[NCFs] ON 

INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (4, N'B', N'01', N'00000001', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (5, N'B', N'01', N'00000002', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (6, N'B', N'01', N'00000003', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (7, N'B', N'01', N'00000004', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (8, N'B', N'01', N'00000005', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (9, N'B', N'01', N'00000006', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (10, N'B', N'01', N'00000007', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (11, N'B', N'01', N'00000008', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (12, N'B', N'01', N'00000009', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (13, N'B', N'01', N'00000010', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (14, N'B', N'01', N'00000011', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (15, N'B', N'01', N'00000012', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (16, N'B', N'01', N'00000013', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (17, N'B', N'01', N'00000014', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (18, N'B', N'01', N'00000015', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (19, N'B', N'01', N'00000016', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (20, N'B', N'01', N'00000017', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (21, N'B', N'01', N'00000018', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (22, N'B', N'01', N'00000019', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (23, N'B', N'01', N'00000020', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (24, N'B', N'01', N'00000021', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (25, N'B', N'01', N'00000022', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (26, N'B', N'01', N'00000023', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (27, N'B', N'01', N'00000024', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (28, N'B', N'01', N'00000025', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (29, N'B', N'01', N'00000026', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (30, N'B', N'01', N'00000027', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (31, N'B', N'01', N'00000028', NULL)
INSERT [dbo].[NCFs] ([NCFId], [Serial], [TypeOfReceipt], [Sequence], [IsActive]) VALUES (32, N'B', N'01', N'00000029', NULL)
SET IDENTITY_INSERT [dbo].[NCFs] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Description], [Price], [ITBIS], [CategoryId]) VALUES (1, N'Teclado Innalambrico', 1500.0000, CAST(18 AS Decimal(18, 0)), 1)
INSERT [dbo].[Products] ([ProductId], [Description], [Price], [ITBIS], [CategoryId]) VALUES (2, N'Procecsador I5 13va Generación', 25000.0000, CAST(18 AS Decimal(18, 0)), 6)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Username], [Password], [FirstName], [LastName], [Position], [Email], [DocumentId], [DocumentNumber]) VALUES (1, N'franpaulino', N'ADMIN', N'Francisco', N'Paulino', N'Administrador', N'100050154@p.uapa.edu.do', 1, N'047-0203256-9')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [FirstName], [LastName], [Position], [Email], [DocumentId], [DocumentNumber]) VALUES (2, N'edrinsonalejo', N'ADMIN', N'Edrinson', N'Alejo', N'Administrador', N'100067401@p.uapa.edu.do', 1, N'401-6526588-6')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [FirstName], [LastName], [Position], [Email], [DocumentId], [DocumentNumber]) VALUES (3, N'danielpujuls', N'ADMIN', N'Daniel', N'Pujols', N'Administrador', N'100040616@p.uapa.edu.do', 1, N'501-5620233-6')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [FirstName], [LastName], [Position], [Email], [DocumentId], [DocumentNumber]) VALUES (4, N'miguelangel', N'ADMIN', N'Miguel', N'Ureña', N'Administrador', N'100036508@p.uapa.edu.do', 1, N'047-8596559-9')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E41D1457BE]    Script Date: 4/7/2025 9:37:07 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ__Users__536C85E41D1457BE] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Client_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Documents] ([DocumentId])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Client_Document]
GO
ALTER TABLE [dbo].[InvoiceLines]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceLine_Invoice] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoices] ([InvoiceId])
GO
ALTER TABLE [dbo].[InvoiceLines] CHECK CONSTRAINT [FK_InvoiceLine_Invoice]
GO
ALTER TABLE [dbo].[InvoiceLines]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceLine_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[InvoiceLines] CHECK CONSTRAINT [FK_InvoiceLine_Product]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ClientId])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoice_Client]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoice_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Document] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[Documents] ([DocumentId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Document]
GO
USE [master]
GO
ALTER DATABASE [MyPointOfSaleDB] SET  READ_WRITE 
GO
