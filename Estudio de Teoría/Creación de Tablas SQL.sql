-- /------------------------------------------------------/
--                Reiniciar la Base de Datos              
-- /------------------------------------------------------/
-- Eliminación de las Tablas
DROP TABLE IF EXISTS LineaOrdenVenta;
DROP TABLE IF EXISTS OrdenVenta;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Persona;
DROP TABLE IF EXISTS Area;
-- Eliminación de los Procedimientos de Áreas
DROP PROCEDURE IF EXISTS INSERTAR_AREA;
DROP PROCEDURE IF EXISTS MODIFICAR_AREA;
DROP PROCEDURE IF EXISTS ELIMINAR_AREA;
DROP PROCEDURE IF EXISTS LISTAR_AREAS_TODAS;
-- Eliminación de los Procedimientos de Trabajador
DROP PROCEDURE IF EXISTS INSERTAR_EMPLEADO;
-- Eliminación de los Procedimientos de Cliente
DROP PROCEDURE IF EXISTS INSERTAR_CLIENTE;
DROP PROCEDURE IF EXISTS LISTAR_CLIENTES_TODOS;
DROP PROCEDURE IF EXISTS LISTAR_CLIENTES_POR_NOMBRE;
-- Eliminación de los Procedimientos de Producto
DROP PROCEDURE IF EXISTS LISTAR_PRODUCTOS_TODOS;
DROP PROCEDURE IF EXISTS LISTAR_PRODUCTOS_POR_NOMBRE;
-- Eliminación de los Procedimientos de Órden de Venta
DROP PROCEDURE IF EXISTS INSERTAR_ORDEN_VENTA;
-- Eliminación de los Procedimientos de Línea de Órden de Venta
DROP PROCEDURE IF EXISTS INSERTAR_LINEA_ORDEN_VENTA;



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



-- /------------------------------------------------------/
--              PROCEDIMIENTOS PARA LAS ÁREAS             
-- /------------------------------------------------------/
DELIMITER $

-- Procedimiento de Inserción
CREATE PROCEDURE INSERTAR_AREA (
	OUT _id INT,
	IN _nombre VARCHAR(100),
    IN _descripcion VARCHAR(255)
)
BEGIN
	INSERT INTO Area (nombre, descripcion, activo)
    VALUES (_nombre, _descripcion, true);
    
    SET _id = @@last_insert_id;
END$

-- Procedimiento de Modificación
CREATE PROCEDURE MODIFICAR_AREA (
	IN _id INT,
    IN _nombre VARCHAR(100),
    IN _descripcion VARCHAR(255)
)
BEGIN
	UPDATE Area
    SET nombre = _nombre, descripcion = _descripcion
    WHERE id = _id;
END$

-- Procedimiento de Eliminación
CREATE PROCEDURE ELIMINAR_AREA (
	IN _id INT
)
BEGIN
	UPDATE Area
    SET activo = false
    WHERE id = _id;
END$

-- Procedimiento de Listar Todos
CREATE PROCEDURE LISTAR_AREAS_TODAS ()
BEGIN
	SELECT id AS "ID", nombre AS "Nombre", descripcion AS "Descripción"
    FROM Area
    WHERE activo = true;
END$



-- /------------------------------------------------------/
--            PROCEDIMIENTOS PARA LOS EMPLEADOS           
-- /------------------------------------------------------/
DELIMITER $

-- Procedimiento de Inserción
CREATE PROCEDURE INSERTAR_EMPLEADO (
	OUT _id INT,
    IN _dni VARCHAR(8),
    IN _nombre VARCHAR(100),
    IN _apellidoPaterno VARCHAR(100),
    IN _genero CHAR,
    IN _fechaNacimiento DATE,
    IN _fidArea INT,
	IN _cargo VARCHAR(100),
    IN _sueldo DECIMAL(10,2)
)
BEGIN
	INSERT INTO Persona (dni, nombre, apellidoPaterno, genero, fechaNacimiento)
    VALUES (_dni, _nombre, _apellidoPaterno, _genero, _fechaNacimiento);
    
    SET _id = @@last_insert_id;
    
    INSERT INTO Empleado (id, fidArea, cargo, sueldo, activo)
    VALUES (_id, _fidArea, _cargo, _sueldo, true);
END$



-- /------------------------------------------------------/
--             PROCEDIMIENTOS PARA LOS CLIENTES           
-- /------------------------------------------------------/
DELIMITER $

