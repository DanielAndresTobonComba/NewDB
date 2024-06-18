-- Combinacion de tablas 
-- Sesion 4 


-- Producto cruz +
use world;
select C.code , C.name , D.id , D.name , D.CountryCode
	from country as C , city as D;
    
-- interseccion entre dos tablas inner join (join natural)
-- ciudades de colombia 
select P.name , C.name 
from country as P  
inner join city as C on P.code = C.countrycode -- El p.code es la llave principal y el c.countrycode es la llave foranea , 
-- debo tener en cuenta esto viendo el modelo relacional de la base de datos
where P.name = "Colombia";

-- left join 
-- Todos los elemetos del conjunto A y donde no exista relacion con B entonces aparece/coloca es NULL 

select c.name , P.language
from country as c
right join countrylanguage as P on c.code = P.country
where c.language = "Spanish";

select c.name , P.language
from country as c
left join countrylanguage as P on c.code  = P.countrycode
where p.language = "Spanish";


-- Right join 
-- Todos los elemetos del conjunto B y donde no exista relacion con A entonces aparece/coloca es NULL 

select p.name , c.name 
from city as c 
right join country as p on c.countrycode = p.code 
where p.name = "Colombia" ; 

insert into countrylanguage (countrycode , language , isOfficial , percentage) values ("ZZZ" , "Marciano" , "T" , 100);







