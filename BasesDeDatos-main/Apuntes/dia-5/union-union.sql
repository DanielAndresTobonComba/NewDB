
-- Varias uniones dentro una misma tabla 

select * from (

	( (select ct.name,  FORMAT(ct.population, '#,0'), c.continent
		from country as c
		inner join city as ct on c.code = ct.countrycode
		where c.continent = "Europe" 
		order by ct.population desc
		limit 5)

	union 

	(select ct.name,  FORMAT(ct.population, '#,0') , c.continent
		from country as c
		inner join city as ct on c.code = ct.countrycode
		where c.continent = "Asia" 
		order by ct.population desc
		limit 5) 
    
		union
        
       ( (select ct.name, FORMAT(ct.population, '#,0') , c.continent
		from country as c
		inner join city as ct on c.code = ct.countrycode
		where c.continent in ("North America" , "South America")
		order by ct.population desc
		limit 5) 
        
			union
            
           ( (select ct.name, FORMAT(ct.population, '#,0') , c.continent
				from country as c
				inner join city as ct on c.code = ct.countrycode
				where c.continent in ("Oceania")
				order by ct.population desc
				limit 5)
                
					union 
                    
                    (select ct.name,  FORMAT(ct.population, '#,0') , c.continent
						from country as c
						inner join city as ct on c.code = ct.countrycode
						where c.continent in ("Africa")
						order by ct.population desc
						limit 5)
				)
			)
		)

) as Gran_tabla 
order by continent , name desc ;
