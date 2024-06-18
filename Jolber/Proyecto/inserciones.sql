
-- Insertar Paises
INSERT INTO Pais (id, nombre) VALUES
(1, 'Colombia'),
(2, 'China'),
(3, 'India'),
(4, 'Brasil'),
(5, 'Rusia');

-- Insertar Regiones
INSERT INTO Region (id, nombre, idPais) VALUES
(1, 'Cundinamarca', 1),
(2, 'Santander', 1),
(3, 'Guangdong', 2),
(4, 'Shandong', 2),
(5, 'Uttar Pradesh', 3),
(6, 'Maharashtra', 3),
(7, 'São Paulo', 4),
(8, 'Rio de Janeiro', 4),
(9, 'Moscow', 5),
(10, 'Saint Petersburg', 5);

-- Insertar Ciudades
INSERT INTO Ciudad (id, nombre, idRegion) VALUES
(1, 'Bogotá', 1),
(2, 'Bucaramanga', 2),
(3, 'Guangzhou', 3),
(4, 'Jinan', 4),
(5, 'Lucknow', 5),
(6, 'Mumbai', 6),
(7, 'São Paulo', 7),
(8, 'Rio de Janeiro', 8),
(9, 'Moscow', 9),
(10, 'Saint Petersburg', 10);

-- Insertar Talleres 

INSERT INTO Taller (id, nombre, idCiudad) VALUES
(1, 'Taller Central', 1),
(2, 'Taller Bucaramanga', 2);



-- Insertar cargos
INSERT INTO Cargo (id, nombre, descripcion) VALUES
(1, 'Mecánico automotriz', 'Encargado de realizar diagnósticos, reparaciones y mantenimiento de vehículos, incluyendo motores, sistemas de transmisión, frenos, suspensión, entre otros.'),
(2, 'Electricista automotriz', 'Se especializa en la reparación y mantenimiento de sistemas eléctricos y electrónicos de los vehículos, como el sistema de iluminación, el sistema de encendido, el sistema de gestión del motor, entre otros.'),
(3, 'Chapista', 'Encargado de reparar y mantener la carrocería de los vehículos, incluyendo la reparación de abolladuras, el reemplazo de paneles dañados, la aplicación de masillas y la pintura.'),
(4, 'Pintor automotriz', 'Profesional dedicado a la aplicación de pintura en los vehículos, asegurando un acabado de alta calidad y durabilidad.'),
(5, 'Mecánico de sistemas de escape', 'Especialista en la reparación y mantenimiento de los sistemas de escape de los vehículos, incluyendo el sistema de escape, el catalizador y el silenciador.'),
(6, 'Mecánico de sistemas de refrigeración', 'Responsable de mantener en óptimas condiciones el sistema de refrigeración del motor, incluyendo el radiador, la bomba de agua y el termostato.'),
(7, 'Mecánico de sistemas de dirección y suspensión', 'Encargado de la reparación y mantenimiento de los sistemas de dirección y suspensión, garantizando un manejo seguro y confortable del vehículo.'),
(8, 'Mecánico de sistemas de frenos', 'Profesional especializado en la reparación y mantenimiento de los sistemas de frenos, incluyendo discos, pastillas, tambores y líneas de freno.'),
(9, 'Asistente de taller', 'Colaborador en diversas tareas dentro del taller, como la limpieza y organización del lugar, la asistencia a los mecánicos en la realización de reparaciones y el manejo de herramientas.'),
(10, 'Gerente de taller', 'Encargado de la gestión administrativa y operativa del taller, incluyendo la planificación de trabajos, la atención al cliente, la gestión de inventario y la supervisión del personal técnico y administrativo.'),
(11, 'Recepcionista', 'Encargado de recibir a los clientes, programar citas, atender llamadas telefónicas y realizar tareas administrativas relacionadas con la recepción.'),
(12, 'Asesor de servicio', 'Persona encargada de asesorar a los clientes sobre los servicios disponibles, los costos de reparación y mantenimiento, así como de coordinar las actividades del taller para satisfacer las necesidades del cliente.');


