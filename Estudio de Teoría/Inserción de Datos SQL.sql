-- /------------------------------------------------------/
--                    Población de Áreas                   
-- /------------------------------------------------------/
CALL INSERTAR_AREA(@id, 'Recursos Humanos', 'Departamento encargado de la gestión del talento humano.');
CALL INSERTAR_AREA(@id, 'Desarrollo Tecnológico', 'Área dedicada al desarrollo de nuevas tecnologías.');
CALL INSERTAR_AREA(@id, 'Mercadotecnia', 'Departamento encargado de la promoción y publicidad de productos.');
CALL INSERTAR_AREA(@id, 'Finanzas', 'Área encargada de la gestión financiera de la empresa.');
CALL INSERTAR_AREA(@id, 'Ventas', 'Departamento encargado de la comercialización de productos o servicios.');
CALL INSERTAR_AREA(@id, 'Producción', 'Área responsable de la fabricación de productos.');
CALL INSERTAR_AREA(@id, 'Investigación y Desarrollo', 'Departamento dedicado a la innovación y mejora continua.');
CALL INSERTAR_AREA(@id, 'Logística', 'Área encargada de la gestión de inventarios y distribución de productos.');
CALL INSERTAR_AREA(@id, 'Servicio al Cliente', 'Departamento dedicado a atender las necesidades de los clientes.');
CALL INSERTAR_AREA(@id, 'Calidad', 'Área responsable de asegurar la calidad de los productos o servicios.');
CALL INSERTAR_AREA(@id, 'Recursos Materiales', 'Departamento encargado de la gestión de los recursos físicos de la empresa.');
CALL INSERTAR_AREA(@id, 'Comunicación', 'Área dedicada a la comunicación interna y externa de la empresa.');



-- /------------------------------------------------------/
--                 Población de Empleados                 
-- /------------------------------------------------------/
CALL INSERTAR_EMPLEADO(@id, '12345678', 'Juan', 'Pérez', 'M', '1990-05-15', 1, 'Gerente de Recursos Humanos', 5000.00);
CALL INSERTAR_EMPLEADO(@id, '23456789', 'María', 'Gómez', 'F', '1992-08-22', 2, 'Ingeniero de Software', 6000.00);
CALL INSERTAR_EMPLEADO(@id, '34567890', 'Luis', 'Martínez', 'M', '1988-03-10', 3, 'Especialista en Marketing Digital', 4500.00);
CALL INSERTAR_EMPLEADO(@id, '45678901', 'Ana', 'López', 'F', '1995-11-27', 4, 'Analista Financiero', 4800.00);
CALL INSERTAR_EMPLEADO(@id, '56789012', 'Pedro', 'García', 'M', '1993-09-18', 5, 'Ejecutivo de Ventas', 4200.00);
CALL INSERTAR_EMPLEADO(@id, '67890123', 'Laura', 'Fernández', 'F', '1991-07-14', 6, 'Supervisor de Producción', 4800.00);
CALL INSERTAR_EMPLEADO(@id, '78901234', 'Carlos', 'Rodríguez', 'M', '1987-04-03', 7, 'Investigador en Desarrollo', 5500.00);
CALL INSERTAR_EMPLEADO(@id, '89012345', 'Sofía', 'Díaz', 'F', '1994-06-20', 8, 'Coordinador de Logística', 4700.00);
CALL INSERTAR_EMPLEADO(@id, '90123456', 'Eduardo', 'Hernández', 'M', '1996-02-08', 9, 'Ejecutivo de Atención al Cliente', 4300.00);
CALL INSERTAR_EMPLEADO(@id, '01234567', 'Diana', 'Vargas', 'F', '1990-10-30', 10, 'Analista de Calidad', 4600.00);
CALL INSERTAR_EMPLEADO(@id, '11223344', 'Javier', 'Suárez', 'M', '1989-12-05', 11, 'Coordinador de Recursos Materiales', 4800.00);
CALL INSERTAR_EMPLEADO(@id, '22334455', 'Isabel', 'Ramírez', 'F', '1993-08-17', 12, 'Especialista en Comunicación', 4900.00);
CALL INSERTAR_EMPLEADO(@id, '33445566', 'Martín', 'Luna', 'M', '1997-01-25', 1, 'Analista de Recursos Humanos', 4400.00);
CALL INSERTAR_EMPLEADO(@id, '44556677', 'Paula', 'Ortega', 'F', '1992-05-07', 2, 'Desarrollador Web', 5800.00);
CALL INSERTAR_EMPLEADO(@id, '55667788', 'Raúl', 'Castañeda', 'M', '1994-09-12', 3, 'Especialista en Mercadotecnia', 4700.00);



