-- FUNCIONES  
-- APUNTES 
use base_ejemplo;


/*
*/
drop function calcularAreaCirculo;

delimiter $$

create function calcularAreaCirculo(radio double)
returns double 
deterministic
begin 
	declare area double; 
    set area = pi() * radio * radio;
    return area; 
end$$ 

delimiter ; 


select format ( calcularAreaCirculo(12) , 2 )as Area;


/* Funcion que me devuelva la clasificacion de una 
pelicula segun su edad 
*/

delimiter $$ 

create function clasificarEdad(edad int) 
returns varchar(30)
deterministic
begin 
	if edad < 13 
		then 
			return "Para niños"; 
	elseif edad < 18 
		then 
			return "Para adolecentes";
	else 
		return "Para Adultos"; 
	
    end if;
end$$

delimiter ;         

select nombre , clasificarEdad(edad) as Clasificacion 
from pelicula; 

select  clasificarEdad(12);


-- crear una funcion para calcular el factorial de un numero 

delimiter $$ 

create function factorial(numero int) 
returns varchar(30)
deterministic
begin 
	declare f int default 1; 
    while numero > 1 do 
		set f = f * numero ;
        set numero = numero -1;
    end while; 
    return f;
end$$

delimiter ;   


select factorial(5) as Factorial;
            
            
use MI_PRIMERA_DB;

-- Crear una funcion que devuelve el nombre del coche mas antiguo 

drop function autoMasAntiguo; 
delimiter $$ 

create function autoMasAntiguo() 
returns varchar(30)
deterministic
begin 
	declare kl double ;
	select kilometros into kl
    from coches 
    order by kilometros desc
    limit 1;
    
    return kl;
end$$

delimiter ;  


select * 
from coches 
where kilometros = autoMasAntiguo();


            