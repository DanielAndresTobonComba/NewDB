create database vehiculos;
use vehiculos;

drop table Empleado;
drop table Vehiculo;

-- Creacion de la tabla vehiculo 

create table Vehiculo (
	vhc_id int primary key, 
    marca varchar(50) not null, 
    modelo varchar(50) not null, 
    matricula varchar(50) not null, 
    AñoFabricacion int not null
);



-- Creacion de la tabla empleado 
create table Empleado (
	e_id int primary key, 
    Apellidos varchar(50) not null, 
    Nombre varchar(50) not null, 
    vhc_id int , 
    foreign key (vhc_id) references Vehiculo(vhc_id)
);


-- Inserccion de los datos de la tabla vehiculo 
insert into Vehiculo(vhc_id, marca, modelo, matricula, AñoFabricacion) values
(1 , "VW" , "Caddy" , "C 000 YZ" , 2016),
(2 , "OPEL" , "ASTRA" , "C 001 YZ" , 2010),
(3 , "BMW" , "X6" , "C 002 YZ" , 2017),
(4 , "Porsche" , "Boxster" , "C 003 YZ" , 2018);

-- Inserccion de los datos de la tabla empleado 
insert into Empleado (e_id, Apellidos, Nombre, vhc_id  ) values 
(1 , " Garcia Hurtado" , "Macarena", 3),
(2 , " Ocaña Martinez" , "Francisco", 1),
(3 , " Gutierrez Doblado" , "Elena", 1), 
(4 , " Hernandez Soria" , "Manuela", 2), 
(5 , " Olivia Cansino" , "Andrea", NULL);
	

-- CONSULTAS 
-- Muestre los empleados con sus vehiculos 

select *
from Empleado as e
left join Vehiculo as v on e.vhc_id = v.vhc_id;

-- Muestre todos los empleados con los vehiculos que tengan asignados. 
-- Si hay algun vehiculo qe no haya sido asignado , tambien mostrarlo 

select * 
from Empleado as e
right join Vehiculo as v on e.vhc_id = v.vhc_id;



-- full join 
-- mostrar todo tenga o no tenga vehiculo 	

(select e.* , v.*
from Empleado as e
left join Vehiculo as v on e.vhc_id = v.vhc_id

union 

select e.* , v.*
from Empleado as e
right join Vehiculo as v on e.vhc_id = v.vhc_id
where v.vhc_id IS NULL or v.vhc_id IS not NULL );