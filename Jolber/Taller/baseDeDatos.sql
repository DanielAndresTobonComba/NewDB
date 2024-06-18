drop database if not exists Empresas;
create database Empresas; 
use Empresas;

CREATE TABLE gama_producto (
  gama VARCHAR(50) NOT NULL,
  nombre varchar(25) not null,
  descripcion_texto TEXT,
  descripcion_html TEXT,
  imagen VARCHAR(256),
  PRIMARY KEY (gama)	
);

CREATE TABLE pais (
	id INT PRIMARY KEY AUTO_INCREMENT ,
	nombre varchar(100) NOT NULL
	
);

CREATE TABLE region (
	id INT PRIMARY KEY AUTO_INCREMENT ,
	nombre varchar(100) NOT NULL,
	id_pais INT,
	foreign key (id_pais) references pais (id)
);

CREATE TABLE ciudad (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre varchar(100) NOT NULL,
	id_region INT,
	codPostal varchar(11) NOT NULL,
	foreign key (id_region) references region (id)
);


create table proveedor (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre varchar(100) NOT NULL,
  correo varchar(35) NOT NULL UNIQUE,
  idCiudad INT,
  nit varchar(13) NOT NULL UNIQUE,
  foreign key (idCiudad) references ciudad(id)
);



create table tipo_telefono (
	id INT PRIMARY KEY AUTO_INCREMENT,
	tipo varchar(20)
);

create table telefono_proveedor (
	id INT PRIMARY KEY AUTO_INCREMENT, 
	numero varchar(20),
	tipoNumero INT,
	idProveedor INT,
	foreign key (tipoNumero) references tipo_telefono (id),
	foreign key (idProveedor) references proveedor (id)
);



CREATE TABLE producto (
  id INT PRIMARY KEY AUTO_INCREMENT,
  idProveedor INT,
  nombre VARCHAR(70),
  gama VARCHAR(50),
  dimensiones VARCHAR(25),
  descripcion TEXT,
  cantidad_en_stock SMALLINT(6),
  precio_venta DECIMAL(15,2),
  precio_proveedor DECIMAL(15,2),
  FOREIGN KEY (gama) REFERENCES gama_producto (gama),
  FOREIGN KEY (idProveedor) REFERENCES proveedor (id)
);




CREATE TABLE oficina (
  id INT PRIMARY KEY ,
  nombre varchar(50)
  
);


create table tipo_direccion (
	id INT PRIMARY KEY,
	tipo varchar(35)
);



create table direccion_oficina (
	id INT PRIMARY KEY, 
	direccion varchar(50), 
	idOficina INT,
	tipo INT,
	idCiudad INT,
	foreign key (idOficina) references oficina (id),
	foreign key (tipo) references tipo_direccion (id),
	foreign key (idCiudad) references ciudad (id)
);




create table telefono_oficina (
	id INT PRIMARY KEY AUTO_INCREMENT, 
	numero varchar(20),
	tipoTelefono INT,
	idOficina INT,
	foreign key (tipoTelefono) references tipo_telefono (id),
	foreign key (idOficina) references oficina (id)
);




create table cargo (
	id INT PRIMARY KEY AUTO_INCREMENT, 
	tipo varchar(50) NOT NULL,
	descripcion tinytext NOT NULL
);



CREATE TABLE empleado (
  id INT PRIMARY KEY,
  nombre VARCHAR(50),
  apellido1 VARCHAR(50),
  apellido2 VARCHAR(50),
  extension VARCHAR(10),
  email VARCHAR(100) unique,
  codigo_oficina INT,
  codigo_jefe INT,
  idCargo INT,
  FOREIGN KEY (codigo_oficina) REFERENCES oficina (ID),
  FOREIGN KEY (idCargo) REFERENCES cargo (id),
  FOREIGN KEY (codigo_jefe) REFERENCES empleado (id)
);


create table telefono_empleado (
	id INT PRIMARY KEY,
	numero varchar(20),
	tipoTelefono INT,
	idEmpleado INT,
	foreign key (tipoTelefono) references tipo_telefono (id),
	foreign key (idEmpleado) references empleado (id)	
);



create table cliente (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50),
	apellido1 varchar(25) not null,
	apellido2 varchar(25) null,
  	idEmpleadoReporteVentas INT, 
  	limite_credito DECIMAL(15,2),
  	foreign key (idEmpleadoReporteVentas) references empleado (id)
);



CREATE TABLE contacto (
	id INT PRIMARY KEY,
	nombre_contacto VARCHAR(30),
  	apellido_contacto VARCHAR(30),
  	correo varchar(50) unique,
  	idCliente INT, 
  	foreign key (idCliente) references cliente (id)
);


CREATE TABLE telefono_contacto (
	id INT PRIMARY KEY AUTO_INCREMENT, 
	numero varchar(20),
	tipo INT,
	idContacto INT,
	foreign key (tipo) references tipo_telefono (id),
	foreign key (idContacto) references contacto (id)
);

