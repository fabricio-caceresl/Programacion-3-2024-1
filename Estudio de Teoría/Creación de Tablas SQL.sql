-- /------------------------------------------------------/
--                Reiniciar la Base de Datos              
-- /------------------------------------------------------/
DROP TABLE IF EXISTS Trabajador;
DROP TABLE IF EXISTS Persona;
DROP PROCEDURE IF EXISTS INSERTAR_TRABAJADOR;
DROP PROCEDURE IF EXISTS MODIFICAR_TRABAJADOR;
DROP PROCEDURE IF EXISTS ELIMINAR_TRABAJADOR;
DROP PROCEDURE IF EXISTS LISTAR_TRABAJADORES_TODOS;


-- /------------------------------------------------------/
-- 				  CREACION DE LAS TABLAS				  
-- /------------------------------------------------------/
-- Tabla Persona
CREATE TABLE Persona (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    edad INT CHECK (edad >= 0 AND edad <= 150),
    activo BOOL
);

-- Tabla Trabajador
CREATE TABLE Trabajador (
    id INT PRIMARY KEY,
    area VARCHAR(255),
    FOREIGN KEY (id) REFERENCES Persona(id)
);


-- /------------------------------------------------------/
--              CREACION DE LOS PROCEDIMINETOS            
-- /------------------------------------------------------/
DELIMITER $

-- Procedimiento de Inserción
CREATE PROCEDURE INSERTAR_TRABAJADOR (
	OUT _id INT,
	IN _nombre VARCHAR(255),
    IN _edad INT,
    IN _area VARCHAR(255)
)
BEGIN
	INSERT INTO Persona (nombre, edad, activo)
    VALUES (_nombre, _edad, true);
    
    SET _id = @@last_insert_id;
    
    INSERT INTO Trabajador (id, area)
    VALUES (_id, _area);
END$

-- Procedimiento de Modificación
CREATE PROCEDURE MODIFICAR_TRABAJADOR (
	IN _id INT,
    IN _nombre VARCHAR(255),
    IN _edad INT,
    IN _area VARCHAR(255)
)
BEGIN
	UPDATE Persona
    SET nombre = _nombre, edad = _edad
    WHERE id = _id;
    
    UPDATE Trabajador
    SET area = _area
    WHERE id = _id;
END$

-- Procedimiento de Eliminación
CREATE PROCEDURE ELIMINAR_TRABAJADOR (
	IN _id INT
)
BEGIN
	UPDATE Persona
    SET activo = false
    WHERE id = _id;
END$

-- Procedimiento de Listar Todos
CREATE PROCEDURE LISTAR_TRABAJADORES_TODOS ()
BEGIN
	SELECT Persona.id as ID, Persona.nombre as Nombre,
		   Persona.edad as Edad, Trabajador.area as Area
    FROM Persona
    INNER JOIN Trabajador ON Trabajador.id
    WHERE Persona.id = Trabajador.id AND
		  Persona.activo = true;
END$