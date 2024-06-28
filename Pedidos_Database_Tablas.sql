CREATE DATABASE Pedidos_Database;

CREATE TABLE Estado(
    IdEstado INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
);

CREATE TABLE Rol(
    IdRol INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    IdEstado INT NOT NULL,
    FOREIGN KEY (IdEstado) REFERENCES Estado(IdEstado)
);

CREATE TABLE Empresa(
    IdEmpresa INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    RUC VARCHAR(13) NOT NULL,
    RazonSocial VARCHAR(100) NOT NULL,
    IdEstado INT NOT NULL, 
    FOREIGN KEY (IdEstado) REFERENCES Estado(IdEstado)
);

CREATE TABLE Cuenta(
    IdCuenta INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    Contrasena VARCHAR(100) NOT NULL,
    IdRol INT NOT NULL,
    FOREIGN KEY (IdRol) REFERENCES Rol(IdRol),
    IdEstado INT NOT NULL,
    FOREIGN KEY (IdEstado) REFERENCES Estado(IdEstado),
);

CREATE TABLE Usuario(
    IdUsuario INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    Cedula VARCHAR(10) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Telefono VARCHAR(10) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    IdCuenta INT NOT NULL,
    FOREIGN KEY (IdCuenta) REFERENCES Cuenta(IdCuenta),
    IdEmpresa INT NOT NULL,
    FOREIGN KEY (IdEmpresa) REFERENCES Empresa(IdEmpresa),
    IdEstado INT NOT NULL,
    FOREIGN KEY (IdEstado) REFERENCES Estado(IdEstado),
);

CREATE TABLE Proveedor(
    IdProveedor INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    RUC VARCHAR(13) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Telefono VARCHAR(10) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    Logotipo VARBINARY(MAX),
    IdCuenta INT NOT NULL,
    FOREIGN KEY (IdCuenta) REFERENCES Cuenta(IdCuenta),
    IdEstado INT NOT NULL,
    FOREIGN KEY (IdEstado) REFERENCES Estado(IdEstado),
);

CREATE TABLE Categoria(
    IdCategoria INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
);

CREATE TABLE Producto(
    IdProducto INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(100) NOT NULL,
    Precio Decimal(3,2) NOT NULL,
    Imagen VARBINARY(MAX), 
    IdProveedor INT NOT NULL,
    FOREIGN KEY (IdProveedor) REFERENCES Proveedor(IdProveedor),
    IdCategoria INT NOT NULL,
    FOREIGN KEY (IdCategoria) REFERENCES Categoria(IdCategoria),
    IdEstado INT NOT NULL,
    FOREIGN KEY (IdEstado) REFERENCES Estado(IdEstado),
);

CREATE TABLE Pedido(
    IdPedido INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    FechaPedido DATETIME DEFAULT GETDATE(),
    IdUsuario INT NOT NULL,
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario),
    IdProveedor INT NOT NULL,
    FOREIGN KEY (IdProveedor) REFERENCES Proveedor(IdProveedor),
    IdProducto INT NOT NULL,
    FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto),
);

CREATE TABLE Menu(
    IdMenu INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    FechaInicio DATETIME,
    FechaFin DATETIME,
    IdProveedor INT NOT NULL,
    FOREIGN KEY (IdProveedor) REFERENCES Proveedor(IdProveedor),
);

CREATE TABLE MenuDetalle(
    IdMenuDetalle INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    IdProducto INT NOT NULL,
    FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto),
    IdMenu INT NOT NULL,
    FOREIGN KEY (IdMenu) REFERENCES Menu(IdMenu),
);

CREATE TABLE Token(
    IdToken INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    TokenCuerpo VARCHAR(MAX) NOT NULL,
    IdCuenta INT NOT NULL,
    FOREIGN KEY (IdCuenta) REFERENCES Cuenta(IdCuenta),
    FechaExpiracion DATETIME NOT NULL;
);