INSERT INTO tipo_documento (id, nombre)
VALUES
(1, 'Cédula de Ciudadanía'),
(2, 'Cédula de Extranjería'),
(3, 'Tarjeta de Identidad'),
(4, 'Pasaporte'),
(5, 'Registro Civil');


-- Insertar empleados
INSERT INTO Empleado (id, primerNombre, segundoNombre, primerApellido, idCargo , idTipoDocumento , idTaller) VALUES
(1, 'Juan', 'José', 'González', 10 , 1 , 1),  -- Gerente de taller
(2, 'María', 'Isabel', 'López', 11 , 1, 1),           -- Recepcionista
(3, 'Pedro', 'Antonio', 'Martínez', 12 , 1, 1),         -- Asesor de servicio
(4, 'Ana', 'María', 'Rodríguez', 1 , 1, 1),      -- Mecánico automotriz
(5, 'José', 'Luis', 'Pérez', 2 , 1 , 1),          -- Electricista automotriz
(6, 'Laura', 'Elena', 'Gómez', 3 , 1 , 1),             -- Chapista
(7, 'David', 'Alejandro', 'Sánchez', 4 , 1 , 1),           -- Pintor automotriz
(8, 'Elena', 'Cristina', 'Fernández', 5 , 1 , 1),         -- Mecánico de sistemas de escape
(9, 'Alejandro', 'Javier', 'Ruiz', 6 , 1 , 1),          -- Mecánico de sistemas de refrigeración
(10, 'Sofía', 'Valentina', 'Díaz', 7 , 1 , 1),             -- Mecánico de sistemas de dirección y suspensión
(11, 'Carlos', 'Manuel', 'Hernández', 8 , 1 , 1),       -- Mecánico de sistemas de frenos
(12, 'Patricia', 'Gabriela', 'Moreno', 9 , 1 , 1);        -- Asistente de taller

-- Insertar tipo de telefonos 
INSERT INTO Tipo_telefono (id, tipo) VALUES
(1, 'Celular'),
(2, 'Residencial'),
(3, 'Oficina'),
(4, 'Corporativo');


-- Insertar registros en telefonos de los empleados
INSERT INTO Telefono_empleado (idEmpleado, numero, tipo) VALUES
(1, '555-1234', 1),
(1, '555-5678', 2),
(2, '555-9876', 1),
(2, '555-5432', 2),
(3, '555-1111', 1),
(4, '555-2222', 1),
(5, '555-3333', 1),
(6, '555-4444', 1),
(7, '555-5555', 1),
(8, '555-6666', 1),
(9, '555-7777', 1),
(10, '555-8888', 1),
(11, '555-9999', 1),
(12, '555-0000', 1),
(4, '555-1234', 2),
(5, '555-5678', 2),
(6, '555-9876', 2),
(3, '555-7777', 3),
(8, '555-5432', 3),
(12, '555-1111', 3);

-- Insertar proveedores
INSERT INTO Proveedor (id, nombre, nombre_contacto, apellido_contacto, email) VALUES
(1, 'Bosch', 'Juan', 'González', 'info@bosch.com'),
(2, 'Denso', 'María', 'López', 'contacto@denso.com'),
(3, 'Continental', 'Pedro', 'Martínez', 'ventas@continental.com'),
(4, 'Valeo', 'Ana', 'Rodríguez', 'ventas@valeo.com'),
(5, 'Magneti Marelli', 'Carlos', 'Sánchez', 'info@magnetimarelli.com');