CREATE TABLE telefono_cliente (
	id INT PRIMARY KEY AUTO_INCREMENT, 
	numero varchar(20),
	tipoTelefono INT,
	idCliente INT,
	foreign key (tipoTelefono) references tipo_telefono (id),
	foreign key (idCliente) references cliente (id)
);



create table direccion_cliente (
	id INT PRIMARY KEY, 
	direccion varchar(50), 
	idCliente INT,
	tipo INT,
	idCiudad INT,
	foreign key (idCliente) references cliente (id),
	foreign key (tipo) references tipo_direccion (id),
	foreign key (idCiudad) references ciudad (id)
);



create table forma_pago (
    id INT PRIMARY KEY,
    tipo varchar(25) not null
);



CREATE TABLE pago (
  id VARCHAR(50) primary key,
  idCliente INT,
  fecha_pago DATE not null,
  forma_pago INT,
  total DECIMAL(15,2),
  FOREIGN KEY (forma_pago) references forma_pago (id),
  FOREIGN KEY (idCliente) references cliente (id)
);


create table tipo_estado (
    id INT PRIMARY KEY,
    tipo varchar(25),
    descripcion tinytext
);


create table pedido (
    id INT PRIMARY KEY,
    fecha_pedido DATE NOT NULL,
    fecha_esperada DATE NOT NULL,
    fecha_entrega DATE null,
    comentarios text null,
    idCliente INT,
    idEstado INT,
    FOREIGN KEY (idCliente) REFERENCES cliente (id),
    FOREIGN KEY (idEstado) REFERENCES tipo_estado (id)
);


CREATE TABLE detalle_pedido (
  idPedido INT NOT NULL,
  idProducto INT NOT NULL,
  cantidad INT,
  precio_unidad DECIMAL(15,2),
  numero_linea INT,
  primary key (idPedido , idProducto ),
  FOREIGN KEY (idPedido) REFERENCES pedido(id),
  FOREIGN KEY (idProducto) REFERENCES producto(id)
);


#### INSERCIONES DE DATOs

-- Insercion de la tabla gama_producto 


INSERT INTO gama_producto (gama, nombre, descripcion_texto, descripcion_html, imagen) VALUES
('1', 'Electrónica', 'Un teléfono inteligente de última generación con una pantalla AMOLED de 6.5 pulgadas.', '<p>Un teléfono inteligente de última generación con una pantalla AMOLED de 6.5 pulgadas.</p>', 'imagenes/smartphone_x1.jpg'),
('2', 'Electrodomésticos', 'Aspiradora con alta potencia de succión y múltiples accesorios para la limpieza.', '<p>Aspiradora con alta potencia de succión y múltiples accesorios para la limpieza.</p>', 'imagenes/aspiradora_turbo.jpg'),
('3', 'Juguetería', 'Juego de construcción con bloques para estimular la creatividad de los niños.', '<p>Juego de construcción con bloques para estimular la creatividad de los niños.</p>', 'imagenes/construccion_creativa.jpg'),
('4', 'Moda', 'Elegante chaqueta de cuero genuino, perfecta para cualquier ocasión.', '<p>Elegante chaqueta de cuero genuino, perfecta para cualquier ocasión.</p>', 'imagenes/chaqueta_cuero.jpg'),
('5', 'Deportes', 'Bicicleta de montaña con cuadro de aluminio y suspensión delantera.', '<p>Bicicleta de montaña con cuadro de aluminio y suspensión delantera.</p>', 'imagenes/bicicleta_montana.jpg');

    

-- Insercion de la tabla pais 

INSERT INTO pais (id , nombre) 
VALUES 
('1','Argentina'),
('2','Brasil'),
('3','Chile'),
('4','Colombia'),
('5','México');


-- Insercion de la tabla region

INSERT INTO region (id ,nombre, id_pais) VALUES 
('1', 'Buenos Aires', 1), ('2','Córdoba', 1),
('3','São Paulo', 2), ('4','Rio de Janeiro', 2),
('5','Coquimbo', 3), ('6','Aconcagua', 3),
('7','Cundinamarca', 4), ('8','Antioquia', 4),
('9','Chiapas', 5), ('10','Hidalgo', 5);

-- Inserciones de la tabla ciudad 

INSERT INTO ciudad (id, nombre, id_region, codPostal) VALUES
(1, 'Buenos Aires', 1, '1000'),
(2, 'La Plata', 1, '1900'),
(3, 'Córdoba', 2, '5000'),
(4, 'Villa Carlos Paz', 2, '5152'),
(5, 'São Paulo', 3, '01000-000'),
(6, 'Campinas', 3, '13000-000'),
(7, 'Rio de Janeiro', 4, '20000-000'),
(8, 'Niterói', 4, '24000-000'),
(9, 'La Serena', 5, '1700000'),
(10, 'Coquimbo', 5, '1780000'),
(11, 'Los Andes', 6, '2100000'),
(12, 'San Felipe', 6, '2170000'),
(13, 'Bogotá', 7, '110111'),
(14, 'Soacha', 7, '250051'),
(15, 'Medellín', 8, '050001'),
(16, 'Envigado', 8, '055420'),
(17, 'Tuxtla Gutiérrez', 9, '29000'),
(18, 'San Cristóbal de las Casas', 9, '29200'),
(19, 'Pachuca', 10, '42000'),
(20, 'Tulancingo', 10, '43600');


