-- EJERCICIOS WORLD 

use world; 



drop procedure listarCiudadesDePais ;
delimiter $$ 

create procedure listarCiudadesDePais (in nombrePais varchar(100))
	begin 
		select city.name 
        from country 
        inner join city on city.countrycode = country.code 
		where upper(country.name) = upper(nombrePais); 
        
	end$$ 
delimiter ; 

call listarCiudadesDePais("Spain");


-- Contar las ciudades de un pais en especifico 
drop procedure contarCiudadesPais;

delimiter $$ 

create procedure contarCiudadesPais (in nombrePais varchar(100) , 
		out total_ciudades int )
        
	begin 
		select count(*) into total_ciudades 
        from country 
        inner join city on city.countrycode = country.code 
		where upper(country.name) = upper(nombrePais); 
        
	end$$ 
delimiter ; 

set @numero = 0;
call contarCiudadesPais("Brazil" , @numero);
select @numero as Cantidad_Ciudades;


-- EJERCICIO 2 

drop procedure PoblacionPaisesDeHablaHispana;

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

select * 
from country; 

select *
from countrylanguage;


set @Poblacion = 0;	
call PoblacionPaisesDeHablaHispana("France" , @Poblacion);
call PoblacionPaisesDeHablaHispana("Colombia" , @Poblacion);
call PoblacionPaisesDeHablaHispana("Spain" , @Poblacion);

select format( @Poblacion , 0) as Poblacion_Total;





-- EJERCICIO 3

drop procedure cantidadPersonasHablantes ;

delimiter $$ 
create procedure cantidadPersonasHablantes (in lenguaje varchar(50))
	begin 
	
        select format( sum(Poblacion) , 0)
		from (
				select  (c.population * cl.percentage / 100) as Poblacion
						from country as c
						inner join countrylanguage as cl on c.code = cl.countrycode 
						where cl.language = lenguaje ) as tabla;
								
	end$$ 

delimiter ;


call cantidadPersonasHablantes("Spanish");










    