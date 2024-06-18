-- INDICES 
-- SESION 6 

-- Crear un indice 
	create index index_email
		on user (email);
        

-- Indice simple 
-- fdx si es foraneo
create index idx_name on country (name) ;

-- borrar un indice 
drop index idx_name on country ;


-- Indices compuestos 
-- consultar por varias columnas cuando las busqueda es por dos o mas campos 

create index idx_order_date_status on orders (order_date, status); 

-- Indices unicos 
-- indice unico sobre el nombre del pais 

create unique index idx_unq_name on country(name); -- si los paises tubieran el mismo nombre el indice no se podria crear marcaria error 

-- Indices de texto completo 
-- se aplican en datos de tipo texto o de texto completo para hacer busquedas de texto en lugar de cadenas 
-- se usan para buscar palabras dentro de una cadena de texto 

create fulltext index idx_article_content on article(content);











