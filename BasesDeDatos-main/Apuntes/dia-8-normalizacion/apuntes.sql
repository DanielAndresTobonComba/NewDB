-- APUNTES 
-- SESION 7
-- NORMALIZACION DE BASES DE DATOS 

CREATE TABLE estudiante (
	id int primary key , 
    nombre varchar (100),
    -- telefonos varchar (255) 
);

create table telefonos (
	id_est int,
    telefono int ,
    foreign key (id_est) references estudiante (id),
    primary key (id_est , telefono) 
);

/* la primary key es compuesta el id del estudiante y el telefono de ese estudiante asi se diferencia con la id del estudiante */





-- EJERCICIO 2

create table curso (
	id int primary key ,
    nombre_curso varchar(100)
); 

CREATE TABLE  CursoEstudiante (
	curso_id int ,
    est_id int , 
    primary key (curso_id , est_id),
    foreign key (id_curso) references curso(id_curso),
    foreign key (id_estudiante) references estudiante (id_estudiante)
);


create table estudiante(
	est_id int primary key,
    nombre_est varchar(100)
);


-- Ejercicio 3 

create table profesor (
    profesor_id int primary key,
    depart_id int,
    nombre varchar (100),
    foreign key (depart_id) references departamento(departamento_id)
);


create table departamento (
	departamento_id int primary key , 
    nombre_depart varchar(50)
);


-- EJERCICIO 4 

create table profesor (
	profesor_id int , 
    nombre varchar(50)
);

create table asignacion (
	profesor_id int ,
    curso_id int ,
    primary key (profesor_id , curso_id),
    foreign key (profesor_id) references profesor (profesor_id),
    foreign key (curso_id) references curso(curso_id)

); 

create table curso(
	curso_id int primary key , 
    nombre_curso varchar(50)
); 


create table curso_has_horarios (
	curso_id int , 
    id_horario int primary key,
    foreign key (curso_id) references curso (curso_id),
    foreign key (id_horario )references horarios (horario_id) ,
    primary key (id_horario , curso_id)
);


create table horarios (
	horario_id int primary key,
    hora_curso time
    );













