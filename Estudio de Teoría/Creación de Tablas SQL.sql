-- /------------------------------------------------------/
--                Reiniciar la Base de Datos              
-- /------------------------------------------------------/
-- Eliminación de las Tablas
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

-- Tabla Trabajador
CREATE TABLE Empleado (
    id INT PRIMARY KEY,
    fidArea INT,
	cargo VARCHAR(100),
    sueldo DECIMAL(10,2),
    activo BOOL,
    FOREIGN KEY(id) REFERENCES Persona(id),
    FOREIGN KEY(fidArea) REFERENCES Area(id)
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
	SELECT id as ID, nombre as Nombre, descripcion as Descripción
    FROM Area
    WHERE activo = true;
END$



-- /------------------------------------------------------/
--           PROCEDIMIENTOS PARA LOS TRABAJADORES          
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