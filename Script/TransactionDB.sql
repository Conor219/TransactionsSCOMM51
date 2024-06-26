USE [TransactionDB]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 26/06/2024 07:47:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 26/06/2024 07:47:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Puesto] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Existencias]    Script Date: 26/06/2024 07:47:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Existencias](
	[ProductoId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Folios]    Script Date: 26/06/2024 07:47:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Folios](
	[FolioActual] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 26/06/2024 07:47:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 26/06/2024 07:47:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Folio] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Cliente] [varchar](250) NOT NULL,
	[Total] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentasDetalle]    Script Date: 26/06/2024 07:47:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentasDetalle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Renglon] [tinyint] NOT NULL,
	[VentaId] [int] NOT NULL,
	[Cantidad] [decimal](10, 2) NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
	[PrecioUnitario] [decimal](10, 2) NOT NULL,
	[Importe] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_VentasDetalle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Folios] ([FolioActual]) VALUES (0)
GO
/****** Object:  Index [IX_Ventas_Folio]    Script Date: 26/06/2024 07:47:12 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Ventas_Folio] ON [dbo].[Ventas]
(
	[Folio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VentasDetalle_VentaId_Renglon]    Script Date: 26/06/2024 07:47:12 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_VentasDetalle_VentaId_Renglon] ON [dbo].[VentasDetalle]
(
	[VentaId] ASC,
	[Renglon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Folios] ADD  CONSTRAINT [DF_Folios_FolioActual]  DEFAULT ((0)) FOR [FolioActual]
GO
ALTER TABLE [dbo].[Existencias]  WITH CHECK ADD  CONSTRAINT [FK_Existencias_Productos] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Productos] ([Id])
GO
ALTER TABLE [dbo].[Existencias] CHECK CONSTRAINT [FK_Existencias_Productos]
GO