-- Insertar  Clientes
INSERT INTO Cliente (id, identificacion, nombre, apellido, direccion, email, idTipoDocumento, idTaller) VALUES
(1, '123456789', 'Juan', 'Pérez', 'Calle 123', 'juan@example.com', 1, 1),
(2, '987654321', 'María', 'González', 'Carrera 456', 'maria@example.com', 2, 1),
(3, '456789123', 'Pedro', 'Martínez', 'Avenida 789', 'pedro@example.com', 1, 1),
(4, '789123456', 'Ana', 'López', 'Calle 456', 'ana@example.com', 1, 1),
(5, '321654987', 'José', 'Gómez', 'Carrera 789', 'jose@example.com', 1, 1),
(6, '159753456', 'Laura', 'Hernández', 'Avenida 123', 'laura@example.com', 1, 1),
(7, '456321789', 'David', 'Díaz', 'Calle 789', 'david@example.com', 1, 1),
(8, '753951456', 'Elena', 'Fernández', 'Carrera 123', 'elena@example.com', 1, 1),
(9, '852147963', 'Alejandro', 'Rodríguez', 'Avenida 456', 'alejandro@example.com', 1, 1),
(10, '369852147', 'Sofía', 'Sánchez', 'Calle 789', 'sofia@example.com', 1, 1),
(11, '147852369', 'Carlos', 'Martínez', 'Carrera 123', 'carlos@example.com', 1, 1),
(12, '654789321', 'Patricia', 'Gómez', 'Avenida 456', 'patricia@example.com', 2, 1),
(13, '258963147', 'Luis', 'Hernández', 'Calle 789', 'luis@example.com', 1, 1),
(14, '987321654', 'Gabriela', 'Pérez', 'Carrera 123', 'gabriela@example.com', 1, 1),
(15, '456123789', 'Andrea', 'Díaz', 'Avenida 456', 'andrea@example.com', 3, 1),
(16, '147369852', 'Javier', 'Martínez', 'Calle 789', 'javier@example.com', 1, 1),   
(17, '963852741', 'Marcela', 'López', 'Carrera 123', 'marcela@example.com', 1, 1),
(18, '654258963', 'Fernando', 'Gómez', 'Avenida 456', 'fernando@example.com', 1, 1),
(19, '987456321', 'Camila', 'Sánchez', 'Calle 789', 'camila@example.com', 2, 1),
(20, '321789654', 'Daniel', 'Rodríguez', 'Carrera 123', 'daniel@example.com', 1, 1);


-- Insertar registros en la tabla telefono_cliente

INSERT INTO telefono_cliente (idCliente, numero, tipo) VALUES
(1, '1234567890', 1),
(2, '9876543210', 2),
(3, '4567891230', 1),
(4, '7891234560', 1),
(5, '3216549870', 1),
(6, '1597534560', 1),
(7, '4563217890', 1),
(8, '7539514560', 1),
(9, '8521479630', 1),
(10, '3698521470', 1),
(11, '1478523690', 1),
(12, '6547893210', 2),
(13, '2589631470', 1),
(14, '9873216540', 1),
(15, '4561237890', 3),
(16, '1473698520', 1),
(17, '9638527410', 1),
(18, '6542589630', 1),
(19, '9874563210', 2),
(20, '3217896540', 1);


-- Insertar registros en la tabla Marca_vehiculo
INSERT INTO Marca_vehiculo (id, nombre) VALUES
(1, 'Toyota'),
(2, 'Honda'),
(3, 'Ford'),
(4, 'Chevrolet'),
(5, 'Volkswagen'),
(6, 'Nissan'),
(7, 'Hyundai'),
(8, 'Kia'),
(9, 'Mazda'),
(10, 'Renault');



-- Insertar registros en la tabla Vehiculo
INSERT INTO Vehiculo (id, placa, modelo, año, idCliente, idMarca , kilometraje) VALUES
(1, 'ABC123', 'Corolla', 2020, 1, 1 , 10000),
(2, 'DEF456', 'Civic', 2018, 2, 2 , 20000),
(3, 'GHI789', 'Fiesta', 2019, 3, 3 , 30000),
(4, 'JKL012', 'Spark', 2017, 4, 4 , 40000),
(5, 'MNO345', 'Gol', 2016, 5, 5 , 50000),
(6, 'PQR678', 'Sentra', 2015, 6, 6 , 60000),
(7, 'STU901', 'Accent', 2014, 7, 7 , 70000),
(8, 'VWX234', 'Rio', 2013, 8, 8 , 80000),
(9, 'YZA567', 'Mazda 3', 2012, 9, 9 , 90000),
(10, 'BCD890', 'Logan', 2011, 10, 10 , 100000);

