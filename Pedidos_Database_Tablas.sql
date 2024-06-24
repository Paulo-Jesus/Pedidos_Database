CREATE DATABASE IF NOT EXISTS Pedidos_Database;

USE Pedidos_Database;

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

CREATE TABLE Usuario(
    IdUsuario INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    Cedula VARCHAR(10) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    Telefono VARCHAR(10) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    Username VARCHAR(10) NOT NULL,
    Contrasena VARCHAR(10) NOT NULL,
    IdRol INT NOT NULL,
    FOREIGN KEY (IdRol) REFERENCES Rol(IdRol),
    IdEmpresa INT NOT NULL,
    FOREIGN KEY (IdEmpresa) REFERENCES Empresa(IdEmpresa),
    IdEstado INT NOT NULL,
    FOREIGN KEY (IdEstado) REFERENCES Estado(IdEstado),
);

CREATE TABLE Restaurante(
    IdRestaurante INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    RUC VARCHAR(13) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    Telefono VARCHAR(10) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    Username VARCHAR(10) NOT NULL,
    Contrasena VARCHAR(10) NOT NULL,
    IdRol INT NOT NULL,
    FOREIGN KEY (IdRol) REFERENCES Rol(IdRol),
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
    IdCategoria INT NOT NULL,
    FOREIGN KEY (IdCategoria) REFERENCES Categoria(IdCategoria),
    IdRestaurante INT NOT NULL,
    FOREIGN KEY (IdRestaurante) REFERENCES Restaurante(IdRestaurante),
    IdEstado INT NOT NULL,
    FOREIGN KEY (IdEstado) REFERENCES Estado(IdEstado),
);

CREATE TABLE Pedido(
    IdPedido INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    FechaPedido DATETIME DEFAULT GETDATE(),
    IdUsuario INT NOT NULL,
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario),
    IdRestaurante INT NOT NULL,
    FOREIGN KEY (IdRestaurante) REFERENCES Restaurante(IdRestaurante),
    IdProducto INT NOT NULL,
    FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto),
    
);
