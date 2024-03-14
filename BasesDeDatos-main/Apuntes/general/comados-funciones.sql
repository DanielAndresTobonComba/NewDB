
-- fUNCIONES Y COMANDOS EN CAMPOS EN MYSQL 
-- 1. CONCAT : Concatena dos o mas cadenas de texto.

use world; 

select concat(name ," ", region) as Ubicacion
from country 
limit 5;


-- 2. UPPER: Convierte  una cadena a mayusculas 
 
select upper(concat(name ," ", region)) as Ubicacion
from country 
limit 5;


-- 3. LOWER Convierte una cadena a minusculas 
select lower(concat(name ," ", region)) as Ubicacion
from country 
limit 5;


-- 4. LENGTH : Devulve una longitud de una cadena 
select lower(concat(name ," ", region)) as Ubicacion, length(concat(name ," ", region)) AS Largo
from country 
limit 5;

-- . Muestre un listado con los tres paises con el nombre mas largo.
select lower(concat(name ," ", region)) as Ubicacion, length(name) AS Largo , region
from country 
order by Largo desc
limit 3;


-- 5. Comando : substring() Extrae una parte de una cadena.  
-- los indices 1 , 3 es desde el primero hasta el tercero 
select substring(concat(name ," ", region), 1 , 3) as Inicial_Ubicacion
from country 
limit 5;

	
-- 6. LOCATE : Encuentra la posicion de una subcadena sino la encuentra devuelve 0 

select substring(concat(name ," ", region), 1 , 3) as Inicial_Ubicacion, 
	   locate("g", substring(concat(name, " " , region) , 1 , 3)) as Pos_G
from country 
limit 5;



-- 7. Quita los espacios al principio y al final 
select TRIM(substring(name , 1 , locate(" ", name ))) as Primer_nombre ,
	name as pais,
    locate(" " , name ) as compuesto 
    
from country 
where locate(" " , name ) > 0 
order by pais; 

-- 8 REPLACE : Reemplaza una subcadena por otra 
select name, replace(name, "Gu" , "YU" ) as Remplazo 
from country
where region = "South America";

-- 9 format: dar formato a un numero 
select format (1253.12 , 2) ;

-- 10 repeat: repetir una cadena cierta cantidad de veces 
select repeat ("hola " , 3);

-- 11 insert , inserta una cadena dentro de una subacadena en una posicion especifica el primer desde donde y el segundo paramatro es para saber cuantos caracteres 
-- reemplazara 
select insert ("Hola mundo " , 5 , 2 , " mi");

-- 12 mid : retorna una subacadena de una cadena 
select mid("hola mundo" , 1 , 4 ); -- devuelve mundo 

-- 13  lpad : rellana a la izquirda con un caracter especifico 
select lpad ("mysql" , 10 , "*");

-- 14 count: cuenta cuantos registros hay 
select count(*) from country;

-- 15 sum : suma todo una columna donde sean valores numericos 
select format(sum(population), 0) as Poblacion_Total from country;

-- 16 avg : promedio de una columna numerica 
select format(avg(population) , 0) as Promedio_habitantes_por_pais from country;

-- 17 max valor maximo de una tabla 
select max(lifeexpectancy) from country;

-- 18 min valor minimo de una tabla
select min(lifeexpectancy) from country;

-- 19 date_format : formatea una fecha de acuerdo con el formato especificado

-- 20 now : devuelve la fecha y la hora actuales 
select date_format (now() , "%d/%m/%Y") as fecha_actual;
 (current_date);

-- 21 round : redondea un numero y el numero es el decimal a redondear 
select format( round(avg(population) , 3) , 1)as Promedio_habitantes_por_pais from country;

-- 22 ifnull : devuleve un campo alternativo si el campo no es nulo 
select ifnull;