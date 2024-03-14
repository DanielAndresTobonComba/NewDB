use world;

-- mostrar los idiomas no oficiales hablados en colombia 

select name as Pais ,  cl.language as Lenguaje , cl.isofficial as Estado 
from country  as c  
inner join countrylanguage as cl on c.code = cl.countrycode
where c.name = "Colombia" and cl.isofficial = "F" ; 

-- SUBCONSULTA
-- mostrar los 5 paises europeos con la menor expectativa de vida 

SELECT L.name , L.LifeExpectancy
from (SELECT C.name , C.LifeExpectancy 
from world.country as C 
where C.Continent = "Europe" and C.LifeExpectancy is not null
ORDER BY C.LifeExpectancy
LIMIT 5) as L 
order by LifeExpectancy desc , name desc; 




-- Dame los paises que no tiene un idioma oficial o no tiene registro del mismo

SELECT DISTINCT c.code, c.name
FROM country AS c
WHERE c.code NOT IN (
    SELECT cl2.countrycode
    FROM countrylanguage AS cl2
    WHERE cl2.isofficial = 'T' or cl2.isofficial = NULL
) order by name ;



-- Mostrar el listado de los paises en donde se puede hacer el reemplazo 
select name, replace(name, "Gu" , "YU" ) as Remplazo 
from country
where region = "South America" and locate("YU", replace(name, "Gu" , "YU"));



-- saber cuantas veces se repite una letra en una cadena 

SELECT 
    name, 
    CONVERT(LENGTH(name), SIGNED) AS longitud,
    CONVERT(LENGTH(name), SIGNED) - convert( LENGTH(REPLACE( lower (name), 'a', '')) , signed) Repite_letra
FROM 
    country 
WHERE 
    continent IN ('North America', 'South America');

-- mostrar el pais de africa con la menor expectativa de vida 
SELECT name, lifeExpectancy as menor_expectativa
FROM country
WHERE continent = 'Africa' 
AND lifeExpectancy = (SELECT MIN(lifeExpectancy) FROM country WHERE continent = 'Africa')
LIMIT 1;

-- mostrar el promedio de la expectativa de vida de africa 

select avg(lifeExpectancy) as expectativa_vida_africa from country
where continent = "Africa";


-- estado de independencia de los paises 
select Name , if( indepyear < 1899 , "Antiguamente Independizado" , 
			if(  indepyear > 1899 , "Recientemente independizado" , "N/A") )
as Estado_independencia from country ;


-- capaciadad de repartir la riqueza de un pais sobre sus habitantes 
select name , format(round( gnp / ( population/surfacearea) ,2 ), 2) as Riqueza 
from country
where continent = "South America" or continent = "North America"
order by round( gnp / ( population/surfacearea) ,2 ) desc  , name asc;