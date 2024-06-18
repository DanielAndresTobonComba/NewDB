-- CONSULTAS WORLD 

use world;

select * from country;

select * from city;

select * from countrylanguage;

select * from countrylanguage as cl 
left join country as a on a.code = cl.countrycode
where isofficial = "T" and a.continent = "Africa";

-- mostrar las ciudades de colombia

select a.name , c.countrycode , c.name
from country as a
right join city as c on a.code = c.countrycode 
where a.name = "Colombia";


-- mostrar las cinco ciudades mas pobladas de cada continenete y ordenar por continente y luego por ciudades
-- ESTA EN LA CARPETA UNION- UNION



-- MOSTRAR TODOS LOS PAISES DE AFRICA Y SUS IDIOMAS OFICIALES , ORDENE EL LISTADO POR NOMBRE DEL IDIOMA 

select a.name , cl.language , cl.isofficial
from country as a 
right join countrylanguage as cl on  a.code = cl.countrycode 
where cl.isofficial = "T" and a.continent = "Africa" 
order by cl.language asc;


-- MOSTRAR TODOS LOS IDIOMAS NO OFICIALES HABLADOS EN SANTANDER COLOMBIA 


select c.name as pais , ct.name as ciudad , c.code as cod_pais , cl.language as lenguaje , cl.isofficial as oficial
from city as ct , country as c 
inner join countrylanguage as cl on cl.countrycode = c.code
where ct.name = "Santander" and c.code = "COL" and cl.isofficial = "F";


-- Mostrar los paises que no tienen idioma oficial 

SELECT DISTINCT c.code, c.name
FROM country AS c
WHERE c.code NOT IN (
    SELECT cl2.countrycode
    FROM countrylanguage AS cl2
    WHERE cl2.isofficial = 'T' or cl2.isofficial = NULL
) order by name ;



-- mostrar las ciudades en asia y su pais ordenados por la cantidad de habitantes que tiene idioma español 

select 	* 
from country as c 
left join countrylanguage as cl on c.code = cl.countrycode 
where c.continent = "Asia" and cl.language = "Spanish"
order by c.population desc;













