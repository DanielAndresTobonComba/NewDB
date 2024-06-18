-- FUNCIONES DETERMINISTICAS Y NO DETERMINISTICAS 
-- ERRORES PERSONALIZADOS 

/*
Deterministica : Cuando los valores de entrada y salida siempre son los
mismo 

No deterministicas: cuando los valores de entrada son los mismo pero
la salida siempre va a variar 
*/

show databases;

create database funciones;
use funciones;

create table productos (
id int auto_increment,
nombre varchar(100),
precio decimal(10,2),
primary key(id)
);

insert into productos values
	(1,"Pepinillo" , 23.2),
    (2,'MousePad' , 10000),
    (3,'Espionap', 2500),
    (4,'Bob-Esponja', 1500.25),
    (5,"Cherry" , 2354.23),
    (6 , "Ovulap" , 198700.23),
    (7,'PapayApp' , 20000),
    (8,'Producto8' ,1420.23 ),
    (9,'Producto9' , 2300.00),
    (10,'Producto10' , 35000);
    
    
-- Crear una funcion que me retorne el nombre del producto con el precio mas iva

-- Con consulta 
select nombre ,(precio * 0.17 + precio) as PrecioIva
from productos;

-- Con funcion
delimiter $$

create function TotalIva(precio decimal(10,2) , iva decimal(5,2))
returns varchar(254)
deterministic 

begin 
	if precio < 1000 then
	return precio +( precio * iva);
    else 
    return concat('Tu precio es mayor a 1000', precio +( precio * iva));
    end if ;
end$$ 

delimiter ;


-- Asi tomo todos los datos de una tabla y los inserto a la tabla
select nombre , precio, TotalIva(precio,15) as PrecioConIva
from productos;

drop function TotalIva;


-- Ejem 2
DELIMITER $$

CREATE FUNCTION buscarProducto(producto VARCHAR(50))
RETURNS VARCHAR(254)
DETERMINISTIC
BEGIN
    
    RETURN (select concat('nombre: '  , nombre , '   precio: '  , precio) from productos where nombre = producto );
END$$

DELIMITER ;

drop function buscarProducto;

select buscarProducto('Cherry');
