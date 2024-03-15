use tienda; 

-- MANEJO DE ERRORES 

drop procedure insertarFabricante;

delimiter $$ 
create procedure insertarFabricante ( in idFab int , 
									in nombreFab varchar(100))
	begin 
		declare exit handler for 1062 
        select concat("Error.El fabricante con id: ", idFab , " y nombre: "  
						, nombreFab , " Ya existe"  ) as MensajeError;
        
        insert into fabricante 
        values (idFab , nombreFab); 
    end $$ 

delimiter ; 

call insertarFabricante(10 , "Motorola"); 