-- Insertar zonas del taller
INSERT INTO Zona (id, nombre) VALUES
(1, 'Área de Recepción'),
(2, 'Taller Mecánico'),
(3, 'Taller de Pintura'),
(4, 'Área de Almacenamiento'),
(5, 'Oficina Administrativa'),
(6, 'Área de Lavado'),
(7, 'Área de Inspección'),
(8, 'Área de Servicio al Cliente'),
(9, 'Área de Soldadura'),
(10, 'Área de Electricidad'),
(11, 'Zona de Estacionamiento'),
(12, 'Área de Desmontaje'),
(13, 'Área de Mantenimiento Preventivo');


-- Insertar zonas de los talleres 
INSERT INTO Zona_taller (idTaller, idZona) VALUES
(1, 1), -- Área de Recepción (Taller Central)
(1, 2), -- Taller Mecánico (Taller Central)
(1, 3), -- Taller de Pintura (Taller Central)
(1, 4), -- Área de Almacenamiento (Taller Central)
(1, 5), -- Oficina Administrativa (Taller Central)
(1, 6), -- Área de Lavado (Taller Central)
(1, 7), -- Área de Inspección (Taller Central)
(1, 8), -- Área de Servicio al Cliente (Taller Central)
(1, 9), -- Área de Soldadura (Taller Central)
(1, 10), -- Área de Electricidad (Taller Central)
(1, 11), -- Zona de Estacionamiento (Taller Central)
(1, 12), -- Área de Desmontaje (Taller Central)
(1, 13), -- Área de Mantenimiento Preventivo (Taller Central)
(2, 1), -- Área de Recepción (Taller Bucaramanga)
(2, 2), -- Taller Mecánico (Taller Bucaramanga)
(2, 3), -- Taller de Pintura (Taller Bucaramanga)
(2, 4), -- Área de Almacenamiento (Taller Bucaramanga)
(2, 5); -- Oficina Administrativa (Taller Bucaramanga)

-- Insertar servicios por zonas 
INSERT INTO Servicio (id, nombre, descripcion, idZona, costoBase) VALUES
-- Taller Mecánico
(1, 'Cambio de aceite', 'Sustitución de aceite y filtro.', 2, 40.00),
(2, 'Reparación de motor', 'Arreglo y mantenimiento de motores.', 2, 100.00),
(3, 'Alineación y balanceo', 'Ajuste de la alineación y balanceo de neumáticos.', 2, 60.00),

-- Taller de Pintura
(4, 'Pintura completa', 'Pintura completa del vehículo.', 3, 300.00),
(5, 'Retoque de pintura', 'Reparación de pequeños daños en la pintura.', 3, 80.00),
(6, 'Pulido y encerado', 'Proceso de pulido y encerado para mejorar el brillo.', 3, 50.00),

-- Área de Lavado
(7, 'Lavado básico', 'Lavado exterior y aspirado interior del vehículo.', 6, 20.00),
(8, 'Lavado detallado', 'Lavado completo del vehículo, interior y exterior.', 6, 50.00),
(9, 'Lavado de motor', 'Limpieza y desengrase del compartimento del motor.', 6, 30.00),

-- Área de Inspección
(10, 'Inspección de seguridad', 'Revisión de seguridad básica del vehículo.', 7, 25.00),
(11, 'Inspección de emisiones', 'Control de emisiones contaminantes del vehículo.', 7, 35.00),
(12, 'Inspección de frenos', 'Evaluación del sistema de frenos del vehículo.', 7, 40.00),

-- Área de Soldadura
(13, 'Reparación de chasis', 'Reparación de daños estructurales en el chasis.', 9, 150.00),
(14, 'Soldadura de componentes', 'Unión de piezas mediante soldadura.', 9, 80.00),
(15, 'Refuerzo de estructuras', 'Refuerzo de estructuras de vehículos.', 9, 120.00),

-- Área de Electricidad
(16, 'Reparación de cableado', 'Reparación de sistemas eléctricos y cableado.', 10, 60.00),
(17, 'Instalación de sistemas', 'Instalación de sistemas eléctricos adicionales.', 10, 100.00),
(18, 'Diagnóstico de fallos', 'Diagnóstico y reparación de fallos eléctricos.', 10, 50.00),