-- /------------------------------------------------------/
--                  Población de Clientes                 
-- /------------------------------------------------------/
CALL INSERTAR_CLIENTE(@id, '12345678', 'Roberto', 'González', 'M', '1985-04-12', 5000.00, 'VIP');
CALL INSERTAR_CLIENTE(@id, '23456789', 'Verónica', 'Hernández', 'F', '1990-08-25', 3000.00, 'CLASICO');
CALL INSERTAR_CLIENTE(@id, '34567890', 'Eduardo', 'Gómez', 'M', '1978-11-10', 10000.00, 'PLATINUM');
CALL INSERTAR_CLIENTE(@id, '45678901', 'María', 'Rodríguez', 'F', '1989-03-27', 7000.00, 'VIP');
CALL INSERTAR_CLIENTE(@id, '56789012', 'José', 'Martínez', 'M', '1980-09-18', 8000.00, 'PLATINUM');
CALL INSERTAR_CLIENTE(@id, '67890123', 'Ana', 'López', 'F', '1995-07-14', 4000.00, 'CLASICO');
CALL INSERTAR_CLIENTE(@id, '78901234', 'Juan', 'Pérez', 'M', '1976-04-03', 6000.00, 'VIP');
CALL INSERTAR_CLIENTE(@id, '89012345', 'Laura', 'Fernández', 'F', '1983-06-20', 9000.00, 'PLATINUM');
CALL INSERTAR_CLIENTE(@id, '90123456', 'Carlos', 'Díaz', 'M', '1992-02-08', 3500.00, 'CLASICO');
CALL INSERTAR_CLIENTE(@id, '01234567', 'Sofía', 'Hernández', 'F', '1987-10-30', 5500.00, 'VIP');
CALL INSERTAR_CLIENTE(@id, '11223344', 'Luis', 'Suárez', 'M', '1984-12-05', 7500.00, 'PLATINUM');
CALL INSERTAR_CLIENTE(@id, '22334455', 'Elena', 'Ramírez', 'F', '1998-08-17', 3200.00, 'CLASICO');
CALL INSERTAR_CLIENTE(@id, '33445566', 'Diego', 'Luna', 'M', '1977-01-25', 4800.00, 'VIP');
CALL INSERTAR_CLIENTE(@id, '44556677', 'Marina', 'Ortega', 'F', '1982-05-07', 6200.00, 'PLATINUM');
CALL INSERTAR_CLIENTE(@id, '55667788', 'Javier', 'Castañeda', 'M', '1986-09-12', 4000.00, 'CLASICO');
CALL INSERTAR_CLIENTE(@id, '66778899', 'Paula', 'García', 'F', '1991-07-19', 5800.00, 'VIP');
CALL INSERTAR_CLIENTE(@id, '77889900', 'Mateo', 'Martínez', 'M', '1981-02-23', 8800.00, 'PLATINUM');
CALL INSERTAR_CLIENTE(@id, '88990011', 'Isabel', 'López', 'F', '1993-04-15', 4200.00, 'CLASICO');
CALL INSERTAR_CLIENTE(@id, '99001122', 'Lucas', 'Gómez', 'M', '1979-11-07', 7000.00, 'VIP');
CALL INSERTAR_CLIENTE(@id, '00112233', 'Valentina', 'Pérez', 'F', '1994-10-22', 5200.00, 'PLATINUM');