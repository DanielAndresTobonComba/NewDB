### Indices ### 

create database indices;
use indices;

CREATE TABLE `customer` (
`id` int DEFAULT NULL,
`first_name` varchar (30) DEFAULT NULL,
`surname` varchar (40) DEFAULT NULL
);


INSERT INTO `customer`
VALUES (1, 'Yvonne', 'Clegg'),
(2, 'Johnny', 'Chaka-Chaka'),
(3, 'Winston', 'Powers'),
(4, 'Patricia', 'Mankuku'),
(5, 'Francois', 'Papo'),
(6, 'Winnie', 'Dlamini'),
(7, 'Neil', 'Beneke');

select * from customer order by surname;

-- Colocar una llave primaria en una tabla ya creada
ALTER TABLE customer ADD PRIMARY KEY(id);

-- Visualizar las carateristicas de una tabla 
DESCRIBE customer;

-- Crear un indice en una tabla creada 
CREATE INDEX [nombre_de_indice] ON nombre_de_tabla (columna1 [,col
umna2...]);


-- Crear una tabla con un indice 
CREATE TABLE usuario (id INT NOT NULL,
apellidos CHAR(30) NOT NULL,
nombre CHAR(30) NOT NULL,
PRIMARY KEY (id),
INDEX indice01 (apellidos, nombre));

DESCRIBE usuario;

SHOW KEYS FROM usuario;

## Creación de un índice de texto completo ## 
-- que es? 
/*
Los índices de texto completo están diseñados para facilitar la búsqueda sobre palabras 
clave en campos de texto de tablas grandes.
*/
CREATE TABLE nombre_de_tabla (
nombre_de_campo1 tipo_de_columna,
nombre_de_campo2 tipo_de_columna,
FULLTEXT INDEX (nombre_de_campol [ , nombre_de_campo2...])
);


-- Para crear un índice de texto completo una vez creada la tabla, utilice la siguiente sintaxis:

CREATE FULLTEXT INDEX nombre_de_indice on nombre_de_tabla nombre_d
e_campol [, nombre_de_campo2.,.]);


## EJEMPLO 3 ##
-- Creamos una tabla con un indice fulltext con los atributos title y body como inices 

CREATE TABLE articles (
id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
title VARCHAR(200),
body TEXT,
FULLTEXT (title, body)
);

DESCRIBE articles;

-- Formas de obtener las llaves e indices de una tabla 
SHOW INDEX FROM articles;
show keys from articles;


## Creación de un índice único ## 

-- Indice que no se puede repetir

-- Para establecer un índice único al crear una tabla, utilice la siguiente sintaxis:
CREATE TABLE nombre_de_tabla (
nombre_de_campo tipo_de_columna,
nombre_de_campo2 tipo_de_columna,
UNIQUE(nombre_de_campo [ , nombre_de_campo2...])
);

-- Si la tabla ya esta creada se usa alguna de las siguientes: 
ALTER TABLE nombre_de_tabla ADD UNIQUE [nombre_de_indice ] (
nombre _de_campo [,nombre_de_campo2 ...);

CREATE UNIQUE INDEX nombre_de_indice ON nombre_de_tabla (nombre_de
_campo [,nombre_de_campo2...]);

## EJ4 ##
CREATE TABLE ui_test(f1 INT, f2 INT, UNIQUE(f1));

describe ui_test;

show keys from ui_test;


### Creación de índices sobre una parte de un campo ###

-- Permite crear un indice sobre una parte de un campo especifico 

ALTER TABLE customer ADD INDEX (surname(10));

SHOW KEYS FROM customer;
describe customer;

## Eliminación o modificación de un índice ## 

-- Para eliminar una clave primaria utilice esta sintaxis:
ALTER TABLE nombre_de_tabla DROP PRIMARY KEY;

/* Para eliminar un índice ordinario, exclusivo o de texto completo, debemos
especificar el nombre del índice, de la siguiente forma: */

ALTER TABLE nombre_de_tabla DROP INDEX nombre_de_indice;

DROP INDEX nombre_de_indice ON nombre_de_tabla;