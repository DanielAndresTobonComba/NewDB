drop database tiendaDia4;
create database tiendaDia4;
use tiendaDia4;

-- Crear la tabla gama_producto
create table gama_producto (
gama varchar(50) primary key,
descripcion_text text,
descripcion_html text,
imagen varchar(256)
);


-- Crear la tabla producto
create table producto (
codigo_producto varchar(15) primary key,
nombre varchar(70) not null,
gama varchar(50),
foreign key (gama) references gama_producto(gama),
dimensiones varchar(25), 
proveedor varchar(50),
descripcion text,
cantidad_en_stock smallint(6) not null,
precio_venta decimal(15,2) not null,
precio_proovedor decimal(15,2)
);

-- Crear la tabla oficina
create table oficina (
codigo_oficina varchar(10) primary key,
ciudad varchar(30) not null,
pais varchar(50) not null,
region varchar(50),
codigo_postal varchar(10) not null,
telefono varchar(20) not null,
linea_dirreccion1 varchar(50) not null,
linea_dirrecion2 varchar(50) 
);

-- Crear la tabla empleado
create table empleado (
codigo_empleado int(11) primary key,
nombre varchar(50) not null,
apellido1 varchar(50) not null,
apellido2 varchar(50), 
extension varchar(10) not null,
email varchar(100) not null,
codigo_oficina varchar(10),
codigo_jefe int(11),
foreign key (codigo_oficina) references oficina(codigo_oficina),
foreign key (codigo_jefe) references empleado(codigo_empleado),
puesto varchar(50)
);

-- Crear la tabla cliente
create table cliente (
codigo_cliente int(11) primary key,
nombre_cliente varchar(50) not null,
nombre_contacto varchar(30),
apellido_contacto varchar(30),
telefono varchar(15) not null,
fax varchar(15) not null,
linea_dirreccion1 varchar(50) not null,
linea_dirreccion2 varchar(50),
ciudad varchar(50) not null,
region varchar(50),
pais varchar(50),
codigo_postal varchar(10),
codigo_empleado_rep_ventas int(11),
foreign key (codigo_empleado_rep_ventas) references empleado (codigo_empleado),
limite_credito decimal(15,2)
);

-- Crear la tabla pago
create table pago (
codigo_cliente int(11),
foreign key (codigo_cliente) references cliente(codigo_cliente ),
forma_pago varchar(40) not null,
id_transaccion varchar(50) primary key,
fecha_pago date not null, 
total decimal (15,2) not null
);

-- Crear la tabla pedido
create table pedido (
codigo_pedido int(11) primary key,
fecha_pedido date not null,
fecha_esperada date not null, 
fecha_entraga date,
estado varchar(15) not null,
comentarios text,
codigo_cliente int(11),
foreign key (codigo_cliente) references cliente (codigo_cliente)
);


-- Crear la tabla detalle_pedido
CREATE TABLE detalle_pedido (
    codigo_pedido INT(11),
    codigo_producto VARCHAR(15),
    cantidad INT(11) NOT NULL,
    precio_unidad DECIMAL(15,2) NOT NULL,
    numero_linea SMALLINT(6) NOT NULL,
    PRIMARY KEY (codigo_pedido, codigo_producto),
    FOREIGN KEY (codigo_pedido) REFERENCES pedido(codigo_pedido),
    FOREIGN KEY (codigo_producto) REFERENCES producto(codigo_producto)
);



-- Consultas sql tipo 1

-- Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
select * from oficina;
select codigo_oficina as CodOficina , ciudad as Ciudad
from oficina;


-- Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
select ciudad , telefono
from oficina 
where pais = 'España';

-- Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
select nombre as Nombre , concat(apellido1 , ' ' , apellido2) as Apellidos , email
from empleado
where codigo_jefe = 7 ;

-- Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
select puesto , nombre ,  concat(apellido1 , ' ' , apellido2) as Apellidos , email
from empleado
where puesto = 'Director General';

-- Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
select puesto , nombre ,  concat(apellido1 , ' ' , apellido2) as Apellidos , email
from empleado
where puesto != 'Representante Ventas';

-- Devuelve un listado con el nombre de los todos los clientes españoles.
select nombre_cliente
from cliente 
where pais = 'Spain';

-- Devuelve un listado con los distintos estados por los que puede pasar un pedido.
select distinct estado from pedido;

select estado from pedido 
group by estado;

/*
Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. 
Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
 */

-- Utilizando la función YEAR de MySQL.
select codigo_cliente from pago 
where year(fecha_pago) = 2008
group by codigo_cliente ;

-- Utilizando la función DATE_FORMAT de MySQL.
SELECT distinct codigo_cliente
FROM pago
WHERE YEAR(fecha_pago) = 2008;

SELECT codigo_cliente
FROM pago
WHERE fecha_pago >= '2008-01-01' AND fecha_pago <= '2008-12-31'
GROUP BY codigo_cliente;


-- Sin utilizar ninguna de las funciones anteriores.
SELECT distinct codigo_cliente
FROM pago
WHERE fecha_pago between'2008-01-01' AND '2008-12-31';

SELECT codigo_cliente
FROM pago
WHERE fecha_pago between'2008-01-01' AND '2008-12-31'
group by codigo_cliente;

/* Devuelve un listado con el código de pedido, código de cliente, fecha esperada y 
fecha de entrega de los pedidos que no han sido entregados a tiempo.*/

select * from pedido;

select codigo_pedido , codigo_cliente , fecha_entraga, fecha_esperada 
from pedido 
where fecha_esperada != fecha_entraga;

/*Devuelve un listado con el código de pedido, código de cliente, fecha esperada y 
fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada. */



-- Utilizando la función DATEDIFF de MySQL.
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entraga
FROM pedido
WHERE fecha_entraga IS NOT NULL
AND DATEDIFF(fecha_esperada, fecha_entraga) >= 2;

-- ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?
select codigo_pedido , codigo_cliente , fecha_entraga, fecha_esperada 
from pedido 
where day(fecha_esperada) - day(fecha_entraga) >= 2 ;

-- Utilizando la función ADDDATE de MySQL.
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entraga
FROM pedido
WHERE fecha_entraga IS NOT NULL
    AND ADDDATE(fecha_entraga, 2) <= fecha_esperada;


-- Devuelve un listado de todos los pedidos que fueron en 2009.

SELECT *
FROM pedido
WHERE fecha_pedido between'2009-01-01' AND '2009-12-31';

select * 
from pedido 
where year(fecha_pedido) = 2009;






