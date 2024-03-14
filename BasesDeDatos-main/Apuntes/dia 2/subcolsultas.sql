-- SUBCONSULTAS

-- mostrar los 5 paises europeos con la menor expectativa de vida 
-- importante

select * from (	
select Name , Continent , LifeExpectancy  
from country 
where Continent = "Europe" and LifeExpectancy <> is not null
order by LifeExpectancy   
limit 5) country order by LifeExpectancy desc;

SELECT L.name , L.LifeExpectancy
from (SELECT C.name , C.LifeExpectancy 
from world.country as C 
where C.Continent = "Europe" and C.LifeExpectancy is not null
ORDER BY C.LifeExpectancy
LIMIT 5) as L 
order by LifeExpectancy desc , name desc;