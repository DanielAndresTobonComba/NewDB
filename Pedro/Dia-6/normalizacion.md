###Apuntes dia 5 

-- Normalizacion de base de datos 
-- Ques es normalizar? Reducir posibles redundancias de datos para mejorar la integridad 

/* Pasos principales

Primera forma (1NF) Reducir
Eliminar las repeticiones de datos y asegurar con ello que cada columna contenga un solo valor 
atomico (atomico es un dato que no se puede dividir)

Ej: nombreCompleto: Pedro Felipe Gomez Bonilla --> Es atomico? 
RTA: No ,  por que se puede dividir en nombre y apellidos 

Ej2: nombre= Pedro Felipe , apellido = Gomez Bonilla --> Es atomico?
RTA: Depende del diseñador 


*/

-- EX1 El siguiente quert esta normalizado? 

create database dia6; 
use dia6;

create table Estudiente(
	Id int,
    Nombre varchar(100),
    Telefono varchar(15)
);

/*No porque el usuario esta ingresando el nombre completo en un solo atributo igual el telefono incluyendo 
la extension

Como se puede normalizar habiendo creado la tabla anteriormente?
*/

create table Estudiante (
	id_estudiante varchar(10) primary key,
    nombre_Estudiante varchar(50) not null
);

create table Curso(
	id_curso varchar(10) primary key,
	nombre_curso varchar(50),
    nombre_profesor varchar(50)
);

create table Estudiante_Curso (
	id_estudiante varchar(10),
    id_curso varchar(10),
    foreign key (id_estudiante ) references Estudiante(id_estudiante),
	foreign key (id_curso) references Curso(id_curso)
);