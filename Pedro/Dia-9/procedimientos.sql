### Dia 9 ###

-- Seguridad 
-- Indexacion 
-- Procedimientos 

delimiter $$

-- Procedure solo con in
create procedure buscarProducto (in nombreBusqueda varchar(50))
begin 

	select * 
    from productos 
    where nombre = nombreBusqueda;

end $$

delimiter ;

call buscarProducto ('Pepinillo');

-- Procedure con out e insertar un dato en una tabla 

delimiter $$

create procedure insertarProductos (in nombreProducto varchar(50), in precioProducto decimal(10,2) , out msj varchar(50))
begin 
	if nombreProducto = any (select nombre from productos) 
    then 
		set msj = concat( "El producto" , nombreProducto , " ya existe.");
    else 
		insert into productos (nombre , precio)
        values (nombreProducto , precioProducto);
        set msj = ' El producto ha sido ingresado exitosamente ';
    end if;
	
    select msj;
end $$
delimiter ;

drop procedure insertarProductos;

set @msj = "";
call insertarProductos ('Persona 5' , 20.34 , @msj);

select * 
from productos;