-- Zona de Estacionamiento
(19, 'Estacionamiento por dia', 'Cobro por estacionamiento por día a vehículos que no han sido recogidos por el cliente.', 11, 5.00),

-- Área de Desmontaje
(20, 'Desmontaje de piezas', 'Desmontaje de piezas para reparación o sustitución.', 12, 40.00),
(21, 'Reciclaje de componentes', 'Reciclaje de componentes desmontados.', 12, 0.00),
(22, 'Almacenamiento de piezas', 'Almacenamiento temporal de piezas desmontadas.', 12, 30.00),

-- Área de Mantenimiento Preventivo
(23, 'Cambio de filtros', 'Sustitución de filtros de aire y habitáculo.', 13, 25.00),
(24, 'Revisión de líquidos', 'Control y relleno de líquidos del vehículo.', 13, 20.00),
(25, 'Revisión de neumáticos', 'Inspección y ajuste de presión de los neumáticos.', 13, 15.00);



-- Insertar citas 

INSERT INTO Cita (id, hora, idCliente, idTaller) VALUES
(1, '2024-06-06 09:00:00', 1, 1),
(2, '2024-06-06 10:30:00', 2, 1),
(3, '2024-06-06 11:45:00', 3, 1),
(4, '2024-06-07 08:30:00', 4, 1),
(5, '2024-06-07 10:00:00', 5, 1),
(6, '2024-06-07 13:15:00', 6, 1),
(7, '2024-06-08 09:30:00', 7, 1),
(8, '2024-06-08 11:00:00', 8, 1),
(9, '2024-06-08 15:45:00', 9, 1),
(10, '2024-06-09 10:45:00', 10, 1);

-- Insertar datos de los detalles de la citas 
INSERT INTO Cita_vehiculo (idVehiculo, idCita, descripcion) VALUES
-- Cliente 1 - Juan Pérez - Placa: ABC123
(1, 1, 'El carro no enciende'),
-- Cliente 2 - María González - Placa: DEF456
(2, 2, 'Una luz no prende'),
-- Cliente 3 - Pedro Martínez - Placa: GHI789
(3, 3, 'Sonido raro del motor'),
-- Cliente 4 - Ana López - Placa: JKL012
(4, 4, 'Problema de temperatura elevada'),
-- Cliente 5 - José Gómez - Placa: MNO345
(5, 5, 'Vibración al frenar'),
-- Cliente 6 - Laura Hernández - Placa: PQR678
(6, 6, 'Daño en la puerta trasera izquierda'),
-- Cliente 7 - David Díaz - Placa: STU901
(7, 7, 'Olor a gasolina en el interior del vehículo'),
-- Cliente 8 - Elena Fernández - Placa: VWX234
(8, 8, 'Problema de arranque intermitente'),
-- Cliente 9 - Alejandro Rodríguez - Placa: YZA567
(9, 9, 'Faro delantero no funciona correctamente'),
-- Cliente 10 - Sofía Sánchez - Placa: BCD890
(10, 10, 'Pérdida de potencia al acelerar');



-- Insertar datos en reparacion 
INSERT INTO Reparacion (id, idVehiculo, costoTotal) VALUES
-- Vehículo 1 - Corolla
(1, 1, 290.00),
-- Vehículo 2 - Civic
(2, 2, 500.00),
-- Vehículo 3 - Fiesta
(3, 3, 70.00);




-- Insertar telefonos de los proveedores

INSERT INTO Telefono_proveedor (id, idProveedor, numero, tipo) VALUES
-- Teléfonos para Proveedor 1 (Bosch)
(1, 1, '+123456789', 1),
(2, 1, '+987654321', 3),
-- Teléfonos para Proveedor 2 (Denso)
(3, 2, '+123456789', 1),
(4, 2, '+987654321', 3),
-- Teléfonos para Proveedor 3 (Continental)
(5, 3, '+123456789', 1),
(6, 3, '+987654321', 3),
-- Teléfonos para Proveedor 4 (Valeo)
(7, 4, '+123456789', 1),
(8, 4, '+987654321', 3),
-- Teléfonos para Proveedor 5 (Magneti Marelli)
(9, 5, '+123456789', 1),
(10, 5, '+987654321', 3);


