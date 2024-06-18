
Mostrar bases de datos 
show databases; 

Devuelve
+--------------------+
| Database           |
+--------------------+
| GreenGardenDB      |
| MVE                |
| ejercicio          |
| gestorEmpleados    |
| information_schema |
| mysql              |
| performance_schema |
| sakilacampus       |
| sys                |
| universidad        |
+--------------------+
10 rows in set (0,00 sec)

## Seleccionar base de datos 

use [Nombre]; 

## Crear una base de datos
create database [Nombre]
create database inventario;


## Crear una tabla 

CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);

CREATE TABLE pais (
    id INT AUTO_INCREMENT,
    nombre varchar(50),
    CONSTRAINT pk_pais PRIMARY KEY (id)
    
);

/* Es recomendable colocar la longitud de la llave forenea 
para que no mande un error dependiendo del sistema de gestor
*/

CREATE TABLE pais (
    id INT AUTO_INCREMENT,
    nombre varchar(50),
    CONSTRAINT pk_pais PRIMARY KEY (id)
    
);

CREATE TABLE region(
    id INT AUTO_INCREMENT,
    nombre varchar(50),
    fkidpais INT(11),
    CONSTRAINT pk_region_id PRIMARY KEY (id),
    CONSTRAINT fk_pais_region_id FOREIGN KEY (fkidpais) REFERENCES pais(id)
);


CREATE TABLE ciudad(
    id INT AUTO_INCREMENT,
    nombre varchar(50),
    fkregion INT(11),
    CONSTRAINT pk_ciudad_id PRIMARY KEY (id),
    CONSTRAINT fk_ciudad_region_id FOREIGN KEY (fkregion) REFERENCES region(id)
);


## Mostrar los datos de una tabla 
DESCRIBE [Nombre]
DESCRIBE cciudad

## Insertar datos en la tabla pais 

INSERT INTO pais (nombre)
VALUES ('Colombia'),
	('Peru'),
	('Usa');
	
INSERT INTO region (nombre , fkidpais)
VALUES ('Caribe',1),
	('Pacifico',1),
	('Orinoquia',1),
	('Costera',2),
	('La montaña',2),
	('Selva',2),
	('Sudeste',3),
	('Suroeste',3),
	('Oeste',3);

INSERT INTO ciudad (nombre , fkregion)
values ('Cartagena' , 1),
	('Barranquilla',1),
	('Montería',1),
	('Buenaventura',2),
	('Quibdó',2),
	('Tumaco',2),
	('Arauca',3),
	('Villavicencio',3),
	('Vichada',3),
	('Oeste',3),
	('Lima',4),
	('Callao',4),
	('Ica',4),
	('Cajamarca',5),
	('Cusco',5),
	('Juliaca',5),
	('Bagua',6),
	('Chanchamayo',6),
	('Bagua',6),
	('Atlanta',7),
	('Miami',7),
	('Charlotte',7),
	('Nevada',8),
	('Phoenix',8),
	('Dallas',8),
	('Seattle',9),
	('San Francisco',9),
	('Los Ángeles',9);


SELECT 
FROM 
WHERE 


SELECT p.id AS Cod , p.nombre AS Pais , r.nombre as Region
FROM pais AS p , region AS r 
WHERE p.id = r.fkidpais; 

SELECT p.id AS Cod , p.nombre AS Pais , r.nombre as Region
FROM pais AS p 
join region AS r ON p.id = r.fkidpais; 


SELECT p.id AS Cod , p.nombre AS Pais , r.nombre as Region
FROM pais AS p 
left join region AS r ON p.id = r.fkidpais; 


## Operadores logicos AND OR NOT 
Comp > < >= <= <> LIKE BETWEEN 
LIKE '%V%' Encuentra cualquier valor que tenga la V.
LIKE '%V' Cualquier valor que termine en V.
LIKE 'V%'Cualquier valor que comience en V.

## Eliminar un registro de un pais
delete from pais where id = 4;

## Modificar el campo de un registro con su respectiva id. 
update pais 
set nombre = 'Estados Unidos'
where id = 3;

## Regiones de colombia cuyo nombre inicie con a 
select r.nombre 
from pais as p , region as r
where p.id = r.fkidpais and r.fkidpais = 1 and r.nombre like 'c%' or 'c%';


## Regiones de colombia que contengan la a 
select r.nombre 
from pais as p , region as r
where p.id = r.fkidpais and r.fkidpais = 1 and r.nombre like '%a%' or '%a%';

### Regiones de colombia que finalizen con la letra a 
select r.nombre 
from pais as p , region as r
where p.id = r.fkidpais and r.fkidpais = 1 and r.nombre like '%a' or '%a';














	



