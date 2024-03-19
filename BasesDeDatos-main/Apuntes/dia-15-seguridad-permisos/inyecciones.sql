
-- SEGURIDAD EN CONTRA INYECCIONES SQL

use world; 

select * 
from city 
where countrycode = "col";

-- USAR PREPARE Y EXECUTE PARA EVITAR LAS INYECCIONES DE SQL 
prepare stmt from 'select * 
					from city 
					where countrycode = ?;';

set @pais = 'col'; 
execute stmt using @pais;

-- BORRAR UNA CONSULTA PREPARADA 
deallocate prepare stmt;