-- Procedimiento de Inserción
CREATE PROCEDURE INSERTAR_CLIENTE (
	OUT _id INT,
    IN _dni VARCHAR(8),
    IN _nombre VARCHAR(100),
    IN _apellidoPaterno VARCHAR(100),
    IN _genero CHAR,
    IN _fechaNacimiento DATE,
    IN _lineaCredito DECIMAL(10,2),
    IN _categoria ENUM('CLASICO','VIP','PLATINUM')
)
BEGIN
	INSERT INTO Persona (dni, nombre, apellidoPaterno, genero, fechaNacimiento)
    VALUES (_dni, _nombre, _apellidoPaterno, _genero, _fechaNacimiento);
    
    SET _id = @@last_insert_id;
    
    INSERT INTO Cliente (id, lineaCredito, categoria, activo)
    VALUES (_id, _lineaCredito, _categoria, true);
END$

-- Procedimiento de Listar Todos
CREATE PROCEDURE LISTAR_CLIENTES_TODOS ()
BEGIN
	SELECT Persona.id AS "ID", Persona.dni AS "DNI",
		   Persona.nombre AS "Nombre",
		   Persona.apellidoPaterno AS "Apellido Paterno",
           Persona.genero AS "Género",
           Persona.fechaNacimiento AS "Fecha de Nacimiento",
           Cliente.lineaCredito AS "Línea de Crédito",
           Cliente.categoria AS "Categoría"
    FROM Persona
    INNER JOIN Cliente ON Cliente.id
    WHERE Persona.id = Cliente.id AND
		  activo = true;
END$

-- Procedimiento de Listar por Nombre
CREATE PROCEDURE LISTAR_CLIENTES_POR_NOMBRE (
	IN _nombre VARCHAR(100)
)
BEGIN
	SELECT Persona.id AS "ID", Persona.dni AS "DNI",
		   Persona.nombre AS "Nombre",
		   Persona.apellidoPaterno AS "Apellido Paterno",
           Persona.genero AS "Género",
           Persona.fechaNacimiento AS "Fecha de Nacimiento",
           Cliente.lineaCredito AS "Línea de Crédito",
           Cliente.categoria AS "Categoría"
    FROM Persona
    INNER JOIN Cliente ON Cliente.id
    WHERE Persona.id = Cliente.id AND
		  CONCAT(Persona.nombre, ' ', Persona.apellidoPaterno)
              LIKE CONCAT('%', _nombre, '%') AND
		  activo = true;
END$



-- /------------------------------------------------------/
--           PROCEDIMIENTOS PARA LOS PRODUCTOS           
-- /------------------------------------------------------/
DELIMITER $

-- Procedimiento de Listar Todos
CREATE PROCEDURE LISTAR_PRODUCTOS_TODOS ()
BEGIN
	SELECT id AS "ID",
		   nombre AS "Nombre",
		   unidadMedida AS "Unidad de Medida",
           precio AS "Precio Unitario"
    FROM Producto
    WHERE activo = true;
END$



-- Procedimiento de Listar por Nombre
CREATE PROCEDURE LISTAR_PRODUCTOS_POR_NOMBRE (
	IN _nombre VARCHAR(100)
)
BEGIN
	SELECT id AS "ID",
		   nombre AS "Nombre",
		   unidadMedida AS "Unidad de Medida",
           precio AS "Precio Unitario"
    FROM Producto
    WHERE CONCAT(nombre, ' ', unidadMedida) LIKE
		  CONCAT('%', _nombre, '%') AND
		  activo = true;
END$



-- /------------------------------------------------------/
--         PROCEDIMIENTOS PARA LAS ÓRDENES DE VENTA        
-- /------------------------------------------------------/
-- Procedimiento de Inserción
CREATE PROCEDURE INSERTAR_ORDEN_VENTA (
	OUT _id INT,
    IN _fidCliente INT,
    IN _fidEmpleado INT,
    IN _total DECIMAL(10,2)
)
BEGIN
	INSERT INTO OrdenVenta (fidCliente, fidEmpleado, total, fecha_hora, activo)
    VALUES (_fidCliente, _fidEmpleado, _total, NOW(), true);
    
    SET _id = @@last_insert_id;
END$



-- /------------------------------------------------------/
--     PROCEDIMIENTOS PARA LAS LÍNEAS DE ÓRDEN DE VENTA    
-- /------------------------------------------------------/
-- Procedimiento de Inserción
CREATE PROCEDURE INSERTAR_LINEA_ORDEN_VENTA (
	OUT _id INT,
    IN _fidOrdenVenta INT,
    IN _fidProducto INT,
    IN _cantidad INT,
    IN _subtotal DECIMAL(10,2)
)
BEGIN
	INSERT INTO LineaOrdenVenta (fidOrdenVenta, fidProducto, cantidad, subtotal, activo)
    VALUES (_fidOrdenVenta, _fidProducto, _cantidad, _subtotal, true);
    
    SET _id = @@last_insert_id;
END$