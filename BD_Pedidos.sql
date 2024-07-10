USE [Pedidos_Database]
GO
/****** Object:  UserDefinedTableType [dbo].[INTARRAYTYPE]    Script Date: 10/7/2024 14:01:18 ******/
CREATE TYPE [dbo].[INTARRAYTYPE] AS TABLE(
	[IntValue] [int] NULL
)
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[IdCuenta] [int] IDENTITY(1,1) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[Contrasena] [varchar](100) NOT NULL,
	[IdRol] [int] NOT NULL,
	[IdEstado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empresa](
	[IdEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[RUC] [varchar](13) NOT NULL,
	[RazonSocial] [varchar](100) NOT NULL,
	[IdEstado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[IdMenu] [int] IDENTITY(1,1) NOT NULL,
	[FechaInicio] [datetime] NULL,
	[FechaFin] [datetime] NULL,
	[IdProveedor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuDetalle]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuDetalle](
	[IdMenuDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdMenu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMenuDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[IdPedido] [int] IDENTITY(1,1) NOT NULL,
	[FechaPedido] [datetime] NULL,
	[IdUsuario] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Precio] [decimal](3, 2) NOT NULL,
	[Imagen] [varbinary](max) NULL,
	[IdProveedor] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdEstado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[RUC] [varchar](13) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Telefono] [varchar](10) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Logotipo] [varbinary](max) NULL,
	[IdCuenta] [int] NOT NULL,
	[IdEstado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[IdEstado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Token]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token](
	[IdToken] [int] IDENTITY(1,1) NOT NULL,
	[TokenCuerpo] [varchar](max) NOT NULL,
	[IdCuenta] [int] NOT NULL,
	[FechaExpiracion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdToken] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Cedula] [varchar](10) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Telefono] [varchar](10) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[IdCuenta] [int] NOT NULL,
	[IdEmpresa] [int] NOT NULL,
	[IdEstado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Pedido] ADD  DEFAULT (getdate()) FOR [FechaPedido]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estado] ([IdEstado])
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Empresa]  WITH CHECK ADD FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estado] ([IdEstado])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[MenuDetalle]  WITH CHECK ADD FOREIGN KEY([IdMenu])
REFERENCES [dbo].[Menu] ([IdMenu])
GO
ALTER TABLE [dbo].[MenuDetalle]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estado] ([IdEstado])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD FOREIGN KEY([IdCuenta])
REFERENCES [dbo].[Cuenta] ([IdCuenta])
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estado] ([IdEstado])
GO
ALTER TABLE [dbo].[Rol]  WITH CHECK ADD FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estado] ([IdEstado])
GO
ALTER TABLE [dbo].[Token]  WITH CHECK ADD FOREIGN KEY([IdCuenta])
REFERENCES [dbo].[Cuenta] ([IdCuenta])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([IdCuenta])
REFERENCES [dbo].[Cuenta] ([IdCuenta])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([IdEmpresa])
REFERENCES [dbo].[Empresa] ([IdEmpresa])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estado] ([IdEstado])
GO
/****** Object:  StoredProcedure [dbo].[ACTUALIZAR_MENU]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ACTUALIZAR_MENU]
	@IdMenu INT,
	@HoraInicio VARCHAR(10),
    @HoraFin VARCHAR(10),
    @NewValues INTARRAYTYPE READONLY
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @FechaInicioGen AS DATETIME;
    DECLARE @FechaFinGen AS DATETIME;

	-- Ejecutar procedimientos almacenados y asignar resultados a variables de salida
    EXEC dbo.GENERATE_CURRENTDATE @ProvidedTime = @HoraInicio, @FechaHora = @FechaInicioGen OUTPUT;
    EXEC dbo.GENERATE_CURRENTDATE @ProvidedTime = @HoraFin, @FechaHora = @FechaFinGen OUTPUT;

	UPDATE Menu SET FechaInicio = @FechaInicioGen, FechaFin = @FechaFinGen WHERE IdMenu = @IdMenu;

    -- Eliminar valores que no están en el nuevo array
    DELETE FROM MenuDetalle
    WHERE IdProducto NOT IN (SELECT IntValue FROM @NewValues)
	AND IdMenu = @IdMenu;

    -- Agregar nuevos valores que no están en la tabla
    INSERT INTO MenuDetalle (IdProducto, IdMenu)
    SELECT IntValue, @IdMenu
    FROM @NewValues
    WHERE IntValue NOT IN (SELECT IdProducto FROM MenuDetalle WHERE IdMenu = @IdMenu);

	
END
GO
/****** Object:  StoredProcedure [dbo].[GENERAL_VALIDATION]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GENERAL_VALIDATION]
	@Type VARCHAR(40),
	@IdProveedor INT
AS
BEGIN
	IF(@Type = 'ExisteMenuDia')
	BEGIN
		SELECT Count(*) AS Total FROM Menu WHERE CONVERT(date, FechaInicio) = CONVERT(date, GETDATE()) 
		AND CONVERT(date, FechaFin) = CONVERT(date, GETDATE())
		AND IdProveedor = @IdProveedor;
	END;

	IF(@Type = 'InfoMenuDia')
	BEGIN
		SELECT * FROM Menu WHERE CONVERT(date, FechaInicio) = CONVERT(date, GETDATE()) 
		AND CONVERT(date, FechaFin) = CONVERT(date, GETDATE())
		AND IdProveedor = @IdProveedor;
	END;

	IF(@Type = 'InfoProductos')
	BEGIN
		SELECT P.IdProducto, P.Nombre, P.Precio, C.Nombre as Categoria, P.IdCategoria, P.Imagen, P.IdEstado, P.Descripcion FROM Producto P, Categoria C 
		WHERE P.IdCategoria = c.IdCategoria
		AND P.IdProveedor = @IdProveedor
	END;
	
END
GO
/****** Object:  StoredProcedure [dbo].[GENERATE_CURRENTDATE]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GENERATE_CURRENTDATE]
	@ProvidedTime TIME, -- 'HH:mm:ss'
	@FechaHora DATETIME OUTPUT
AS
BEGIN
	DECLARE @CurrentDate DATE = CAST(GETDATE() AS DATE);

	-- Combinar la fecha actual con la hora proporcionada
	--DECLARE @CombinedDateTime DATETIME = CAST(@CurrentDate AS DATETIME) + CAST(@ProvidedTime AS DATETIME);

	SET @FechaHora = CAST(@CurrentDate AS DATETIME) + CAST(@ProvidedTime AS DATETIME);
	
	-- Ver el resultado
	--SELECT @CombinedDateTime AS CombinedDateTime;
END
GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_MENU]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTAR_MENU]
    @IdProveedor INT,
    @HoraInicio VARCHAR(10),
    @HoraFin VARCHAR(10),
    @IntArray INTARRAYTYPE READONLY
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @FechaInicioGen AS DATETIME;
    DECLARE @FechaFinGen AS DATETIME;

    -- Ejecutar procedimientos almacenados y asignar resultados a variables de salida
    EXEC dbo.GENERATE_CURRENTDATE @ProvidedTime = @HoraInicio, @FechaHora = @FechaInicioGen OUTPUT;
    EXEC dbo.GENERATE_CURRENTDATE @ProvidedTime = @HoraFin, @FechaHora = @FechaFinGen OUTPUT;

    -- Insertar en la tabla Menu
    INSERT INTO Menu (FechaInicio, FechaFin, IdProveedor)
    VALUES (@FechaInicioGen, @FechaFinGen, @IdProveedor);

    -- Obtener el ID del último menú insertado
    DECLARE @NewID INT;
    SET @NewID = SCOPE_IDENTITY();

	-- Verificar si el array está vacío
    IF NOT EXISTS (SELECT 1 FROM @IntArray)
    BEGIN
        PRINT 'El array está vacío.';
    END
    ELSE
    BEGIN
        -- Insertar en la tabla MenuDetalle
		INSERT INTO MenuDetalle (IdProducto, IdMenu)
		SELECT IntValue, @NewID
		FROM @IntArray;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarUsuarioConCuenta]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarUsuarioConCuenta]
    @Correo VARCHAR(100),
    @Contrasena VARCHAR(100),
    @IdRol INT,
    @IdEstado INT,
    @Cedula VARCHAR(10),
    @Nombre VARCHAR(100),
    @Telefono VARCHAR(10),
    @Direccion VARCHAR(100),
    @IdEmpresa INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Declarar variables para almacenar los IDs generados
    DECLARE @IdCuenta INT;
    DECLARE @IdUsuario INT;

    -- Insertar en la tabla Cuenta
    INSERT INTO Cuenta (Correo, Contrasena, IdRol, IdEstado)
    VALUES (@Correo, @Contrasena, @IdRol, @IdEstado);

    -- Obtener el IdCuenta generado
    SET @IdCuenta = SCOPE_IDENTITY();

    -- Insertar en la tabla Usuario
    INSERT INTO Usuario (Cedula, Nombre, Telefono, Direccion, IdEmpresa, IdCuenta, IdEstado)
    VALUES (@Cedula, @Nombre, @Telefono, @Direccion, @IdEmpresa, @IdCuenta, @IdEstado);

    -- Obtener el IdUsuario generado
    SET @IdUsuario = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[OBTENER_PRODUCTOS_MENU]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OBTENER_PRODUCTOS_MENU]
	@IdProveedor INT
AS
BEGIN
	-- Obtiene los platos del menu del dia que el restaurante ha seleccionado
	SELECT M.*, MD.IdMenuDetalle, MD.IdProducto FROM Menu M, MenuDetalle MD 
	WHERE M.IdProveedor = @IdProveedor
	AND MD.IdMenu = M.IdMenu
	AND CONVERT(date, FechaInicio) = CONVERT(date, GETDATE())
	AND CONVERT(date, FechaFin) = CONVERT(date, GETDATE());
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_Por_Correo]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Buscar_Por_Correo]
	@Correo AS VARCHAR(100)
AS
BEGIN
	SELECT u.Nombre AS NombreUsuario, c.Correo, r.Nombre AS Rol, e.Nombre AS Estado
	FROM Usuario u
	INNER JOIN Cuenta c ON u.IdCuenta = c.IdCuenta
	INNER JOIN Rol r ON c.IdRol = r.IdRol
	INNER JOIN Estado e ON u.IdEstado = e.IdEstado
	WHERE c.Correo = @Correo;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_consultarPedidos]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_consultarPedidos]
AS
BEGIN
       SELECT
        p.IdPedido,
        p.FechaPedido,
        u.Nombre AS NombreUsuario,
        pr.Nombre AS NombreProducto,
        pr.Precio AS PrecioProducto,
        1 AS Cantidad
    FROM
        dbo.Pedido p
        INNER JOIN dbo.Usuario u ON p.IdUsuario = u.IdUsuario
        INNER JOIN dbo.Producto pr ON p.IdProducto = pr.IdProducto
END
GO
/****** Object:  StoredProcedure [dbo].[sp_consultarPedidosRestaurante]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_consultarPedidosRestaurante]
@IdConsulta int
AS
BEGIN
       SELECT
        p.IdPedido,
        p.FechaPedido,
        u.Nombre AS NombreUsuario,
        pr.Nombre AS NombreProducto,
        pr.Precio AS PrecioProducto,
        1 AS Cantidad 
    FROM
        dbo.Pedido p
        INNER JOIN dbo.Usuario u ON p.IdUsuario = u.IdUsuario
        INNER JOIN dbo.Producto pr ON p.IdProducto = pr.IdProducto
		Where p.IdProveedor = @IdConsulta
END
GO
/****** Object:  StoredProcedure [dbo].[sp_consultarPedidosUsuario]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_consultarPedidosUsuario]
@IdConsulta int
AS
BEGIN
       SELECT
        p.IdPedido,
        p.FechaPedido,
        u.Nombre AS NombreUsuario,
        pr.Nombre AS NombreProducto,
        pr.Precio AS PrecioProducto,
        1 AS Cantidad 
    FROM
        dbo.Pedido p
        INNER JOIN dbo.Usuario u ON p.IdUsuario = u.IdUsuario
        INNER JOIN dbo.Producto pr ON p.IdProducto = pr.IdProducto
		Where p.IdUsuario = @IdConsulta
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Desbloquear_Usuario]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Desbloquear_Usuario]
(
	@Correo VARCHAR(100)
)
AS 
BEGIN
	DECLARE @IdCuenta INT;
	SELECT @IdCuenta = IdCuenta FROM Cuenta WHERE Correo = @Correo;

	UPDATE Cuenta
	SET IdEstado = 1 
	WHERE Correo = @Correo;

	UPDATE Usuario
	SET IdEstado = 1
	WHERE Usuario.IdCuenta = @IdCuenta	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_Todos_Usuario_Bloqueados]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Obtener_Todos_Usuario_Bloqueados]
AS
BEGIN
	SELECT u.Nombre AS NombreUsuario, c.Correo, r.Nombre AS Rol, e.Nombre AS Estado
	FROM Usuario u
	INNER JOIN Cuenta c ON u.IdCuenta = c.IdCuenta
	INNER JOIN Rol r ON c.IdRol = r.IdRol
	INNER JOIN Estado e ON u.IdEstado = e.IdEstado
	WHERE e.IdEstado = 3
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RegistrarProveedor]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_RegistrarProveedor]
(
	@RUC AS VARCHAR(13),
	@Nombre AS VARCHAR(100),
	@Correo AS VARCHAR(100),
	@Telefono AS VARCHAR(10),
	@Direccion AS VARCHAR(100),
	@Logotipo AS VARBINARY(MAX),
	@Contrasena AS VARCHAR(10),
	@IdRol AS INT,
	@IdEstado AS INT
)
AS
BEGIN
	DECLARE @IdCuenta INT;

	INSERT INTO Cuenta(Correo,Contrasena,IdRol,IdEstado)
	VALUES (@Correo,@Contrasena, @IdRol,@IdEstado);

	SET @IdCuenta = SCOPE_IDENTITY();

	INSERT INTO Proveedor (RUC,Nombre, Telefono, Direccion, Logotipo, IdCuenta, IdEstado)
	VALUES(@RUC,@Nombre,@Telefono,@Direccion, @Logotipo, @IdCuenta, @IdEstado);

END
GO
/****** Object:  StoredProcedure [dbo].[sp_updateRol]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_updateRol]
    @Nombre VARCHAR(30),
    @IdEstado INT
AS
BEGIN
    -- Actualizar la tabla ROL con el nombre del rol y el ID del estado
    UPDATE ROL
    SET
        IdEstado = @IdEstado
    WHERE Nombre = @Nombre
END
GO
/****** Object:  StoredProcedure [dbo].[usp_crearRol]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_crearRol]
@Nombre varchar(50), @IdEstado int
as 
begin 
insert into ROL(Nombre,IdEstado)values( @Nombre, @IdEstado);
Select SCOPE_IDENTITY() as IdRol ,@Nombre as Nombre,@IdEstado as IdEstado;
end
GO
/****** Object:  StoredProcedure [dbo].[usp_EstadosAI]    Script Date: 10/7/2024 14:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EstadosAI]
AS
BEGIN
    SELECT *
    FROM (
        SELECT *, ROW_NUMBER() OVER (ORDER BY IdEstado) AS RowNum
        FROM ESTADO
    ) AS T
    WHERE RowNum <= 2;
END
GO
