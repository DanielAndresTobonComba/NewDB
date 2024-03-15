-- SESION 11 

-- Procedimeintos almacenados 

-- CONDICIONAL IF 

/* Estructura del if 
if condicion then 
else 
end if
*/


-- ESTRUCTURA LOOP / CICLICA 

/*
Va a iterar un codigo hasta que se encuentre con la sentencia leave .
se usa cuado necesito que algo se ejecute hasta que se cumpla una 
condicion.

loop 

	if condicion_salida then 
		leave loop_label ;
	end if ;
    
end loop loop_label

*/


-- REPEAT 

/*
Se ejecuta hasta que una condicion se cumpla y se ejecuta el codigo al 
menos una vez  

repeat 
		acciones 
until condicion 
end repeat;
*/

/* EJEMPLO 
Aumentar el salario de los empleados en un % repetidamente hasta que 
todos tengan un salario minimo de $3000. 
*/

delimiter // 

create procedure AumentarSalarios() 
begin 
	repeat  
		update empleados set salario = salario * 1.05
        where salario < 3000; 
	until (select count(*) from empleados where salario < 3000) = 0
    end repeat; -- MIENTRAS LA CONDICION DEL UNTIL SEA FALSO SE CUMPLIRA EL REPEAT
end // 

delimiter ; 


-- WHILE 
/*
Repite mientras una codicion sea verdadera , primero pregunta y luego 
hace 
*/

while condicion do 
	-- Acciones a repetir 
end while ;


/* EJEMPLO 
Supongamos que queremos contar cantos empleados tienen un salario 
mayor a $4000
*/


-- CASE  
/*
Similar al switch , util cuando se necesita evaluar diferentes casos
de una variable o condiciones distintas util en procedimientos almacenados 
y funciones 

case expresion 

	when valor 1 then 
		Acciones para valor1 
	when valor 2 then 
		Acciones para valor2
	else 
		Acciones si no se cumple ninguno de los casos 
        
end case ; 
*/

-- MANEJO DE EXCEPCIONES 
/*
DECLARE HANDLER 

DECLARE CONTINUE HANDLER 
CONTINUE : Que continue el codigo.

DECLARE EXIT HANDLER 
EXIT : Se sale del bloque 
*/







