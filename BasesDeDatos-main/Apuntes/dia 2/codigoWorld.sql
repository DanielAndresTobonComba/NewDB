use world;

select * from country;


select * from city;

select * from countrylanguage;

-- mostrar el pais con mayor poblacion 

select * from country
order by Population desc ;

-- mostrar las ciudades con poblacion menor a 1 millon , el listado debe estar ordenado por poblacion de menor a mayor 
-- y si hay dos ciudades con la misma poblacion mostrarlas en orden alfabetico

select Name , Population  from city 
where Population < 1000000
order by Population asc , Name asc 
limit 10000;


-- mostrar los tres paises com mayor poblacion de sur america 

select Name , Continent , Population from country 
where Continent = "South America"
order by Population desc
limit 3;

-- mostrar los idiomas no oficiales hablados en colombia 

select * from countrylanguage
where CountryCode = "COL" AND  IsOfficial = "f"
order by Percentage desc;	