-- Inserciones de la tabla proveedor 

INSERT INTO proveedor (id, nombre, correo, idCiudad, nit) VALUES
(1, 'Tech Solutions S.A.', 'contacto@techsolutions.com', 1, '1234567890123'),
(2, 'Distribuciones Córdoba', 'info@distribucionescordoba.com', 2, '2345678901234'),
(3, 'Comercial São Paulo Ltda.', 'ventas@comercialsao.com', 3, '3456789012345'),
(4, 'Rio Import & Export', 'admin@rioimportexport.com', 4, '4567890123456'),
(5, 'Coquimbo Supplies', 'soporte@coquimbosupplies.com', 5, '5678901234567'),
(6, 'Bogotá Tech Supplies', 'servicio@bogotatech.com', 7, '6789012345678'),
(7, 'Medellín Innovaciones', 'contacto@medellininnovaciones.com', 8, '7890123456789'),
(8, 'Chiapas Distribuidores', 'info@chiapasdistribuidores.com', 9, '8901234567890'),
(9, 'Hidalgo Servicios', 'ventas@hidalgoservicios.com', 10, '9012345678901'),
(10, 'Buenos Aires Distribuidores', 'admin@buenosairesdistribuidores.com', 1, '0123456789012');



-- Inserciones de la tabla tipo_telefono 

INSERT INTO tipo_telefono (id, tipo) VALUES
(1, 'Móvil'),
(2, 'Fijo'),
(3, 'Fax'),
(4, 'Trabajo'),
(5, 'Personal');


-- Inserciones de la tabla telefono_proveedor 


INSERT INTO telefono_proveedor (id, numero, tipoNumero, idProveedor) VALUES
(1, '+1234567890', 1, 1),
(2, '+541155555555', 2, 2),
(3, '+541188888888', 3, 3),
(4, '+541199999999', 4, 4),
(5, '+541122222222', 1, 5),
(6, '+5491112345678', 1, 6),
(7, '+541141414141', 2, 7),
(8, '+541155555555', 3, 8),
(9, '+541199999999', 4, 9),
(10, '+541133333333', 2, 10);


-- Inserciones de la tabla producto

