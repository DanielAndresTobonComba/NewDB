create database mundo ; 

use mundo; 

create TABLE IF NOT EXISTS pais (
	id int ,
    nombre varchar(20), 
    continente varchar(50), 
    población int
);

CREATE TABLE Temp (
	id integer, 
    dato varchar(20)
);

-- eliminar una tabla 
drop table Temp;

-- alterar un atributo de una tabla 
ALTER TABLE pais add primary key(id);

-- obtener una describicion de la tabla 
describe pais; 

-- insertar datos a una tabla especifica primero las columnas segundo los valores 
INSERT INTO pais (id , nombre , continente , población) 
values (103 , "Guyana" , NULL , NULL );




-- borrar una fila especifica o varias 
delete from pais where id=102 or id=103 ;

INSERT INTO pais (id , nombre , continente , población)
values (102 , "Ecuador" , "Sur America"  , 17000000  );

INSERT INTO pais (id , nombre , continente , población)
values (103 , "Guatemala" , "Centro America"  , 17000000  );


-- Insertar varias lineas a las vez 
INSERT INTO pais (id, nombre , continente , población)
values (104 , "Mexico" , "Centro America"  , 126000000  ),
	   (105 , "Estados Unidos" , "Norte America"  , 331000000  ), 
	   (106 , "Canada" , "Norte America"  , 380000000  );
       


-- Actualizar Datos 

/* Sintaxis para actualizar

nonbre_tabla 
set columa1 = valor1 , columna2 = valor2 
where condition 

*/

update pais 
set poblacion = 50887423 
where id = 101;


-- Seleccionar datos especificos de una tabla 
select nombre, población from pais;
create table temp as select nombre, población from pais; 
select id from temp;


select * from pais;

-- Crear una tabla temperal con los datos de pais 
create table temp as select * from pais;
drop table temp; 


 -- Borrado de datos DML 

 /*Sintaxis de borrado de datos 
 
	DELETE FROM nombre_tabla 
    WHERE  condition
    
    
    Borrar una cantidad exacta de registros 
    
    DELETE FROM nombre_tabla 
    WHERE  condition
    LIMIT cantidad_de_registros;
    
 */
 
-- creo una tabla temporal 
create table tpais as select * from pais;
select * from tpais;

-- forma segura pero no recomendada el sql no deja 
 delete from tpais;
 
 -- forma insegura y se borra por completo no se puede recuperar 
 truncate table tpais;
 


-- ELiminar una fila/registro en concreto 
select * from  pais;
delete from pais where id=106;


-- DQL : select 

/* 
SELECT nombre_de_los_campos 
FROM nombre_tabla 
WHERE condition_para_ser_selecionado;
*/

-- mostrar listado con todos los paises de la tabla "pais" 

SELECT nombre
FROM pais;

-- mostrar un listado con todos los paises de la tabla pais ordenado alfabeticamente ascendentemente
SELECT nombre 
from pais 
order by nombre;

-- mostrar el pais con mayor poblacion 
select nombre , población 
from pais 
order by población desc -- ordeno por poblacion
limit 1; -- solo muestro el primero 

-- mostrar un listado con todos los paises de la tabla pais ordenado alfabeticamente descendentemente (z-a) 
SELECT nombre 
from pais 
order by nombre desc ;


-- Alias de campos 
-- Modifico el nombre de un campo por terminos esteticos 
select nombre as País , población as Población
from pais 
order by población desc 
limit 1; 


-- ALIAS DE TABLAS 
-- para evitar cambiar los alias de los campos de varias tablas si solo se desea en una 

select P.nombre as País , P.población as Población
from pais as P -- se da un alias a una tabla 
order by población desc  
limit 1; 


/* Operadores de comparacion en el where  
mismo que ya conosco 
<> señala una diferencia */

-- Ejercicios 

-- Mostrar el listado de los paises ordenados alfabeticamente con poblacion menor a 100 millones 

select nombre, población from pais 
where población < 100000000
order by nombre;

-- Mostrar el listado de los dos paises con menor poblacion ordenados por la poblacion descendentemente y el nombre del pais ascendentemente 
select nombre , población 
from pais 
order by población asc , nombre asc 
limit 3 ; 


create database world ; 



 