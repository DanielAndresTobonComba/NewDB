-- COMANDO IF EN CAMPOS 

select name , format( population , 0 ) as poblacion,
	if(population < 20000000 , "Despoblado" , if(population < 40000000 , "Poblado" , "SobrePoblado")) as Estado
from country 
where region = "South America" ;


select * from country;

select name , surfacearea ,  format( population , 0 ) as Poblacion, region , population/surfacearea as Desidad,
	if (population / surfacearea > 10 and population / surfacearea < 20	, "Poco Poblado" , 
    if(population / surfacearea > 20 and population / surfacearea < 30 , "Poblado" , 
    if(population / surfacearea > 30, "Superpoblado" , "Despoblado" ))) as Estado
from country
where Continent = "North America" or Continent = "South America"
order by Desidad desc;