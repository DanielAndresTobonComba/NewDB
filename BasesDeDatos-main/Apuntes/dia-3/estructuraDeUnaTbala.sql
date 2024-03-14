-- REVISION DE ESTRUCTURA DE UNA TABLA 

-- Comando describe  o desc 

-- Comando  SHOW COLUMNS FROM 

use mundo;
show columns from tpais;


-- Comando: show create table -> muestra estructura de como se creo la tabla 

use biblioteca ; 
show create table inscripcion; -- muestra el codigo de como se creo la tabla seleccionada 

-- Comando: show table status like -> informacion general de la tabla 
show table status like "inscripcion";
    
-- comando : informatio_schema.tables e information_schema.columns
select * 
from INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = "inscripcion" ; -- da la informacion de las columnas 	


-- comado: -> para obtener los datos de las tablas de una base de datos 
select * 
from INFORMATION_SCHEMA.TABLES 
WHERE table_schema = "biblioteca" ;