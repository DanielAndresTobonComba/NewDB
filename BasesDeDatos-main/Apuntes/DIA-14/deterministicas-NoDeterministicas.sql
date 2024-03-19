-- FUNCIONES DETERMINISTICAS Y NO DETERMINISTICAS 
-- ERRORES PERSONALIZADOS 

/*
Deterministica : Cuando los valores de entrada y salida siempre son los
mismo 

No deterministicas: cuando los valores de entrada son los mismo pero
la salida siempre va a variar 
*/

CREATE DATABASE pruebas; 
use pruebas;

drop function division;

delimiter $$

create function division(dividendo double , divisor double) 
returns double  
deterministic 

begin 

	if divisor = 0 
		then 
			signal sqlstate "10000" set message_text = "Error.Division por cero no permitida. xd";
			
	end if; 
	return dividendo / divisor ; 

end$$


delimiter ;  

select division(6,1) as Resultado;



	