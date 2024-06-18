Actualizar datos

-- Actualizar uno o mas datos 
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
alter table
-- Añadir una columna 
ALTER TABLE table_name
ADD column_name datatype;

-- Eliminar una columna 
ALTER TABLE table_name
DROP COLUMN column_name;

-- Modificar el tipo de dato de una columna
ALTER TABLE table_name
MODIFY COLUMN column_name datatype;
Dar formato a un numero

format (total , 2); -- Dato y cantidad de decimales
Ejercicio avanzado
DELIMITER //
CREATE PROCEDURE AñadirProducto(IN nombre VARCHAR(255), IN precio DECIMAL(10, 2), IN stock INT)
BEGIN
    DECLARE contador INT;
    DECLARE mensaje_error varchar(100);
    

    SELECT COUNT(*) INTO contador 
    FROM Productos AS p
    WHERE p.nombre = nombre;

    IF contador > 0 or trim(nombre ) = "" THEN 
        set mensaje_error =  concat( "ERROR.El nombre producto " , nombre ,  " ya existe en la base de datos o es erroneo")  ;
        insert into error_log(error_descripcion) 
        values (mensaje_error);
        select mensaje_error;
	ELSEIF precio <= 0 THEN 
		set mensaje_error =  concat( "ERROR.El precio del producto es invalido" )  ;
        insert into error_log(error_descripcion) 
        values (mensaje_error);
        select mensaje_error;
      
	ELSEIF stock < 0 THEN 
		set mensaje_error =  concat( "ERROR.El numero de stock no es valido" )  ;
        insert into error_log(error_descripcion) 
        values (mensaje_error);
        select mensaje_error;
    
    ELSE
        INSERT INTO Productos(nombre, precio, stock) VALUES (nombre, precio, stock);
    END IF;
END //
DELIMITER ;
call AñadirProducto("Motorola" , 250 , 15);
elminar
-- Todos los datos de una tabla
DELETE FROM table_name;

-- Eliminar un registro especifico de una tabla
DELETE FROM table_name WHERE condition;
Like
LIKE Operator	Description
WHERE CustomerName LIKE 'a%'	Finds any values that start with "a"
WHERE CustomerName LIKE '%a'	Finds any values that end with "a"
WHERE CustomerName LIKE '%or%'	Finds any values that have "or" in any position
WHERE CustomerName LIKE '_r%'	Finds any values that have "r" in the second position
WHERE CustomerName LIKE 'a_%'	Finds any values that start with "a" and are at least 2 characters in length
WHERE CustomerName LIKE 'a__%'	Finds any values that start with "a" and are at least 3 characters in length
WHERE ContactName LIKE 'a%o'	Finds any values that start with "a" and ends with "o"
procediemintoParaactualizar.txt
DROP PROCEDURE IF EXISTS actualizarExistenciasPieza;
DELIMITER //

CREATE PROCEDURE actualizarExistenciasPieza (IN idPieza INT, in cantidadNueva int )
BEGIN
    UPDATE Inventario
    SET cantidad = cantidadNueva
    WHERE piezaId = idPieza ;
END //

call actualizarExistenciasPieza (6 , 21 );
Procedimeintos con variables internas
drop procedure if EXISTS PoblacionPaisesDeHablaHispana;
delimiter $$ 
create procedure PoblacionPaisesDeHablaHispana (in nombrePais varchar(50)  ,
		inout Poblacion_Total int )
	begin 
		declare Acumulador int;
        
        select  c.population into Acumulador
        from country as c
        inner join countrylanguage as cl on c.code = cl.countrycode 
        where cl.language = "Spanish" and cl.isOfficial = "T" and c.name = nombrePais; 
        
        set Poblacion_Total =  if ( Acumulador is null , 0 + Poblacion_Total, Acumulador + Poblacion_Total );
								-- if ( Acumulador is not null , Acumulador + Poblacion_Total , 0 + Poblacion_Total);
	end$$ 

delimiter ;
set @Poblacion = 0;	
call PoblacionPaisesDeHablaHispana("France" , @Poblacion);
call PoblacionPaisesDeHablaHispana("Colombia" , @Poblacion);
call PoblacionPaisesDeHablaHispana("Spain" , @Poblacion);

select format( @Poblacion , 0) as Poblacion_Total;
Procedimiento con variables
delimiter  // 
create procedure  CalcularTotal(in precio decimal (10,2) , in cantidad int , out total decimal (10,2)) -- Variable de salida es out
BEGIN

	set total = precio * cantidad ;

END //
delimiter ;

/* El @total sera la variable que creamos que recibira 
los parametros de entrada */

set @total = 0;
call tienda.CalcularTotal(1, 50, @total);
select @total;
Row count
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
Union de varias tablas
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;

SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;