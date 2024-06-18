-- ################# --
-- ## Ejercicio ## --
-- ################--
-- Creado por Daniel Andres Tobon Comba
-- Creacion de la base datos Dia-4
CREATE database Dia_4;
-- Usar la base de datos Dia-4
use Dia_4;
-- Crear la tabla pais
create table pais (
id int primary key,
nombre varchar(20),
continente varchar(50),
poblacion int
);
-- Crear la tabla ciudad
create table ciudad (
id int primary key,
nombre varchar(20),
id_pais int,
foreign key (id_pais) references pais (id)
);
-- Crear la tabla idioma
create table idioma (
id int primary key,
idioma varchar(50)
);
-- Crear la tabla idioma_pais
create table idiomas_pais (
id_idioma int,
id_pais int,
es_oficial tinyint(1),
foreign key (id_idioma) references idioma (id),
foreign key (id_pais) references pais (id)
);
show tables;
-- MODIFICAR UNA DATOS DE UN REGISTRO EN ESPECIFICO
update pais
set continente = 'Norte America'
where continente = 'Norte Amercia';
	
-- Insertar datos en la tabla pais
insert into pais
values (1 , 'Colombia', 'Sur America' , 50000000),
(2 , 'Venezuela' , 'Sur America' , 45000000),
(3 , 'Estados Unidos' , 'Norte Amercia' , 333000000),
(4 , 'El salvador' , 'Centro America' , 5000000),
(5 , 'Haiti' , 'Centro America' , 11050000),
(6 , 'Canada' , 'Norte America' , 38930000),
(7 , 'Belice' , 'Centro America' , 405000),
(8 , 'Honduras' , 'Centro America' , 10430000),
(9 , 'Guyana' , 'Sur America' , 808000),
(10 , 'Ecuador' , 'Sur America' , 18000000);
-- Insertar datos en la tabla ciudad
insert into ciudad
values(1 , 'Bucaramanga' , 1),
(2 , 'Caracas', 2),
(3 , 'New York', 3),
(4 , 'Puerto Principe', 5),
(5 , 'Tegucigalpa', 8),
(6 , 'Otawa', 6),
(7 , 'Quito', 10),
(8 , 'Belmopan', 7),
(9 , 'Bogota', 1),
(10 , 'Georgetown', 9);
-- Insertar datos en la tabla idioma
insert into idioma
values (1 , 'Español'),
(3 , 'Frances'),
(2 , 'Ingles'),
(4 , 'Nasa Yuwe'),
(5 , 'Sáliba-Piaroa'),
(6 , 'Záparo'),
(7 , 'Tetete'),
(8 , 'Locono wareca'),
(9 , 'Pemón'),
(10 , 'Nahuatl');

-- Insertar datos en la tabla idioma_pais
insert into idiomas_pais
values(1 , 1 ,1),
(1 , 3 ,1),
(1 , 6 ,1),
(1 , 1 ,1),
(4 , 10 ,0),
(1 , 1 ,1),
(2 , 3 ,1),
(4, 3 ,0),
(7 , 1 ,1),
(8 , 1 ,1),
(9 , 1 ,1),
(10 , 1 ,1);
select * from idioma ;
select * from idiomas_pais;
select * from pais;

-- Contar los idiomas que habla cada pais
select p.nombre , count(*) as NumIdiomas
from pais as p , idiomas_pais as ip
where p.id = ip.id_pais and ip.es_oficial = 1
group by p.nombre ;

-- Seleccionar el pais que tiene mayor poblacion
SELECT p.nombre, p.poblacion
FROM pais AS p
WHERE p.poblacion = (SELECT MAX(poblacion) FROM pais);

-- Sumar la poblacion de los paises de cada continente
select p.continente as Continente , sum(p.poblacion) as PoblacionTotal
from pais as p
group by p.continente
order by PoblacionTotal desc;

-- Consultas del profesor 
select p.nombre , c.nombre 
from pais as p, ciudad as c 
where p.id = c.id_pais;

-- inner , right , join , full join
select pais.nombre as NombrePais , ciudad.nombre as NombreCiudad
from pais inner join ciudad
on pais.id = ciudad.id_pais;

select pais.nombre as NombrePais , ciudad.nombre as NombreCiudad
from pais left join ciudad
on pais.id = ciudad.id_pais;

select pais.nombre as NombrePais , ciudad.nombre as NombreCiudad
from pais right| join ciudad
on pais.id = ciudad.id_pais;