INSERT INTO producto (id, idProveedor, nombre, gama, dimensiones, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES
(1, 1, 'Teléfono Inteligente X1', '1', '15x8x1 cm', 'Un teléfono inteligente de última generación con una pantalla AMOLED de 6.5 pulgadas.', 100, 799.99, 600.00),
(2, 2, 'Aspiradora Turbo', '2', '30x20x15 cm', 'Aspiradora con alta potencia de succión y múltiples accesorios para la limpieza.', 50, 149.99, 100.00),
(3, 3, 'Kit de Construcción Creativa', '3', '25x25x5 cm', 'Juego de construcción con bloques para estimular la creatividad de los niños.', 200, 29.99, 20.00),
(4, 4, 'Chaqueta de Cuero Elegante', '4', '40x30x10 cm', 'Elegante chaqueta de cuero genuino, perfecta para cualquier ocasión.', 30, 199.99, 150.00),
(5, 5, 'Bicicleta de Montaña', '5', '160x60x90 cm', 'Bicicleta de montaña con cuadro de aluminio y suspensión delantera.', 20, 499.99, 350.00),
(6, 6, 'Teléfono Inteligente Y2', '1', '15x8x1 cm', 'Teléfono inteligente de alta calidad con una pantalla OLED de 6.2 pulgadas.', 80, 699.99, 500.00),
(7, 7, 'Aspiradora Potente Plus', '2', '35x25x20 cm', 'Aspiradora con gran capacidad y potencia para una limpieza profunda.', 40, 199.99, 150.00),
(8, 8, 'Juego de Construcción Creativa XL', '3', '30x30x10 cm', 'Amplio kit de bloques de construcción para horas de diversión.', 150, 49.99, 35.00),
(9, 9, 'Chaqueta de Cuero Clásica', '4', '45x35x15 cm', 'Chaqueta de cuero de estilo clásico y duradero.', 25, 249.99, 180.00),
(10, 1, 'Bicicleta de Montaña Elite', '5', '170x70x100 cm', 'Bicicleta de montaña de alto rendimiento para terrenos difíciles.', 15, 699.99, 500.00),
(11, 1, 'Teléfono Inteligente Z3', '1', '16x8x1 cm', 'Teléfono inteligente de gama media con pantalla LCD de 6.0 pulgadas.', 120, 499.99, 350.00),
(12, 2, 'Aspiradora Compacta', '2', '25x15x10 cm', 'Aspiradora ligera y compacta para espacios pequeños.', 60, 99.99, 70.00),
(13, 3, 'Juego de Construcción Creativa Junior', '3', '20x20x5 cm', 'Kit básico de bloques de construcción para niños pequeños.', 300, 19.99, 15.00),
(14, 4, 'Chaqueta de Cuero Moderna', '4', '40x30x10 cm', 'Chaqueta de cuero con diseño moderno y ajuste cómodo.', 35, 179.99, 130.00),
(15, 5, 'Bicicleta de Montaña Deportiva', '5', '150x50x80 cm', 'Bicicleta de montaña resistente para aventuras al aire libre.', 10, 799.99, 600.00);


-- Inserciones de la tabla oficina 

INSERT INTO oficina (id, nombre) VALUES
(1, 'Oficina principal'),
(2, 'Oficina de ventas'),
(3, 'Oficina de desarrollo'),
(4, 'Oficina de recursos humanos'),
(5, 'Oficina de contabilidad'),
(6, 'Oficina de marketing'),
(7, 'Oficina de soporte técnico'),
(8, 'Oficina de calidad'),
(9, 'Oficina de investigación y desarrollo'),
(10, 'Oficina administrativa');

-- Inserciones de la tabla tipo_direccion 

INSERT INTO tipo_direccion (id, tipo) VALUES
(1, 'Dirección de Entrega'),
(2, 'Dirección de Facturación'),
(3, 'Oficina de Atención al Cliente'),
(4, 'Oficina de Ventas'),
(5, 'Centro de Distribución'),
(6, 'Área de Reclamos'),
(7, 'Sucursal');


-- Inserciones de la tabla direccion_oficina

INSERT INTO direccion_oficina (id, direccion, idOficina, tipo, idCiudad) VALUES
(1, 'Calle 123, Zona Central', 1, 1, 1),
(2, 'Av. Comercial 456, Local 20', 2, 2, 2),
(3, 'Carrera 789, Piso 5', 3, 3, 3),
(4, 'Transversal 246, Edificio 3', 4, 4, 4),
(5, 'Carrera Circular 789, Piso 2', 5, 5, 5),
(6, 'Diagonal 135, Local 10', 6, 6, 6),
(7, 'Autopista Norte, Km 10', 7, 7, 7),
(8, 'Av. de la Calidad 789, Piso 3', 8, 3, 8),
(9, 'Calle de la Innovación 456, Piso 1', 9, 1, 9),
(10, 'Av. Administrativa 123, Local 5', 10, 2, 10);

-- Insertar los datos en la tabla telefono_oficina


INSERT INTO telefono_oficina (id, numero, tipoTelefono, idOficina) VALUES
(1, '+1234567890', 1, 1),
(2, '+541155555555', 2, 2),
(3, '+541188888888', 3, 3),
(4, '+541199999999', 4, 4),
(5, '+541122222222', 5, 5),
(6, '+5491112345678', 1, 6),
(7, '+541141414141', 2, 7),
(8, '+541155555555', 3, 8),
(9, '+541199999999', 4, 9),
(10, '+541133333333', 5, 10);

-- Insertar datos en la tabla cargo 

INSERT INTO cargo (id, tipo, descripcion) VALUES
(1, 'Gerente General', 'Responsable de la gestión general de la empresa.'),
(2, 'Director de Ventas', 'Encargado de dirigir y supervisar el equipo de ventas.'),
(3, 'Jefe de Producción', 'Encargado de coordinar y supervisar la producción.'),
(4, 'Analista de Marketing', 'Responsable de analizar y desarrollar estrategias de marketing.'),
(5, 'Técnico de Soporte', 'Encargado de brindar soporte técnico a los clientes.'),
(6, 'Asistente Administrativo', 'Apoya en tareas administrativas y de oficina.'),
(7, 'Contador', 'Encargado de llevar los registros contables y financieros.'),
(8, 'Ingeniero de Desarrollo', 'Responsable del desarrollo de nuevos productos o proyectos.'),
(9, 'Especialista en Recursos Humanos', 'Encargado de gestionar el reclutamiento y desarrollo del personal.'),
(10, 'Analista de Calidad', 'Responsable de garantizar la calidad de los productos o servicios.'),
(11, 'Coordinador de Logística', 'Encargado de coordinar las actividades logísticas y de transporte.'),
(12, 'Consultor Financiero', 'Asesora en cuestiones financieras y de inversión.'),
(13, 'Diseñador Gráfico', 'Responsable de crear diseños gráficos para fines publicitarios o corporativos.'),
(14, 'Especialista en Seguridad Informática', 'Encargado de proteger la infraestructura y los datos de la empresa.'),
(15, 'Ingeniero de Sistemas', 'Responsable del diseño, desarrollo y mantenimiento de sistemas informáticos.');


-- Inserciones de la tabla empleado

INSERT INTO empleado (id, nombre, apellido1, apellido2, extension, email, codigo_oficina, codigo_jefe, idCargo) 
VALUES
(1, 'Juan', 'García', 'Pérez', '1001', 'juan.garcia@example.com', '1', null, '1'),
(2, 'María', 'López', 'Martínez', '1002', 'maria.lopez@example.com', '2', '1', '2'),
(3, 'Carlos', 'Martínez', 'Gómez', '1003', 'carlos.martinez@example.com', '3', '1', '3'),
(4, 'Laura', 'Sánchez', 'González', '1004', 'laura.sanchez@example.com', '4', '2', '4'),
(5, 'Javier', 'Díaz', 'Fernández', '1005', 'javier.diaz@example.com', '5', '2', '5'),
(6, 'Ana', 'Pérez', 'Sánchez', '1006', 'ana.perez@example.com', '6', '3', '6'),
(7, 'David', 'Gómez', 'Rodríguez', '1007', 'david.gomez@example.com', '7', '3', '7'),
(8, 'Carmen', 'Martínez', 'López', '1008', 'carmen.martinez@example.com', '8', '4', '8'),
(9, 'Pablo', 'Fernández', 'García', '1009', 'pablo.fernandez@example.com', '9', '4', '9'),
(10, 'Sara', 'Rodríguez', 'Pérez', '1010', 'sara.rodriguez@example.com', '10', '5', '10'),
(11, 'Diego', 'López', 'Díaz', '1011', 'diego.lopez@example.com', '1', '5', '11'),
(12, 'Elena', 'García', 'Martínez', '1012', 'elena.garcia@example.com', '2', '6', '12'),
(13, 'Mario', 'Sánchez', 'Fernández', '1013', 'mario.sanchez@example.com', '3', '6', '13'),
(14, 'Isabel', 'Díaz', 'Rodríguez', '1014', 'isabel.diaz@example.com', '4', '7', '14'),
(15, 'Pedro', 'Gómez', 'López', '1015', 'pedro.gomez@example.com', '5', '7', '15'),
(16, 'Luisa', 'Martínez', 'Fernández', '1016', 'luisa.martinez@example.com', '6', '8', '6'),
(17, 'Miguel', 'Fernández', 'Gómez', '1017', 'miguel.fernandez@example.com', '7', '8', '7'),
(18, 'Raquel', 'Gómez', 'Martínez', '1018', 'raquel.gomez@example.com', '8', '1', '8'),
(19, 'Jorge', 'Martínez', 'Sánchez', '1019', 'jorge.martinez@example.com', '9', '1', '9'),
(20, 'Lucía', 'Sánchez', 'Pérez', '1020', 'lucia.sanchez@example.com', '10', '5', '5'),
(21, 'Daniel', 'López', 'Gómez', '1021', 'daniel.lopez@example.com', '1', NULL, '1'),
(22, 'Haymer', 'Fernando', 'Camacho', 1022, 'Fernando.Camacho@example.com', NULL, 21, '2');


-- Insertar datos en la tabla telefono_empleado

INSERT INTO telefono_empleado (id, numero, tipoTelefono, idEmpleado) VALUES
(1, '123456789', 1, 1),
(2, '234567890', 2, 2),
(3, '345678901', 3, 3),
(4, '456789012', 4, 4),
(5, '567890123', 5, 5),
(6, '678901234', 1, 6),
(7, '789012345', 2, 7),
(8, '890123456', 3, 8),
(9, '901234567', 4, 9),
(10, '012345678', 5, 10),
(11, '123456789', 1, 11),
(12, '234567890', 2, 12),
(13, '345678901', 3, 13),
(14, '456789012', 4, 14),
(15, '567890123', 5, 15),
(16, '678901234', 1, 16),
(17, '789012345', 2, 17),
(18, '890123456', 3, 18),
(19, '901234567', 4, 19),
(20, '012345678', 5, 20),
(21, '123456789', 1, 21);


-- Insertar datos en la tabla cliente 

INSERT INTO cliente (id, nombre, apellido1, apellido2, idEmpleadoReporteVentas, limite_credito) VALUES
(1, 'Juan', 'López', 'García', 1, 1000.00),
(2, 'María', 'Martínez', 'Sánchez', 2, 1500.00),
(3, 'Carlos', 'González', 'Fernández', 3, 2000.00),
(4, 'Laura', 'Pérez', 'Díaz', 4, 2500.00),
(5, 'Javier', 'Gómez', 'Martínez', 5, 3000.00),
(6, 'Ana', 'Sánchez', 'López', 6, 3500.00),
(7, 'David', 'Martínez', 'Gómez', 7, 4000.00),
(8, 'Carmen', 'Fernández', 'Sánchez', 8, 4500.00),
(9, 'Pablo', 'Rodríguez', 'Pérez', 9, 5000.00),
(10, 'Sara', 'López', 'Martínez', 10, 5500.00),
(11, 'Luis', 'García', 'Hernández', 11, 6000.00),
(12, 'Elena', 'Pérez', 'Gómez', 12, 6500.00),
(13, 'José', 'Martínez', 'Fernández', 13, 7000.00),
(14, 'Paula', 'Sánchez', 'López', 1, 7500.00),
(15, 'Daniel', 'Gómez', 'Rodríguez', 2, 8000.00),
(16, 'Patricia', 'Fernández', 'Martínez', 3, 8500.00),
(17, 'Roberto', 'López', 'Gómez', 4, 9000.00),
(18, 'Marina', 'Martínez', 'Sánchez', 5, 9500.00),
(19, 'Joaquín', 'Pérez', 'Rodríguez', 6, 10000.00),
(20, 'Cristina', 'Gómez', 'López', 7, 10500.00),
(21, 'Manuel', 'Steven', 'Sánchez', 6, 15000.00),
(22, 'María', 'Steven', 'Sánchez', null, 1000.00),
(23, 'Cristina', 'Martínez', 'Carmen', null, 1200.00);


-- Insertar datos en la tabla contacto 

INSERT INTO contacto (id, nombre_contacto, apellido_contacto, correo, idCliente) VALUES
(1, 'Pedro', 'González', 'pedro@example.com', 1),
(2, 'Ana', 'Martínez', 'ana@example.com', 2),
(3, 'Carlos', 'García', 'carlos@example.com', 3),
(4, 'Laura', 'Sánchez', 'laura@example.com', 4),
(5, 'Javier', 'Rodríguez', 'javier@example.com', 5),
(6, 'Carmen', 'López', 'carmen@example.com', 6),
(7, 'David', 'Fernández', 'david@example.com', 7),
(8, 'Sara', 'Pérez', 'sara@example.com', 8),
(9, 'Pablo', 'Gómez', 'pablo@example.com', 9),
(10, 'María', 'Martínez', 'maria@example.com', 10),
(11, 'Laura', 'Rodríguez', 'laura2@example.com', 11),
(12, 'Javier', 'Gómez', 'javier2@example.com', 12),
(13, 'Carmen', 'Fernández', 'carmen2@example.com', 13),
(14, 'David', 'López', 'david2@example.com', 14),
(15, 'Sara', 'García', 'sara2@example.com', 15),
(16, 'Pablo', 'Martínez', 'pablo2@example.com', 16),
(17, 'Pedro', 'Sánchez', 'pedro2@example.com', 17),
(18, 'Ana', 'Gómez', 'ana2@example.com', 18),
(19, 'Jorge', 'Fernández', 'jorge@example.com', 1),
(20, 'Isabel', 'Díaz', 'isabel@example.com', 2),
(21, 'Roberto', 'García', 'roberto@example.com', 3),
(22, 'Elena', 'Martínez', 'elena@example.com', 4),
(23, 'Diego', 'Pérez', 'diego@example.com', 5),
(24, 'Sofía', 'López', 'sofia@example.com', 6),
(25, 'Manuel', 'Gómez', 'manuel@example.com', 7);


-- Insertar datos en la tabla telefono_contacto

INSERT INTO telefono_contacto (id, numero, tipo, idContacto) 
VALUES
(1, '123456789', 1, 1), -- Teléfono móvil para Pedro González
(2, '234567890', 2, 2), -- Teléfono fijo para Ana Martínez
(3, '345678901', 3, 3), -- Fax para Carlos García
(4, '456789012', 4, 4), -- Teléfono de trabajo para Laura Sánchez
(5, '567890123', 5, 5), -- Teléfono personal para Javier Rodríguez
(6, '678901234', 1, 6), -- Teléfono móvil para Carmen López
(7, '789012345', 2, 7), -- Teléfono fijo para David Fernández
(8, '890123456', 3, 8), -- Fax para Sara Pérez
(9, '901234567', 4, 9), -- Teléfono de trabajo para Pablo Gómez
(10, '012345678', 5, 10), -- Teléfono personal para María Martínez
(11, '123456789', 1, 11), -- Teléfono móvil para Laura Rodríguez
(12, '234567890', 2, 12), -- Teléfono fijo para Javier Gómez
(13, '345678901', 3, 13), -- Fax para Carmen Fernández
(14, '456789012', 4, 14), -- Teléfono de trabajo para David López
(15, '567890123', 5, 15), -- Teléfono personal para Sara García
(16, '678901234', 1, 16), -- Teléfono móvil para Pablo Martínez
(17, '789012345', 2, 17), -- Teléfono fijo para Pedro Sánchez
(18, '890123456', 3, 18), -- Fax para Ana Gómez
(19, '901234567', 4, 19), -- Teléfono de trabajo para Jorge Fernández
(20, '012345678', 5, 20), -- Teléfono personal para Isabel Díaz
(21, '123456789', 1, 21), -- Teléfono móvil para Roberto García
(22, '234567890', 2, 22), -- Teléfono fijo para Elena Martínez
(23, '345678901', 3, 23), -- Fax para Diego Pérez
(24, '456789012', 4, 24), -- Teléfono de trabajo para Sofía López
(25, '567890123', 5, 25); -- Teléfono personal para Manuel Gómez


-- Insertar los datos en la tabla telefono_cliente 
INSERT INTO telefono_cliente (id, numero, tipoTelefono, idCliente) 
VALUES
(1, '123456789', 1, 1),
(2, '234567890', 2, 2),
(3, '345678901', 3, 3),
(4, '456789012', 4, 4),
(5, '567890123', 5, 5),
(6, '678901234', 1, 6),
(7, '789012345', 2, 7),
(8, '890123456', 3, 8),
(9, '901234567', 4, 9),
(10, '012345678', 5, 10),
(11, '123456789', 1, 11),
(12, '234567890', 2, 12),
(13, '345678901', 3, 13),
(14, '456789012', 4, 14),
(15, '567890123', 5, 15),
(16, '678901234', 1, 16),
(17, '789012345', 2, 17),
(18, '890123456', 3, 18),
(19, '901234567', 4, 19),
(20, '012345678', 5, 20);


-- Insertar los datos en la tabla direccion_cliente 

INSERT INTO direccion_cliente (id, direccion, idCliente, tipo, idCiudad)
VALUES
(1, 'Calle A #123', 1, 1, 1),    -- Dirección del cliente 1
(2, 'Avenida B #456', 2, 2, 2),   -- Dirección del cliente 2
(3, 'Carrera C #789', 3, 3, 3),   -- Dirección del cliente 3
(4, 'Calle D #101', 4, 4, 4),     -- Dirección del cliente 4
(5, 'Avenida E #111', 5, 5, 5),   -- Dirección del cliente 5
(6, 'Carrera F #222', 6, 6, 6),   -- Dirección del cliente 6
(7, 'Calle G #333', 7, 7, 7),     -- Dirección del cliente 7
(8, 'Avenida H #444', 8, 1, 8),   -- Dirección del cliente 8
(9, 'Carrera I #555', 9, 2, 9),   -- Dirección del cliente 9
(10, 'Calle J #666', 10, 3, 10),  -- Dirección del cliente 10
(11, 'Avenida K #777', 11, 4, 11),-- Dirección del cliente 11
(12, 'Carrera L #888', 12, 5, 12),-- Dirección del cliente 12
(13, 'Calle M #999', 13, 6, 13),  -- Dirección del cliente 13
(14, 'Avenida N #1010', 14, 7, 14),-- Dirección del cliente 14
(15, 'Carrera O #1111', 15, 1, 15),-- Dirección del cliente 15
(16, 'Calle P #1212', 16, 2, 16), -- Dirección del cliente 16
(17, 'Avenida Q #1313', 17, 3, 17),-- Dirección del cliente 17
(18, 'Carrera R #1414', 18, 4, 1),-- Dirección del cliente 18
(19, 'Calle S #1515', 19, 5, 2),  -- Dirección del cliente 19
(20, 'Avenida T #1616', 20, 6, 3);-- Dirección del cliente 20

-- Insertar los datos en la tabla forma_pago 

INSERT INTO forma_pago (id, tipo) VALUES
(1, 'Efectivo'),
(2, 'Tarjeta de crédito'),
(3, 'Transferencia bancaria'),
(4, 'Cheque'),
(5, 'PayPal'),
(6, 'Criptomoneda'),
(7, 'Pago en línea'),
(8, 'Pago móvil'),
(9, 'Pago por adelantado'),
(10, 'Financiamiento');


-- Insertar los datos en la tabla pago

INSERT INTO pago (id, idCliente, fecha_pago, forma_pago, total) VALUES
('PAG-001', 1, '2024-05-01', 1, 100.50),
('PAG-002', 2, '2024-05-02', 2, 250.75),
('PAG-003', 3, '2024-05-03', 3, 150.25),
('PAG-004', 4, '2024-05-04', 4, 75.00),
('PAG-005', 5, '2024-05-05', 5, 200.00),
('PAG-006', 6, '2024-05-06', 6, 350.25),
('PAG-007', 7, '2024-05-07', 7, 175.75),
('PAG-008', 8, '2024-05-08', 8, 300.00),
('PAG-009', 9, '2024-05-09', 9, 125.50),
('PAG-010', 10, '2024-05-10', 10, 400.75),
('PAG-011', 11, '2024-05-11', 1, 150.25),
('PAG-012', 12, '2024-05-12', 2, 275.00),
('PAG-013', 13, '2024-05-13', 3, 180.25),
('PAG-014', 14, '2024-05-14', 4, 90.00),
('PAG-015', 15, '2024-05-15', 5, 220.50),
('PAG-016', 16, '2024-05-16', 6, 320.75),
('PAG-017', 17, '2024-05-17', 7, 135.25),
('PAG-018', 18, '2024-05-18', 8, 185.00),
('PAG-019', 1, '2024-05-19', 9, 250.25),
('PAG-020', 2, '2024-05-20', 10, 380.00),
('PAG-021', 1, '2008-06-12', 1, 450.25),
('PAG-022', 1, '2008-02-11', 5, 450.25);

-- Insertar los datos en la tabla tipo_estado 

INSERT INTO tipo_estado (id, tipo, descripcion) VALUES
(1, 'En proceso', 'El pedido se encuentra en proceso de preparación y empaquetado.'),
(2, 'Preparando envío', 'El pedido está siendo preparado para su despacho.'),
(3, 'En espera de recolección', 'El pedido ha sido preparado y está esperando ser recogido por el transportista.'),
(4, 'En tránsito', 'El pedido ha sido despachado y se encuentra en proceso de entrega.'),
(5, 'Entregado', 'El pedido ha sido entregado al cliente.'),
(6, 'Retenido en aduana', 'El pedido está siendo retenido en la aduana para procesos de inspección o documentación.'),
(7, 'Devuelto al remitente', 'El pedido ha sido devuelto al remitente debido a problemas de entrega.'),
(8, 'En revisión de calidad', 'El pedido se encuentra en proceso de revisión de calidad antes de su envío.'),
(9, 'Cancelado', 'El pedido ha sido cancelado por el cliente o por la empresa.'),
(10, 'Reembolsado', 'El pedido ha sido reembolsado al cliente debido a problemas de entrega o cancelación.'),
(11, 'Rechazado', 'El pedido ha sido rechazo por el cliente debido por problemas de calidad o entraga.');

-- Insertar los datos en la tabla pedido 

INSERT INTO pedido (id, fecha_pedido, fecha_esperada, fecha_entrega, comentarios, idCliente, idEstado) VALUES
(1, '2024-05-01', '2024-05-10', '2024-05-11', 'Pedido urgente', 1, 1),
(2, '2024-05-02', '2024-05-11', '2024-05-12', NULL, 2, 2),
(3, '2024-05-03', '2024-05-12', '2024-05-13', 'Cliente ha solicitado envío express', 3, 3),
(4, '2024-05-04', '2024-05-13', '2024-05-14', 'Pedido normal', 4, 4),
(5, '2024-05-05', '2024-05-14', '2024-05-15', NULL, 5, 5),
(6, '2024-05-06', '2024-05-15', '2024-05-16', 'Pedido con instrucciones especiales', 6, 6),
(7, '2024-05-07', '2024-05-16', '2024-05-17', 'Cliente ha solicitado envío express', 7, 7),
(8, '2024-05-08', '2024-05-17', '2024-05-18', NULL, 8, 8),
(9, '2024-05-09', '2024-05-18', '2024-05-19', 'Pedido normal', 9, 9),
(10, '2024-05-10', '2024-05-19', '2024-05-20', 'Pedido cancelado por el cliente', 10, 1),
(11, '2024-05-11', '2024-05-20', '2024-05-21', 'Cliente ha solicitado envío express', 11, 2),
(12, '2024-05-12', '2024-05-21', '2024-05-22', NULL, 12, 3),
(13, '2024-05-13', '2024-05-22', '2024-05-23', 'Pedido con instrucciones especiales', 13, 4),
(14, '2024-05-14', '2024-05-23', '2024-05-24', 'Cliente ha solicitado envío express', 14, 5),
(15, '2024-05-15', '2024-05-24', '2024-05-25', NULL, 15, 6),
(16, '2024-05-16', '2024-05-25', '2024-05-26', 'Pedido con instrucciones especiales', 16, 7),
(17, '2024-05-17', '2024-05-26', '2024-05-27', NULL, 17, 8),
(18, '2024-05-18', '2024-05-27', '2024-05-28', 'Cliente ha solicitado envío express', 18, 9),
(19, '2024-05-19', '2024-05-28', '2024-05-29', 'Pedido normal', 19, 1),
(20, '2024-05-20', '2024-05-29', '2024-05-30', 'Pedido cancelado por el cliente', 20, 2),
(21, '2024-05-19', '2024-05-28', '2024-05-23', 'Pedido normal', 19, 1),
(22, '2024-05-19', '2024-05-28', '2024-05-24', 'Pedido normal', 19, 1),
(23, '2024-05-19', '2024-05-28', '2024-05-21', 'Rechazado', 9, 11),
(24, '2024-05-19', '2024-05-28', '2024-05-28', NULL, 5, 11);



-- Insertar los datos en la tabla detalle_pedido 

INSERT INTO detalle_pedido (idPedido, idProducto, cantidad, precio_unidad, numero_linea) VALUES
(1, 1, 2, 799.99, 1),
(1, 3, 5, 29.99, 2),
(1, 7, 1, 199.99, 3),
(2, 2, 1, 149.99, 1),
(2, 4, 2, 199.99, 2),
(2, 8, 2, 49.99, 3),
(3, 3, 10, 29.99, 1),
(3, 9, 1, 249.99, 2),
(4, 5, 1, 499.99, 1),
(4, 10, 2, 699.99, 2),
(5, 6, 3, 699.99, 1),
(5, 11, 1, 499.99, 2),
(6, 7, 2, 199.99, 1),
(7, 8, 4, 49.99, 1),
(8, 9, 1, 249.99, 1),
(9, 10, 2, 699.99, 1),
(10, 1, 1, 799.99, 1),
(11, 2, 2, 149.99, 1),
(12, 3, 3, 29.99, 1),
(13, 4, 4, 199.99, 1),
(14, 5, 1, 499.99, 1),
(15, 6, 2, 699.99, 1),
(16, 1, 1, 799.99, 1),
(17, 2, 2, 149.99, 1),
(18, 3, 3, 29.99, 1),
(19, 4, 4, 199.99, 1),
(20, 5, 1, 499.99, 1),
(1, 11, 1, 499.99, 4),
(2, 12, 3, 99.99, 4),
(3, 13, 4, 19.99, 4);






