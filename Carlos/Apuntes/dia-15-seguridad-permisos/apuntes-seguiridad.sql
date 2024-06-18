-- SESION 15  
-- SEGURIDAD Y PERMISOS 

/*
CONSEJOS PAR AAUMENTAR LA SEGURIDAD DE UNA BASE DE DATOS 

CONTRASEÑAS FUERTES 
RESTRICION DE ACCESOS A CADA ROL QUE INTERACTUE CON LA BASE DE DATOS 
ACTUALIZACION REGULAR DE BASE DE DATOS 
*/


/*
ROOR : Superusuario 
ANONIMO : Por defecto mysql tiene permisos limitados y se recomienda 
eliminar 
*/

use tienda;

-- Saber que usuarios estan dentro de la base de datos 
select user  , host 
from mysql.user; 


-- Crea un usuario
create user 'cacas'@localhost identified by 'cacas2024';  


-- Dar derechos a un uso a un usuario
grant insert on tienda.* to 'cacas'@localhost; 


-- Mostrar que puede hacer el usuario selecciona 
show grants for 'cacas'@localhost;


drop user 'cacas'@localhost ;

-- no poder actuar en ciertas tablas 
grant insert on tienda.producto to 'cacas'@localhost;
revoke insert on tienda.producto from 'cacas'@localhost;


-- Poner limitantes a un usuario 
grant usage on prueba.* to 'cacas'@localhost; 
alter user 'cacas'@localhost  with max_queries_per_hour 100; 


-- SEGURIDAD Y USUARIO ANONIMOS 

-- Saber usuarios dentro de la base de datos 

select user  , host 
from mysql.user; 

-- ELIMINAR UN USUARIO ESPECIFICO
select user , host 
from mysql.user 
where user = ''; 

drop user ""@localhost; 


-- Cambiar la contraseña de un usuario 
alter user 'cacas'@localhost identified by 'cac@a2024';

-- Quitar los derechos de un usuario
revoke all privileges on *.* from 'cacas'@localhost;

revoke all privileges , grant option from 'cacas'@localhost;  
grant select on tienda.* to 'cacas'@localhost;


-- Mostrar que puede hacer el usuario selecciona 
show grants for 'cacas'@localhost;



-- Crear un usuario administrado 
create user 'admin'@'%' identified by 'campus2024'; 
grant all privileges on *.* to 'admin'@'%' with grant option; 


-- LIMITANTES DE COLUMNAS 

-- creo el usuario 
/* cuando creo el usuario puedo crear una nueva conexion y 
entrar con esta credenciales y solo podre usar lo que se 
ha autorizado desde este codigo 
*/
create user camilo@localhost identified by 'bucaroscampeon'; 
grant select (nombre , precio) on tienda.producto to camilo@localhost;
 

-- Recargar los provilegios del servidor para aplicar cambios 
flush privileges; 



-- comandos para especificar desde donde se conecta el usuario 
-- pendiente escribir 
grant update , insert , select on tienda.producto to campus@%.campusland.com; 
create user 'user2'@'%.campusland.com' identified by 'campus2023'; 










