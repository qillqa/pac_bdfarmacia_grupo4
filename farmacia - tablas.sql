/****** Object:  Table [G4].[Categorias]    Script Date: 04/02/2025 11:29:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [G4].[Categorias](
	[id_categoria] [int] NOT NULL,
	[nombre] [varchar](255) NULL,
 CONSTRAINT [PK_CATEGORIAS] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [G4].[DetalleVentas]    Script Date: 04/02/2025 11:29:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [G4].[DetalleVentas](
	[id_detalle_venta] [int] IDENTITY(1,1) NOT NULL,
	[id_venta] [int] NULL,
	[id_producto] [int] NULL,
	[descuento_aplicado] [decimal](5, 1) NULL,
	[precio_unitario] [decimal](5, 1) NULL,
	[cantidad] [int] NULL,
	[subtotal] [decimal](5, 1) NULL,
	[monto_descuento] [decimal](5, 1) NULL,
	[precio_final] [decimal](5, 2) NULL,
 CONSTRAINT [PK_DETALLE_VENTAS] PRIMARY KEY CLUSTERED 
(
	[id_detalle_venta] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [G4].[Empleados]    Script Date: 04/02/2025 11:29:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [G4].[Empleados](
	[id_empleado] [int] NOT NULL,
	[nombres] [varchar](255) NULL,
	[apellidos] [varchar](255) NULL,
	[dni] [varchar](20) NULL,
	[telefono] [varchar](15) NULL,
 CONSTRAINT [PK_EMPLEADOS] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [G4].[Laboratorios]    Script Date: 04/02/2025 11:29:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [G4].[Laboratorios](
	[id_laboratorio] [int] NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[direccion] [varchar](255) NOT NULL,
	[telefono] [varchar](9) NOT NULL,
	[email] [varchar](100) NULL,
 CONSTRAINT [PK_LABORATORIOS] PRIMARY KEY CLUSTERED 
(
	[id_laboratorio] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [G4].[MedioPago]    Script Date: 04/02/2025 11:29:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [G4].[MedioPago](
	[id_medio_pago] [int] NOT NULL,
	[nombre] [varchar](255) NULL,
 CONSTRAINT [PK_MEDIO_PAGO] PRIMARY KEY CLUSTERED 
(
	[id_medio_pago] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [G4].[Presentaciones]    Script Date: 04/02/2025 11:29:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [G4].[Presentaciones](
	[id_presentacion] [int] NOT NULL,
	[nombre] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PRESENTACIONES] PRIMARY KEY CLUSTERED 
(
	[id_presentacion] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [G4].[Productos]    Script Date: 04/02/2025 11:29:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [G4].[Productos](
	[id_producto] [int] NOT NULL,
	[nombre] [varchar](255) NULL,
	[precio] [decimal](10, 1) NULL,
	[id_proveedor] [int] NULL,
	[id_laboratorio] [int] NULL,
	[id_categoria] [int] NULL,
	[id_presentacion] [int] NULL,
	[con_receta] [int] NULL,
 CONSTRAINT [PK_PRODUCTOS] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [G4].[Promociones]    Script Date: 04/02/2025 11:29:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [G4].[Promociones](
	[id_promocion] [int] NOT NULL,
	[id_producto] [int] NULL,
	[nombre] [varchar](255) NULL,
	[descuento_porcentaje] [decimal](5, 1) NULL,
	[fecha_inicio] [date] NULL,
	[fecha_fin] [date] NULL,
	[activo] [int] NULL,
 CONSTRAINT [PK_PROMOCIONES] PRIMARY KEY CLUSTERED 
(
	[id_promocion] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [G4].[Proveedores]    Script Date: 04/02/2025 11:29:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [G4].[Proveedores](
	[id_proveedor] [int] NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[ruc] [char](11) NOT NULL,
	[direccion] [varchar](255) NOT NULL,
	[telefono] [varchar](9) NOT NULL,
	[email] [varchar](100) NULL,
 CONSTRAINT [PK_PROVEEDORES] PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [G4].[Ventas]    Script Date: 04/02/2025 11:29:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [G4].[Ventas](
	[id_venta] [int] NOT NULL,
	[id_medio_pago] [int] NOT NULL,
	[id_empleado] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
 CONSTRAINT [PK_VENTAS] PRIMARY KEY CLUSTERED 
(
	[id_venta] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [G4].[DetalleVentas]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS_DETALLEVENTAS] FOREIGN KEY([id_producto])
REFERENCES [G4].[Productos] ([id_producto])
GO
ALTER TABLE [G4].[DetalleVentas] CHECK CONSTRAINT [FK_PRODUCTOS_DETALLEVENTAS]
GO
ALTER TABLE [G4].[DetalleVentas]  WITH CHECK ADD  CONSTRAINT [FK_VENTAS_DETALLEVENTAS] FOREIGN KEY([id_venta])
REFERENCES [G4].[Ventas] ([id_venta])
GO
ALTER TABLE [G4].[DetalleVentas] CHECK CONSTRAINT [FK_VENTAS_DETALLEVENTAS]
GO
ALTER TABLE [G4].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_CATEGORIAS_PRODUCTOS] FOREIGN KEY([id_categoria])
REFERENCES [G4].[Categorias] ([id_categoria])
GO
ALTER TABLE [G4].[Productos] CHECK CONSTRAINT [FK_CATEGORIAS_PRODUCTOS]
GO
ALTER TABLE [G4].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_LABORATORIOS_PRODUCTOS] FOREIGN KEY([id_laboratorio])
REFERENCES [G4].[Laboratorios] ([id_laboratorio])
GO
ALTER TABLE [G4].[Productos] CHECK CONSTRAINT [FK_LABORATORIOS_PRODUCTOS]
GO
ALTER TABLE [G4].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_PRESENTACIONES_PRODUCTOS] FOREIGN KEY([id_presentacion])
REFERENCES [G4].[Presentaciones] ([id_presentacion])
GO
ALTER TABLE [G4].[Productos] CHECK CONSTRAINT [FK_PRESENTACIONES_PRODUCTOS]
GO
ALTER TABLE [G4].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_PROVEEDORES_PRODUCTOS] FOREIGN KEY([id_proveedor])
REFERENCES [G4].[Proveedores] ([id_proveedor])
GO
ALTER TABLE [G4].[Productos] CHECK CONSTRAINT [FK_PROVEEDORES_PRODUCTOS]
GO
ALTER TABLE [G4].[Promociones]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTOS_PROMOCIONES] FOREIGN KEY([id_producto])
REFERENCES [G4].[Productos] ([id_producto])
GO
ALTER TABLE [G4].[Promociones] CHECK CONSTRAINT [FK_PRODUCTOS_PROMOCIONES]
GO
ALTER TABLE [G4].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADOS_VENTAS] FOREIGN KEY([id_empleado])
REFERENCES [G4].[Empleados] ([id_empleado])
GO
ALTER TABLE [G4].[Ventas] CHECK CONSTRAINT [FK_EMPLEADOS_VENTAS]
GO
ALTER TABLE [G4].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_MEDIOPAGO_VENTAS] FOREIGN KEY([id_medio_pago])
REFERENCES [G4].[MedioPago] ([id_medio_pago])
GO
ALTER TABLE [G4].[Ventas] CHECK CONSTRAINT [FK_MEDIOPAGO_VENTAS]
GO
