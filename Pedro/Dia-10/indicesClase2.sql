### Scripts base de datos world 

use world;
show tables;

-- Optimizacion de consultas
-- Programacion de tarea 
-- Triggers 

select * from country as c
inner join city as ct
on ct.CountryCode =  c.code
order by c.Name;

select *
from countrylanguage;

describe table city;



-- Crear un indice
create index idx_cityName on city(Name);
create index idx_cityCountry on city (CountryCode);

show keys from city;
show index from city where Key_name = 'CountryCode';

-- Saber el rendimiento de un indice
explain analyze select * from city where Name = 'Bogota';
explain select * from city where Name = 'Bogota';

-- Saber los datos de los indices 
select 
    database_name, 
    table_name, 
    index_name, 
	stat_name,
    round((stat_value*@@innodb_page_size)/1024/1024, 2) SizeMB, 
    round(((100/(SELECT INDEX_LENGTH FROM INFORMATION_SCHEMA.TABLES t WHERE t.TABLE_NAME = iis.table_name and t.TABLE_SCHEMA = iis.database_name))*(stat_value*@@innodb_page_size)), 2) `Percentage`
from mysql.innodb_index_stats iis 
where stat_name='size' 
and index_name = 'idx_cityName';

select 
    database_name, 
    table_name, 
    index_name, 
    round((stat_value*@@innodb_page_size)/1024/1024, 2) SizeMB, 
    round(((100/(SELECT INDEX_LENGTH FROM INFORMATION_SCHEMA.TABLES t WHERE t.TABLE_NAME = iis.table_name and t.TABLE_SCHEMA = iis.database_name))*(stat_value*@@innodb_page_size)), 2) `Percentage`
from mysql.innodb_index_stats iis
where stat_name='size';


-- Tomar todos los datos de los indices de mis bases de datos
select * 
from mysql.innodb_index_stats iis;