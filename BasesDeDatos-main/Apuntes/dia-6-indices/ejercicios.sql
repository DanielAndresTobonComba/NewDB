USE world;


SELECT DISTINCT c.code, c.name
FROM country AS c	
WHERE c.code NOT IN (
    SELECT cl2.countrycode
    FROM countrylanguage AS cl2 
    WHERE cl2.isofficial = 'T' or cl2.isofficial = NULL
) order by name ;



select * 
from country 
where name = "Philippines";

select *
from countrylanguage 
where countrycode = "PHL" ;


