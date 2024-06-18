-- TALLER WORLDS 
use world;

-- Deme los paises que hablas el idioma mas largo

select * from countryLanguage;
select * from country;


select * from(
    SELECT c.name , cl.Language, countryCode
    FROM country as c
    inner join countryLanguage as cl on c.code = cl.countrycode
    WHERE LENGTH(Language) = (SELECT MAX(LENGTH(Language)) FROM countryLanguage)
) as consulta;



/*
INSERT INTO lenguaje_y_pais (Lenguaje)
SELECT COALESCE(Language, (SELECT Language FROM pais LIMIT 1))
FROM pais
LIMIT 1;
*/