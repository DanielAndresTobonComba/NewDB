-- mysql -h localhost -u campus2023 -p Taller < ./script.sql
drop database if exists Taller;
create database Taller; 
use Taller;

CREATE TABLE Pais (
	id INT PRIMARY KEY ,
	nombre varchar(100) NOT NULL unique
	
);

CREATE TABLE Region (
	id INT PRIMARY KEY ,
	nombre varchar(100) NOT NULL,
	idPais INT,
	foreign key (idPais) references Pais (id)
);

CREATE TABLE Ciudad (
	id INT PRIMARY KEY,
	nombre varchar(100) NOT NULL,
	idRegion INT not null,
	foreign key (idRegion) references Region (id)
);


CREATE TABLE Taller (

	id int primary key ,
	nombre varchar(50) not null,
	idCiudad int,
	foreign key (idCiudad) references Ciudad (id)
);


create table Cargo (
	id int primary key,
	nombre varchar(50) not null,
	descripcion text not null  
);

create table tipo_documento (
	id int primary key,
	nombre varchar(50)
	
);

create table Proveedor (
	id int primary key,
	nombre varchar(75),
	nombre_contacto varchar(50), 
	apellido_contacto varchar(50),
	email varchar(50),
	idTipoDocumento int,
	Foreign Key (idTipoDocumento) REFERENCES tipo_documento(id)
);

CREATE TABLE Empleado (
	id int primary key not null,
	idTipoDocumento int,
	idTaller int,
	primerNombre varchar(50) not null,
	segundoNombre varchar(50) not null,
	primerApellido varchar(50) not null,
	idCargo int,
	foreign key (idTaller) references Taller (id),
	foreign key (idCargo) references Cargo (id),
	foreign key (idTipoDocumento) references  tipo_documento(id)

);


create table Tipo_telefono (
	id int primary key,
	tipo varchar(25)
);


create table Telefono_empleado (
	idEmpleado int ,
	numero varchar(25),
	tipo int,
	foreign key (idEmpleado) references Empleado(id),
	foreign key (tipo) references Tipo_telefono (id)

);



create table Cliente (
	id int primary key, 
	identificacion varchar(50) not null,
	nombre varchar(50) not null,
	apellido varchar(50) not null, 
	direccion varchar(50),
	email varchar(50),
	idTipoDocumento int,
	idTaller int,
	foreign key (idTaller) references Taller(id),
	foreign key (idTipoDocumento) references tipo_documento(id) 
	
);




create table telefono_cliente (
	idCliente int not null,
	numero varchar(25),
	tipo int,
	foreign key (idCliente) references Cliente(id),
	foreign key (tipo) references Tipo_telefono (id)
);

create table Marca_vehiculo (
	id int primary key,
	nombre varchar(25) not null unique
);

create table Vehiculo (
	id int primary key,
	placa varchar(10) not null unique,
	modelo varchar(15) not null,
	año year not null,
	idCliente int,
	idMarca int,
    kilometraje int,
	foreign key (idMarca) references Marca_vehiculo(id),
	foreign key (idCliente) references Cliente(id)
); 

create table Zona (
	id int primary key,
	nombre varchar(50)
);

create table Zona_taller (
	idTaller int not null,
	idZona int not null,
	foreign key (idZona) references Zona(id),
	foreign key (idTaller) references Taller(id)
);


create table Servicio (
	id int primary key,
	nombre varchar(50),
	descripcion text null,
	idZona int,
	costoBase decimal(12,2) DEFAULT 0.00,
	foreign key (idZona) references Zona(id)	
);





create table Cita (
	id int primary key,
	hora DATETIME not null,
	idCliente int,
	idTaller int,
	foreign key (idCliente) references Cliente(id),
	foreign key (idTaller) references Taller(id)
);

create table Cita_vehiculo (
	idVehiculo int,
	idCita int,
	descripcion text,
	foreign key (idVehiculo) references Vehiculo(id),
	foreign key (idCita) references Cita(id)

);


create table Reparacion (
	id int primary key,
	idVehiculo int,
	costoTotal decimal(12,2),
	foreign key (idVehiculo) references Vehiculo(id)
			
);






create table Telefono_proveedor (
	id int primary key,
	idProveedor int,
	numero varchar(15) not null,
	tipo int,
	foreign key (tipo) references Tipo_telefono(id),
	foreign key (idProveedor) references Proveedor(id)
);


create table Orden_compra (
	id int primary key,
	fecha DATE not null,
	idProveedor int,
	idEmpleado int,
	total decimal(12,2) DEFAULT 0.00,
	foreign key (idProveedor) references Proveedor(id),
	foreign key (idEmpleado) references Empleado(id)
);

create table Marca_pieza (
	id int primary key,
	nombre varchar(50)
);


create table Pieza (
	id int primary key,
	nombre varchar(50) not null,
	descripcion text
);

create table Orden_detalle (
	idOrdenCompra int,
	idPieza int,
	cantidad int,
	idMarca int,
	precioUnidad decimal(12,2),
	foreign key (idOrdenCompra) references Orden_compra(id),
	foreign key (idMarca) references Marca_pieza(id),
	foreign key (idPieza) references Pieza(id)
);

create table Inventario (
	id int primary key,
	piezaId int,
	idZona int,
	cantidad int,
	foreign key (piezaId) references Pieza(id),
	foreign key (idZona) references Zona(id)
);

create table Inventario_taller (
	idInventario int,
	idTaller int,
	cantidad int,
    stockInicial int,
	foreign key (idInventario) references Inventario(id),
	foreign key (idTaller) references Taller(id)
);

create table Reparacion_servicio (
	id int primary key,
	idServicio int,
	idReparacion int,
	fechaInicio date not null,
	fechaFin date not null,
	idPieza int,
	cantidadPiezas int,
	descripcion text not null,
	costo decimal(12,2) DEFAULT 0.00,
	foreign key (idPieza) references Pieza(id),
	foreign key (idReparacion) references Reparacion(id),
	foreign key (idServicio) references Servicio(id)
);


create table Reparacion_empleado (
	idReparacion int,
	idEmpleado int,
	horasTrabajadas int,
	foreign key (idReparacion) references Reparacion_servicio(id),
	foreign key (idEmpleado) references Empleado(id)
);

create table Factura (
	id int primary key,
	fecha DATE not null,
	idReparacion int,
	idCliente int,
	impuesto int,
	total decimal(12,2) DEFAULT 0.00,
	foreign key (idReparacion) references Reparacion(id),
	foreign key (idCliente) references Cliente (id)
	
);


/*
create table Factura_detalle (
	--id int primary key,
	--facturaID int,
	--clienteID int,
	--fecha DATE not null, 
	total decimal(12,2),
	foreign key (facturaID) references Facturacion(id),
	foreign key (clienteID) references Cliente(id)
);
*/


















