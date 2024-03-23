-- Active: 1710891255909@@127.0.0.1@3306@tienda
-- Active: 1710891255909@@127.0.0.1@3306
CREATE DATABASE tienda;
    DEFAULT CHARACTER SET = 'utf8mb4';

-- SESION 16 

CREATE DATABASE WORLD; 
USE WORLD; 


-- TODOS LOS PAISES QUE EMPIEZAN POR CO

select name 
from country 
where name like 'Co%';

-- TODOS LOS PAISES QUE TERMINAN POR CI 

select name 
from country 
where name like "%cia";


-- COMODIN _ : REPRESENTA UN UNICO CARACTER 
-- La cantidad de _ que se coloque representa un caracter debe ser
-- exacto

select * 
from country 
where name like "F___ce";



/* Que en la mitad del nombre tenga san , pero que no empieze 
y tampoco termine en san 
*/
select * 
from country 
where name like "_%san%";


-- Pais que tenga todas las vocales 

SELECT *
FROM country
WHERE name LIKE '%a%' 
and name LIKE '%e%' 
and name LIKE '%i%' 
and name LIKE '%o%' 
and name LIKE '%u%';

SELECT *
FROM country
WHERE name REGEXP '[aeiou]';




-- Paises con nombres compuestos 
select  *  
from country 
where trim(name) like '% %';


/*Listar los paises que no tengan las 
expresion usa en su nombre 
*/

select * 
from country 
where name not like '%usa%';



-- Listar todos los paises del contienete America 
select * 
from country  
where Continent like 'South America' 
or Continent like 'North America' ;

select * 
from country  
where Continent like '%America' ;

/* 
OPTIMIZACION DE CONSULTAS
*/

SELECT * 
FROM Libros 
where Autor = "Gabriel Garcia Marquez"

/*
 Para optimizar esto se crea un  indice que solo buscara por el indice 
 creado osea por el autor 
*/
CREATE index indx_autor on libros (autor);



/*
INDICES COMPUESTO ADD
*/

SELECT * 
FROM Libros 
where Anio > 2000 and Autor in ('Autor1' , 'Autor2' , 'Autor3');

/*
Se crea un indice compuesto para que busque por el año y el autor 
*/

create index idx_anio_autor on Libros (Anio , Autor);

/* Evitar subconsultas innecesarias */

select nombre 
from Usuarios 
where id_usuarios in (select id_usuarios
                     from Compras); ADD

-- Esto es lo mismo  pero con inner join 

select distinct usuarios.nombre 
from Usuarios 
join Compras on Usuarios.id_usuario = Compras.id_usuario;


/* Caching de consutlas en Mysql */ 


-- Consulta para obtener las ultimas 10 noticias 
select * 
from Noticias 
order by fecha_publicacion desc
limit 10;

-- NoSQL Redis o Mencached 

#psudocodigo en python con uso de cache 
noticias_cacheadas = obtener_de_cache("ultimas noticias"); 

-- si las noticias estan actualizadas las mostrara sino hara una consulta y las mostrara cada cierto periodo de tiempo

if noticias_cacheadas is none : 
    noticias = ejecutar_consulta_sql("select * from Noticias order by fecha_publicacion desclimit 10;")
    guardar_en_cache("ultimas_noticias" , noticias , tiempo_expiracion_db)
else: 
    noticias = noticias_cacheadas






