-- /------------------------------------------------------/
--                ELIMINACIÓN DE LAS TABLAS              
-- /------------------------------------------------------/
DROP TABLE IF EXISTS LineaOrdenVenta;
DROP TABLE IF EXISTS OrdenVenta;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Persona;
DROP TABLE IF EXISTS Area;



-- /------------------------------------------------------/
-- 				  CREACION DE LAS TABLAS				  
-- /------------------------------------------------------/
-- Tabla Area
CREATE TABLE Area (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    activo BOOL
);

-- Tabla Persona
CREATE TABLE Persona (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(8),
    nombre VARCHAR(100),
    apellidoPaterno VARCHAR(100),
    genero CHAR,
    fechaNacimiento DATE
);

-- Tabla Empleado
CREATE TABLE Empleado (
    id INT PRIMARY KEY,
    fidArea INT,
	cargo VARCHAR(100),
    sueldo DECIMAL(10,2),
    activo BOOL,
    FOREIGN KEY (id) REFERENCES Persona (id),
    FOREIGN KEY (fidArea) REFERENCES Area (id)
);

-- Tabla Cliente
CREATE TABLE Cliente (
    id INT PRIMARY KEY,
    lineaCredito DECIMAL(10,2),
    categoria ENUM('CLASICO','VIP','PLATINUM'),
    activo BOOL,
    FOREIGN KEY (id) REFERENCES Persona (id)
);

-- Tabla Producto
CREATE TABLE Producto (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(300),
    unidadMedida VARCHAR(300),
    precio DECIMAL(10, 2),
    activo BOOL
);

-- Tabla Orden de Venta
CREATE TABLE OrdenVenta (
	id INT AUTO_INCREMENT PRIMARY KEY,
    fidCliente INT,
    fidEmpleado INT,
    total DECIMAL(10, 2),
    fecha_hora DATETIME,
    activo BOOL,
    FOREIGN KEY (fidCliente) REFERENCES Cliente (id),
    FOREIGN KEY (fidEmpleado) REFERENCES Empleado (id)
);

-- Tabla Línea de Orden de Venta
CREATE TABLE LineaOrdenVenta (
	id INT AUTO_INCREMENT PRIMARY KEY,
    fidOrdenVenta INT,
    fidProducto INT,
    cantidad INT,
    subtotal DECIMAL(10,2),
    activo BOOL,
    FOREIGN KEY (fidOrdenVenta) REFERENCES OrdenVenta (id),
    FOREIGN KEY (fidProducto) REFERENCES Producto (id)
);