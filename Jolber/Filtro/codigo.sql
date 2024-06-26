
drop database if exists filtro;
Create database filtro;
use filtro;

Create table Cliente (
	id int primary key auto_increment,
	nombre varchar(100),
	correo_electronico varchar(100),
	telefono varchar(15),
	fecha_registro date
);

Create table Pedido (
	id int primary key auto_increment,
	id_cliente int,
	fecha date,
	total decimal(10,2),
	foreign key (id_cliente) references Cliente (id)
);

Create table Menu (
	id int Primary key auto_increment,
	nombre varchar(100),
	descripcion text,
	precio decimal(10,2)
	
);

Create table DetallePedido(
	id_pedido int,
	id_menu int ,
	cantidad int,
	precio_unitario decimal(10,2),
	foreign key (id_pedido) references Pedido(id),
	foreign key (id_menu) references Menu(id)
);

INSERT INTO Cliente (nombre, correo_electronico, telefono, fecha_registro) VALUES
('Juan Perez', 'juan.perez@example.com', '123-456-7890', '2024-01-01'),
('Maria Lopez', 'maria.lopez@example.com', '123-456-7891', '2024-01-05'),
('Carlos Mendoza', 'carlos.mendoza@example.com', '123-456-7892', '2024-02-10'),
('Ana González', 'ana.gonzalez@example.com', '123-456-7893', '2024-02-20'),
('Luis Torres', 'luis.torres@example.com', '123-456-7894', '2024-03-05'),
('Laura Rivera', 'laura.rivera@example.com', '123-456-7895', '2024-03-15'),
('Fernando García', 'fernando.garcia@example.com', '123-456-7896', '2024-04-20'),
('Isabel Fernández', 'isabel.fernandez@example.com', '123-456-7897', '2024-04-25'),
('Ricardo Morales', 'ricardo.morales@example.com', '123-456-7898', '2024-05-01'),
('Lucía Martínez', 'lucia.martinez@example.com', '123-456-7899', '2024-05-05'),
('Santiago Jiménez', 'santiago.jimenez@example.com', '123-456-7900', '2024-05-10'),
('Patricia Romero', 'patricia.romero@example.com', '123-456-7901', '2024-05-15');

INSERT INTO Menu (nombre, descripcion, precio) VALUES
('Ensalada César', 'Ensalada con lechuga romana, crutones y aderezo César', 12.50),
('Sopa de Tomate', 'Sopa cremosa de tomate con albahaca', 8.75),
('Filete de Res', 'Filete de res a la parrilla con papas y vegetales', 25.00),
('Pasta Alfredo', 'Pasta con salsa Alfredo y pollo', 15.00),
('Tarta de Queso', 'Tarta de queso con salsa de frambuesa', 7.50),
('Café Americano', 'Café americano recién preparado', 3.00);

INSERT INTO Pedido (id_cliente, fecha, total) VALUES
(1, '2024-05-15', 40.00),
(1, '2024-06-01', 25.50),
(2, '2024-05-20', 35.75),
(2, '2024-06-05', 48.00),
(3, '2024-06-10', 55.00),
(4, '2024-05-30', 32.75),
(4, '2024-06-15', 28.25),
(5, '2024-06-20', 45.00),
(6, '2024-05-25', 22.50),
(6, '2024-06-10', 33.75),
(7, '2024-05-15', 50.50),
(7, '2024-06-25', 47.00),
(8, '2024-05-20', 44.75),
(8, '2024-06-30', 39.50),
(9, '2024-05-25', 41.00),
(10, '2024-06-04', 55.75),
(11, '2024-06-09', 52.00),
(12, '2024-06-15', 46.25);


INSERT INTO DetallePedido (id_pedido, id_menu, cantidad, precio_unitario)
VALUES
(1, 1, 1, 12.50),
(1, 6, 3, 3.00),
(1, 3, 1, 25.00),
(2, 2, 1, 8.75),
(2, 4, 1, 15.00),
(2, 5, 1, 7.50),
(3, 1, 1, 12.50),
(3, 4, 1, 15.00),
(3, 6, 2, 3.00),
(4, 3, 1, 25.00),
(4, 6, 1, 3.00),
(5, 1, 2, 12.50),
(5, 5, 2, 7.50),
(6, 6, 3, 3.00),
(6, 2, 1, 8.75),
(7, 1, 2, 12.50),
(7, 4, 1, 15.00),
(8, 2, 1, 8.75),
(8, 5, 2, 7.50),
(9, 3, 1, 25.00),
(9, 6, 3, 3.00),
(10, 3, 1, 25.00),
(10, 1, 1, 12.50),
(11, 5, 1, 7.50),
(11, 4, 1, 15.00),
(11, 2, 1, 8.75),
(12, 2, 1, 8.75),
(12, 4, 1, 15.00),
(12, 5, 1, 7.50),
(13, 1, 2, 12.50),
(13, 4, 1, 15.00),
(14, 2, 1, 8.75),
(14, 5, 2, 7.50),
(15, 3, 1, 25.00),
(15, 6, 3, 3.00),
(16, 1, 1, 12.50),
(16, 3, 1, 25.00),
(17, 4, 1, 15.00),
(17, 5, 1, 7.50),
(17, 6, 2, 3.00),
(18, 2, 1, 8.75),
(18, 4, 1, 15.00),
(18, 5, 1, 7.50);
