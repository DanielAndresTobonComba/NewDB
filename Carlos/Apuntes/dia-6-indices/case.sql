-- EJERCICIOS 
-- CASE 
select l.language , l.Percentage ,  IF( l.isofficial = "F" , "No oficial" , "Oficial" ) as tipo ,  
	case 
		when l.IsOfficial = "F" then "No Oficial" 
        else "Oficial"
	end as tipo2 ,-- finaliza el case 
    
    case 
		when l.Percentage < 0.3 then "Poco Hablado"
        when l.Percentage between 0.4 and 49  then "Medianamente Hablado"
		else  "Muy Hablado"
	end as frecuencia
    
from world.countrylanguage as l 
join world.country P on l.countrycode = P.code 
where P.name = "Colombia"; 