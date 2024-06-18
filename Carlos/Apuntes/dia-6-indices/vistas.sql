
-- VISTAS 
-- objetos de la bases de datos que presenta una consulta de la bases de datos y se generan cuando la consulta es solicitada 
-- utiles para consultas complejas , mas seguro y facilita reutilizar consultas 

create VIEW tPopulationCity as
    select *
        from (
            select Name as cityName, Population, CountryCode
            from city
            order by Population desc
        ) as ciudades
        
        inner join (
            select Code, Name as CountryName, Continent
                from country
        ) as countryFilter on ciudades.CountryCode = countryFilter.Code
        
        where Continent <> 'Oceania' and Continent <> 'Antarctica';

DROP TABLE tPopulationCity;

select *
    from (
        select *
        from (
            select Code, CountryName, CityName, Continent, format(Population, 0) as PopulationCity
            from tPopulationCity
            where Continent = 'South America' or Continent = 'North America'
            order by Population desc
            limit 5
        ) as PopulationCitiesAmerica

        union

        select *
            from (
                select Code, CountryName, CityName, Continent, format(Population, 0) as PopulationCity
                from tPopulationCity
                where Continent = 'Europe'
                order by Population desc
                limit 5
            ) as PopulationCitiesEurope

        union

        select *
            from (
                select Code, CountryName, CityName, Continent, format(Population, 0) as PopulationCity
                from tPopulationCity
                where Continent = 'Asia'
                order by Population desc
                limit 5
            ) as PopulationCitiesAsia

        union

        select * 
            from (
                select Code, CountryName, CityName, Continent, format(Population, 0) as PopulationCity
                from tPopulationCity
                where Continent = 'Africa'
                order by Population desc
                limit 5
            ) as PopulationCitiesAfrica
    ) as orderCitiesPopulation
    order by Continent asc, CityName desc;




-- sintaxis para crear una vista
create VIEW nombre_vista as 
		select columnas 
        from tablas 
        where condiciones;	
        


-- SINTAXIS PARA CREAR O REEMPLAZAR UNA VISTA
create or replace VIEW nombre_vista as 
		select columnas 
        from tablas 
        where condiciones;	
        
        
-- SINTAXIS PARA SOLO REEMPLAZAR UNA VISTA 
-- PENDIENTE CODIGO CON PARAMETROS DEL PROFESOR tengo la captura



set @continent = "Asia"; 

create or replace view Population as 
	select * 
		from (
			select code , Countryname , cityName , continent , format(population , 0) as PopulationCity 
            from view_populationCity 
            where continent = @continent
            order by Population desc 
            limit 5
            
	    );



