create database tareaCursos;
use tareaCursos; 


create table departamento (
id int primary key auto_increment,
nombre varchar(50) not null
); 

create table profesor (
id_profesor int primary key,
id_departamento int,
foreign key (id_departamento) references departamento (id)
Foreign Key (id_profesor) REFERENCES persona(id)
);

create table grado (
id int primary key auto_increment,
nombre varchar(50) not null
);

create table asignatura (
id int primary key auto_increment,
nombre varchar(100) not null,
creditos float not null,
tipo varchar(50) not null,
curso TINYINT(3),
cuatrimestre TINYINT(3),
id_profesor int,
id_grado int,
foreign key (id_profesor) references profesor (id_profesor),
foreign key (id_grado) references grado (id)
);

create table persona (
id int primary key auto_increment,
nif varchar(9) not null,
nombre varchar(25) not null,
apellido1 varchar(50) not null,
apellido2 varchar(50) not null,
ciudad varchar(25) not null,
direccion varchar(50) not null,
telefono varchar(9) not null,
fecha_nacimiento  date not null,
sexo ENUM('H', 'M') not null,
tipo varchar(25),
id_profesor int,
foreign key (id_profesor) references profesor (id_profesor)
);

create table alumno_se_matricula_asignatura (
id_alumno int(10),
id_asignatura int(10),
id_curso_escolar int(10),
foreign key (id_alumno) references persona (id),
foreign key (id_asignatura) references asignatura (id),
foreign key (id_curso_escolar) references curso_escolar (id)
);

create table curso_escolar (
id int primary key auto_increment,
año_inicio year(4),
año_fin year(4)
);