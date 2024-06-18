-- SESION 8 
-- CONSULTAS AVANZADAS 


-- FUNCIONES DE AGREGACION 

/*
COUNT(*) :Cuenta el numero de filas que tiene el resultado de la 
consulta

COUNT(COLUMNA): Cuenta los valore no nulos que hay en esa columna 
*/

/*
count (Distinct columna) contar valores distintos 

GROUP BY : Agrupar los valores identicos de una tabla dando una
sola fila por cada uno. 
*/


-- EJERCICIO 

drop schema if exists MI_PRIMERA_DB ; 
CREATE SCHEMA IF NOT EXISTS MI_PRIMERA_DB  ;

USE MI_PRIMERA_DB;


CREATE table if not exists coches (
	id int(11) not null auto_increment, 
    marca varchar(45) not null, 
    modelo varchar(45) not null, 
    kilometros int(11) not null, 
    primary key (id)
    

);

ALTER TABLE Persons AUTO_INCREMENT=10;


insert into coches (Marca , Modelo , Kilometros)
values ( "Renault" , "Clio" ,  10 ),
		( "Renault" , "Megane" ,  23000 ),
         ("Seat" , "Ibiza" ,  9000 ),
          ("Seat" , "Leon" ,  20 ),
           ("Opel" , "Corsa" ,  999 ),
            ("Renault" , "Clio" ,  34000 ),
             ("Seat" , "Ibizo" ,  2000 ), 
              ("Seat" , "Cordoba" ,  99999 ),
               ("Renault" , "Clio" ,  88888 );
             
-- Traer las marcas de todos los coches
select Marca
from coches 
group by Marca;


-- Tomar las marcas con su respectivo modelos 

select Marca , Modelo 
from coches 
group by Marca , Modelo;

-- Cuente cuantos vehiculos tiene cada carro
select Marca , count(*) as contador 
from coches 
group by Marca 
order by contador desc;


-- Cuente los kilometros de cada marca 
select Marca , format( sum(Kilometros) , 0)
from coches 
group by Marca;


-- Seleccione el kiloetraje mas alto de cada marca 
select Marca , format( MAX(Kilometros) , 0 )
from coches 
group by Marca;

-- Seleccione el kiloetraje mas bajo de cada marca 
select Marca , format( MIN(Kilometros) , 0 )
from coches 
group by Marca;



-- HAVING : Condicion de agrupacion del group by 








