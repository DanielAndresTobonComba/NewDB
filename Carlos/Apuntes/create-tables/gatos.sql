-- TALLER 

create table gatos (
	id int primary key, 
    name varchar(50), 
    breed varchar(50),
    coloration varchar(50), 
    age int, 
    sex varchar(10), 
    fav_toy varchar (20)
);

select * from gatos 
where sex = "M" and fav_toy = Null  ; 


select id , name , breed , coloration from gatos 
where breed = "Persa" or breed = "Siames" and sex = "F" and fav_toy = "Provocador" ;

 create table Prestamo (
	id int primary key ,
    id_libro int,
    fechaPrestamo date,
    fechaDevolucion date,
    foreign key(id_libro) references libro(id)
);