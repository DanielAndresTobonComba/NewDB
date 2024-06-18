-- ----------------------------------
-- SESION 3 GESTION DE DATOS CON SQL 
-- ----------------------------------

-- TABLAS TEMPORALES , COMANDOS PARA SABER LA ESTRUCTURA DE UNA TABLA , COMANDOS PARA MY SQL
	

-- CREAT TABLAS TEMPORALES
/*
create table nueva_tabla  
AS 
SELECT Columnna1 , columna2 ... 
FROM tabla_origen 
where condicion; 
*/


-- PARA EL EJMEPLO 5 DEL DIA 2 USANDO UNA TABLA TEMPORAL SE HACE DE LA SIGUIENTE FORMA 
-- mostrar los 5 paises europeos con la menor expectativa de vida 


create TABLE expVida 
SELECT C.name , C.LifeExpectancy 
from world.country as C 
where C.Continent = "Europe" and C.LifeExpectancy is not null
ORDER BY C.LifeExpectancy
LIMIT 5;

drop  table expVida;

select * from expVida; -- traigo la tabla temporal 

select * from expVida order by LifeExpectancy desc , name ;






	










