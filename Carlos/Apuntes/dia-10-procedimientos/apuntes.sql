-- Sesion 7 
-- PROCEDIMIENTOS ALMACENADOS 

/*
Recetas poredefinidas que se guardan en el servidor de la base de datos 
Es como una funcion que se llama para que sea ejecutada 

Ventajas 
	Eficiencia : Ya que estas recetas estan en la base de datos.
    
	Optimizacion: Se copilan las instrucciones ya que la base de datos ya la ha analizado.
    
    Seguridad: Controlar y limitar lo que los usuarios pueden hacer en la base de datos.
    
    Modularidad: Capcidad de descomponer la logica en unidades mas pequeñas. 
    
    Rendimiento 
    
*/

/*
Estructura basica
	create procedure nombre_procedimiento (parametros )
    
    begin 
		Declaraciones sql y logica de procedimiento 
    end 
*/


/*
Parameytros de entrada y salida 
	in: valor de entrada se pasa al porcedimiento
    out: El procedimiento puede cambiar el valor del parametro y se refleja fuera del 
		procedimiento
    inout: Combinacion de ambos , valor puede ser pasado al procedimiento y tambien modificado 
		dentro del mismo
*/


USE tienda;

delimiter  // 

create procedure  CalcularTotal(in precio decimal (10,2) , 
								in cantidad int , out total decimal (10,2))
    
BEGIN

	set total = precio * cantidad ;

END //

delimiter ;

/* El @total sera la variable que creamos que recibira 
los parametros de entrada */

set @total = 0;
call tienda.CalcularTotal(1, 50, @total);
select @total;





