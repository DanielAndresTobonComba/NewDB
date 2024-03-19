-- SESION 14 
-- EJERCICION FUNCIONES
USE tienda;

-- Funcion que calcula el descuento al precio 


delimiter $$ 

create function calcularDescuento(valor decimal(10,2) , 
								porcentaje decimal(10,2) )
returns decimal(10,2)
deterministic
begin 
	
    if porcentaje > 0 and porcentaje <= 100 
		then 
			return valor * (porcentaje / 100) ;
	elseif porcentaje > 100 
		then return valor; 
	else 
		return 0; 
	end if ;
end$$

delimiter ; 

drop function calcularDescuento;


set @proc = -10;
select nombre , precio  , calcularDescuento(precio , @proc) as Descuento 
		, precio - calcularDescuento(precio , @proc) as PrecioFinal
from producto ; 


-- Crear una funcion para mostrar las el promedio de ventas de un vendedor 

create table ventas (
	id int auto_increment, 
    vendedor_id int , 
    moto_venta decimal(10,2), 
    primary key (id)

);

delimiter $$ 

create function PromedioVentas(cod_vendedor int )
returns decimal(10,2)
deterministic
begin 
	
    declare acumulador decimal (10,2); 
    declare existe int;
    
		select count(vendedor_id) into existe 
        from ventas 
		where vendedor_id = cod_vendedor; 
        
        if existe > 0  
			then 
				select avg(moto_venta) into acumulador 
				from ventas 
				where vendedor_id = cod_vendedor;
		else 
			return 0; 
		
        end if; 
return acumulador; 
   
end$$

delimiter ; 

drop function PromedioVentas;

set @cod = 2;
select PromedioVentas(@cod) as PromedioVentas;


-- Funcion calcular el descuento dependiendo de la categoria del cliente 

create TABLE ordenes (
	id int auto_increment, 
    cliente_id int , 
    precio decimal(10,2), 
    categoria_cliente varchar(10), 
    primary key (id)
);

drop table ordenes;


delimiter $$ 
create function calcularDescuento(precio decimal(10,2) , categoria varchar(10))
returns decimal(10,2)
deterministic
begin 
	
    
    
		if categoria = "a"  
			then 
				return (precio * 0.3); 
		elseif  categoria = "b"  
			then 
				return (precio * 0.2); 
		elseif categoria = "c"  
			then 
				return (precio * 0.1); 
		else 
				return precio; 
		end if ;
			
		
   
end$$

delimiter ;

insert into ordenes ( cliente_id , precio , categoria_cliente) 
			values ( 1 , 125 , "A") ;


drop function calcularDescuento;

select * , calcularDescuento(precio , lower( categoria_cliente)) as Descuento 
		, precio - calcularDescuento(precio , lower( categoria_cliente)) as PrecioFinal
from ordenes;	




 