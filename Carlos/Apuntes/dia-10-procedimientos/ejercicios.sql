create database base_ejemplo;

use base_ejemplo; 


create table productos (
	id int not null auto_increment, 
    nombre varchar (20) not null, 
    estado varchar(20) not null default "Disponible", 
    precio float not null default 0.0, 
    primary key (id)

);

INSERT INTO productos (nombre, estado, precio) VALUES
('Producto1', 'disponible', 10.99),
('Producto2', 'disponible', 20.49),
('Producto3', 'agotado', 5.99),
('Producto4', 'disponible', 15.29),
('Producto5', 'disponible', 12.99),
('Producto6', 'agotado', 8.99),
('Producto7', 'disponible', 18.79),
('Producto8', 'agotado', 6.49),
('Producto9', 'disponible', 22.99),
('Producto10', 'disponible', 14.99),
('Producto11', 'disponible', 11.99),
('Producto12', 'agotado', 9.99),
('Producto13', 'disponible', 17.99),
('Producto14', 'disponible', 19.99),
('Producto15', 'disponible', 16.99),
('Producto16', 'agotado', 7.99),
('Producto17', 'disponible', 21.99),
('Producto18', 'disponible', 24.99),
('Producto19', 'disponible', 13.99),
('Producto20', 'agotado', 8.49); 


-- Prodecimiento con parametros IN

delimiter $$ 
create procedure obtenerProductosPorEstado (in nombre_estado varchar
	(255)) 
    
begin 
	select * from productos where estado = nombre_estado;
end $$

delimiter ;

drop procedure obtenerProductosPorEstado;


-- no distingue entre mayusculas y minusculas el parametro 
call base_ejemplo.obtenerProductosPorEstado('disponible');
call base_ejemplo.obtenerProductosPorEstado('agotado');




-- Procedimiento con parametros out 

delimiter $$
create procedure contarProductosPorEstado (in nombre_estado varchar(25),
	out numero int )
begin 
    select count(id) into numero 
    from productos 
    where estado = nombre_estado;
end$$ 
delimiter ;

set @numero = 0;
call base_ejemplo.contarProductosPorEstado('disponible', @numero);
select @numero;
select @numero as Cantidad_Disponible; 



-- Procedimiento con parametros inout 

delimiter $$ 
create procedure venderPoducto (inout beneficio int(255)  ,
		in id_producto int )
	begin 
		declare precio_producto float;
        
        select precio into precio_producto 
        from productos 
        where id = id_producto; 
        
        set beneficio = beneficio + precio_producto ;
	end$$ 

delimiter ;


set @beneficio = 25;
call base_ejemplo.venderPoducto(@beneficio, 2);
select @beneficio as BeneficioTotal; -- Cambio el nombre de la columna


set @beneficio_acumulado = 0; 
call venderPoducto(@beneficio_acumulado , 1); 

call venderPoducto(@beneficio_acumulado , 2); 
select @beneficio_acumulado as BeneficioTotal;

	
-- Eliminar un procedimiento 
drop procedure venderPoducto;
















