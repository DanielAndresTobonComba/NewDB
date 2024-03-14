-- CONSUTAS ANIDADAS 

-- ESTRUCTURA GENERAL 
-- DENTRO DEL WHERE
/*
SELECT column_name 
from table1 
where column_name operator(select column_name from table2)
*/

-- Mostrar la lista de lo paises cuya poblacion es mayor que el promedio de poblacion de todos los paises en la base de datos

select name , population 
from country 
where population > (select avg(population) from country);


-- DENTRO DEL FROM 

SELECT AVG(population) 
from (select population 
		from city 
        where countrycode = "VEN") AS CiudadesPais1;
        
-- DENTRO DEL SELECT 

-- Proporcionar una lista de paises de america junto con el numero de ciudades que tiene cada uno. debe estar ordenado por el numero de ciudades del pais.
	SELECT name , (select count(*)
					from city c 
                    where c.countrycode = p.code) as NumeroCiudades
	from country as p 
    where p.continent = "North America" or p.continent = "South America"
    order by NumeroCiudades desc;
    
    
-- SUBCONSULTAS CORRELACIONADAS 
select c1.name , c1.population 
from city as c1
inner join country p on c1.countrycode = p.code 
where ( p.continent = "North America" or p.Continent = "South America") and 
		c1.population > ( select avg (c2.population) 
							from city as c2
                            where c2.countrycode = c1.CountryCode)
order by c1.population desc;
        
        
        
        
        