## Creacion de la tabla producto

create table producto (
	id int not null auto_increment,
	producto varchar(40) not null,
	cantidad int not null, 
	precio decimal(19,2) not null,
	marca varchar(20) not null,
	estado tinyint,
	primary key (id)
);

delimiter $$ 

## Creacion del procedimiento de insertar un producto

drop procedure if exists insertar_producto;
create procedure insertar_producto(
in producto varchar(40),
in cantidad int,
in precio decimal(19,2),
in marca varchar(20),
in estado tinyint)

begin 
	insert into producto (id, producto , cantidad , precio , marca , estado) 
	/* EL null espara que me tome el id como auto-incremental si asi lo cree en la tabla */
	values (NULL , producto , cantidad , precio , marca , estado);
end $$ 

delimiter ; 

-- Llamado del procedimiento

call insertar_producto ('Mouse' , 10 , 100 , 'Rysen' , 4);


/* Procedimeinto para buscar un producto por su Id y da el total de la cantidad de ese equipo por su precipo */

delimiter $$ 

drop procedure if exists buscar_producto;
create procedure buscar_producto(
	in ID int
)

begin 
	select id , producto , (cantidad*precio) as subtotal 
	from producto
	where ID = id;
end $$  delimiter;

-- Llamado del procedimeinto buscar_producto

call buscar_producto(1):


## Creacion del procedimeinto verificar un producto 

delimiter $$

DROP PROCEDURE IF EXISTS insertar_producto_verify ;
CREATE PROCEDURE insertar_producto_verify (
	in producto varchar(40),
	in cantidad int,
	in precio decimal(19,2),
	in marca varchar(20),
	in estado TINYINT
)


begin 
	DECLARE mensaje varchar(100);
	
	INSERT INTO producto (id, producto , cantidad , precio , marca , estado)
	VALUES (NULL , producto , cantidad , precio , 'marca' , estado);
	
	IF ROW_COUNT() > 0 THEN 
		SET mensaje = 'El registro se ha creado correctamente. ';
		
	ELSE 
		SET mensaje = 'Error al crear el registro. ';
	END IF; 
	
	SELECT mensaje as 'Mensaje'; 
end $$ 
delimiter ;


-- Llamado del procedimiento verificar_producto
 call insertar_producto_verify ('Alpha Plus' , 30 , 480.00 , 'Boimax' , 1);
 
 ## Creacion del procedimiento de eliminar un producto
 
 DELIMITER $$ 
 CREATE PROCEDURE eliminar_producto(
 	in producto_id int 
 )
 
 begin 
 	declare mensaje varchar(100);
 	
 	DELETE FROM producto WHERE id = producto_id;
 	
 	IF ROW_COUNT() > 0 THEN 
 		SET mensaje = concat('El producto con ID' , producto_id, 'ha sido eliminado exitosamente');
 
 	ELSE 
 		SET mensaje = 'No se encontro ningun producto con el ID proporcionado.';
 	END IF;
 	
 	SELECT mensaje as 'Mensaje';
 
 end $$

DELIMITER ;

-- Llamar al procedimeinto eliminar_producto 
call eliminar_producto(1);


## Creacion del procedimiento de mostrar todos lo productos de la tabla producto


## Creacion del procedimiento para mostrar la cantidad disponible de un producto

DELIMITER $$ 
DROP PROCEDURE IF EXISTS obtener_cantidad_disponible; 
CREATE PROCEDURE obtener_cantidad_disponible(
    IN idBusqueda INT
)
BEGIN 
    DECLARE cantidad_disponible INT; 
    
    SELECT cantidad INTO cantidad_disponible
    FROM producto 
    WHERE id = idBusqueda;
    
    SELECT cantidad_disponible AS CantidadDisponible;
END $$ 
DELIMITER ;

-- Llamado del procedimiento obtener_cantidad_disponible
call obtener_cantidad_disponible (20);


## Creacion del procedimeinto con tablas temporales 

delimiter $$ 
drop procedure if exists obtener_total_registros_por_marca_temp;
create procedure obtener_total_registros_por_marca_temp()
begin 
-- crear una tabla temporal para almacenar los resultados 

	create temporary table if not exists temp_resultados (
		marca varchar(20),
		total_registros int
	);
	
	-- Insertar los resultados en la tabla temporal 
	insert into temp_resultados (marca , total_registros)
	select marca , count(*) as total_registros
	from producto
	group by marca; 
	
	-- Seleccionar los resultados de la tabla temporal 
	select * from temp_resultados;
	
	-- Eliminar la tabla temporal despues de usarla 
	drop temporary table if exists temp_resultados; 
end $$ 
delimiter;
call obtener_total_registros_por_marca_temp();




