
-- EJERCICIO 
-- CREAR UNA TABLA TEMPORAL LLAMADA  EMPLEADOS_DEPARTAMENTOS_X 	LA CUAL OBTENDRA LA INFORMACION DE LOS EMPLEADOS (NOMBRE Y SALARIO) DE LA TABLA EMPLEADOS.
-- ESTOS EMPLEADOS TRABAJAN EN LE DEPARTAMENTO X Y GANAN MAS DE $1.200.000.

CREATE TABLE empleados_departamentos_x 
select emp.nombre , emp.empleados , emp.salarios
from empleados as emp
where salario > 1200000 and departamento = "departamento_x" ; 


-- Ejercio-2 
-- Crear una nueva tabla llamada temp pais que contenga columnas "nombre" y "poblacion" . seleccionando los registro de la tabla "country#" 
-- donde la poblacion sea igual o inferios a 100 millones . La tabla se encuntra en la base de datos world 

create table tempPais ; 
select C.name as Nombre, C.population as Población
from country as C 
where population <= 1000000;
select * from tempPais order by population desc;

desc country; -- describe <nombre de la tabla>

select * from country;

select nombre , population from country;




-- Construya un listado con los primeros nombres de lo paises con nombres compuesto. Ordenen el listado por nombre del pais.

select  substring(name , 1 , locate(" " , name )) as Primer_nombre , name as Pais , locate(" " , name) as compuesto
from country 
where locate(" ", name) 	
order by pais ;


-- Mostrar el listado de los paises en donde se puede hacer el reemplazo 
select name, replace(name, "Gu" , "YU" ) as Remplazo 
from country
where region = "South America" and locate("YU", replace(name, "Gu" , "YU"));




-- EJERCICIO 1
CREATE SCHEMA Ejercicios;
use Ejercicios;

create table pais (
	id int primary key, 
    nombre varchar(20), 
    continente varchar(50), 
    poblacion int 
);

create table ciudad (
	id int primary key,
    nombre varchar(20),
    id_pais int, 
    foreign key (id_pais) references pais(id)
);

create table idioma (
	id int primary key, 
    idioma varchar(50)
);

create table idioma_pais(
	id_idioma int, 
    id_pais int ,
    es_oficial tinyint(1),
    primary key (id_idioma , id_pais),
	foreign key (id_idioma) references idioma(id) , 
    foreign key (id_pais) references pais(id)
);

desc idioma_pais;
drop table idioma_pais;