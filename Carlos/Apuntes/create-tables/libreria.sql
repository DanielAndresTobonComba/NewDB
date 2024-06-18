
-- RELACIONES ENTRE TABLAS 
-- RELACION DE UNO A MUCHOS 

create database biblioteca; -- create schema biblioteca

use biblioteca;

-- crear la tabla libro 
create table libro (
	ID int primary key ,
    Titulo varchar(100), 
    Autor varchar(100)
);


-- Crear la tabla prestamos
 create table Prestamo (
	id int primary key ,
    id_libro int,
    fechaPrestamo date,
    fechaDevolucion date,
    foreign key(id_libro) references libro(id)
);


-- RELACION DE MUCHOS A MUCHOS 
-- Estudiantes e Inscripcion a cursos (N:M) 

create table estudiante(
	id int primary key , 
    nombre varchar(100)
);


create table curso (
	id int primary key, 
    nombre varchar(100),
    descripcion text
);


create table inscripcion(
	idestudiante int,
    idcurso int, 
    fechainscripcion date, 
    primary key( idestudiante , idcurso),
    foreign key (idestudiante) references estudiante(id), 
    foreign key (idcurso) references curso(id)
);