-- Inserciones de ordenes de compra
INSERT INTO Orden_compra (id, fecha, idProveedor, idEmpleado, total)
VALUES
(1, '2024-06-01', 1, 1, 500.00), -- Utilizando el proveedor Bosch, con el empleado Juan González
(2, '2024-06-02', 2, 1, 750.00), -- Utilizando el proveedor Denso, con el empleado Juan González
(3, '2024-06-03', 3, 1, 1000.00); -- Utilizando el proveedor Continental, con el empleado Juan González

-- Insertar marcas de piezas
INSERT INTO Marca_pieza (id, nombre)
VALUES
(1, 'Bosch'),
(2, 'Denso'),
(3, 'Continental'),
(4, 'Valeo'),
(5, 'Magneti Marelli'),
(6, 'Motorcraft'),
(7, 'Delphi'),
(8, 'NGK'),
(9, 'Monroe'),
(10, 'Brembo');


-- Insertar piezas 
INSERT INTO Pieza (id, nombre, descripcion)
VALUES
(1, 'Filtro de aceite', 'Filtro diseñado para retener las impurezas presentes en el aceite del motor.'),
(2, 'Pastillas de freno', 'Componente utilizado en el sistema de frenos para generar fricción y detener el vehículo.'),
(3, 'Bujía de encendido', 'Dispositivo que produce la chispa necesaria para encender la mezcla de aire y combustible en el motor de combustión interna.'),
(4, 'Amortiguador', 'Elemento del sistema de suspensión diseñado para absorber y disipar la energía cinética generada por el movimiento del vehículo.'),
(5, 'Correa de distribución', 'Correa que sincroniza el movimiento de las diferentes partes del motor, como el cigüeñal y los árboles de levas.'),
(6, 'Filtro de aire', 'Filtro diseñado para atrapar las partículas de suciedad presentes en el aire antes de que ingresen al sistema de combustión del motor.'),
(7, 'Termostato', 'Dispositivo que regula la temperatura del motor controlando el flujo de líquido refrigerante.'),
(8, 'Embrague', 'Mecanismo utilizado para conectar y desconectar el motor de la transmisión, permitiendo cambiar de marcha.'),
(9, 'Radiador', 'Componente del sistema de refrigeración que disipa el calor del líquido refrigerante.'),
(10, 'Sensor de oxígeno', 'Dispositivo que mide la cantidad de oxígeno presente en los gases de escape y ayuda a controlar la mezcla aire-combustible para optimizar la combustión.'),
(11, 'Pintura automotriz', 'Pintura especialmente diseñada para la aplicación en vehículos, proporcionando protección contra la corrosión y mejorando su apariencia estética.');



INSERT INTO Orden_detalle (idOrdenCompra, idPieza, cantidad, idMarca, precioUnidad)
VALUES
-- Registro 1
(1, 1, 10, 1, 15.00), -- Bosch
(1, 2, 3, 2, 50.00), -- Denso
(1, 3, 2, 3, 100.00), -- Continental

-- Registro 2
(2, 4, 5, 4, 50.00), -- Valeo
(2, 5, 1, 5, 250.00), -- Magneti Marelli
(2, 6, 10, 6, 50.00), -- Motorcraft

-- Registro 3
(3, 7, 1, 7, 550.00), -- Bosch
(3, 8, 5, 8, 70.00), -- Denso
(3, 9, 10, 9, 10.00); -- Continental

-- Inserts para la zona de almacenamiento (mayoría de las piezas)
INSERT INTO Inventario (id, piezaId, idZona, cantidad)
VALUES
(1, 1, 4, 10),  -- Área de Almacenamiento
(2, 4, 4, 5),   -- Área de Almacenamiento
(3, 5, 4, 1),   -- Área de Almacenamiento
(4, 6, 4, 10),  -- Área de Almacenamiento
(5, 7, 4, 1),   -- Área de Almacenamiento
(6, 8, 4, 5),   -- Área de Almacenamiento
(7, 9, 4, 10),  -- Área de Almacenamiento
(8, 2, 1, 3), -- Área de Recepción
(9, 3, 1, 2); -- Área de Recepción

-- Inserts para asignar las piezas del área de almacenamiento al taller 1
INSERT INTO Inventario_taller (idInventario, idTaller, cantidad , stockInicial)
VALUES
(1, 1, 10 , 50),
(2, 1, 5 , 50) ,
(3, 1, 1 , 50),
(4, 1, 10 , 30),
(5, 1, 1 , 50),
(6, 1, 5 , 40),
(7, 1, 10 , 30),
(8, 1, 3 , 20),
(9, 1, 2 , 40);


-- Inserts para generar los servicios prestados a cada reparación
INSERT INTO Reparacion_servicio (id, idServicio, idReparacion, idPieza, fechaInicio, fechaFin, descripcion, cantidadPiezas, costo)
VALUES
-- Reparación 1, Servicio 1 - Cambio de aceite
(1, 1, 1, 1, '2024-05-01', '2024-05-01', 'Se realizó el cambio de aceite y filtro en el motor del vehículo.', 5, 190.00),
-- Reparación 1, Servicio 2 - Reparación de motor
(2, 2, 1, NULL, '2024-05-01', '2024-05-03', 'Se realizó la reparación completa del motor del vehículo.', NULL, 100.00),
-- Reparación 2, Servicio 4 - Pintura completa
(3, 4, 2, 11, '2024-05-10', '2024-05-15', 'Se aplicó una nueva capa de pintura completa al vehículo.', 1, 450.00),
-- Reparación 2, Servicio 6 - Pulido y encerado
(4, 6, 2, NULL, '2024-05-16', '2024-05-17', 'Se realizó un pulido profundo y encerado para mejorar el brillo y protección de la pintura.', NULL, 50.00),
-- Reparación 3, Servicio 7 - Lavado básico
(5, 7, 3, NULL, '2024-06-01', '2024-06-01', 'Se efectuó un lavado básico del vehículo para remover la suciedad superficial.', NULL, 20.00),
-- Reparación 3, Servicio 8 - Lavado detallado
(6, 8, 3, NULL, '2024-06-01', '2024-06-01', 'Se realizó un lavado detallado del vehículo, incluyendo el interior y exterior, para dejarlo en óptimas condiciones.', NULL, 50.00);

-- Inserts para asignar empleados a los servicios prestados en cada reparación
INSERT INTO Reparacion_empleado (idReparacion, idEmpleado , horasTrabajadas)
VALUES
-- Reparación 1, Servicio 1 - Cambio de aceite
(1, 4 , 1), -- Mecánico automotriz
(1, 8 , 1), -- Mecánico de sistemas de escape

-- Reparación 1, Servicio 2 - Reparación de motor
(2, 4 , 10), -- Mecánico automotriz
(2, 11 , 12), -- Mecánico de sistemas de frenos

-- Reparación 2, Servicio 4 - Pintura completa
(3, 7 , 4), -- Pintor automotriz
(3, 6 , 4), -- Chapista

-- Reparación 2, Servicio 6 - Pulido y encerado
(4, 7 , 3), -- Pintor automotriz
(4, 6 , 3), -- Chapista

-- Reparación 3, Servicio 7 - Lavado básico
(5, 9 ,2), -- Mecánico de sistemas de refrigeración
(5, 10 ,2), -- Mecánico de sistemas de dirección y suspensión

-- Reparación 3, Servicio 8 - Lavado detallado
(6, 9 , 4), -- Mecánico de sistemas de refrigeración
(6, 10, 4); -- Mecánico de sistemas de dirección y suspensión


-- Inserts para generar registros de reparaciones en la tabla indicada
INSERT INTO Factura (id , idReparacion, idCliente, fecha, total, impuesto)
VALUES
-- Reparación 1 - Vehículo Corolla (Cliente Juan Pérez)
(1, 1, 1, '2024-05-07', 293.48, 3.48),

-- Reparación 2 - Vehículo Civic (Cliente María González)
(2,2, 2, '2024-06-17', 510.00, 10.00),

-- Reparación 3 - Vehículo Fiesta (Cliente Pedro Martínez)
(3,3, 3, '2024-06-3', 77.84, 7.84);

use taller;





