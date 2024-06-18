create database examenDanielTobon;
use examenDanielTobon;

CREATE TABLE equipamiento (
id_equipamiento int primary key,
nombre_equipos varchar(100) not null,
stock int not null
);

create table evento_equipo (
id_evento_equipo int primary key,
id_evento int not null,
id_equipamiento int not null
);

create table eventos (
id_evento int primary key,
nombre varchar(100) not null,
fecha datetime not null,
duracion time not null,
num_participantes int not null
);


create table evento_complejo_poli (
id_evento_complejo int primary key,
id_evento int not null,
id_complejo int not null
);

create table evento_comisario (
id_evento_comisario int primary key,
id_evento int not null,
id_comisario int not null
);


create table comisario (
id_comisario int primary key,
nombre varchar(100) not null,
email varchar(100) not null,
telefono varchar(20) not null,
tipo enum('juez' ,'observador') not null
);

create table complejo_polideportivo (
id_complejo_polideportivo int primary key,
nombre varchar(100) not null,
id_deporte int not null,
id_info_complejo int not null
);

create table complejo_deportivo (
id_complejo_deportivo int primary key,
nombre varchar(100) not null,
id_deporte int not null,
id_info_complejo int not null
);


create table evento_complejo_deportivo (
id_evento_complejo_deportivo int primary key,
id_evento int not null,
id_complejo int not null
);

create table deportes (
id_deporte int primary key,
nombre varchar(100) not null,
num_jugadores int not null
);

create table info_complejo (
id_complejo int primary key,
locacion varchar(100) not null,
area_complejo float not null,
id_jefe int not null
);

create table sede (
id_sede int primary key,
nombre varchar(100) not null,
id_complejo int not null,
presupuesto float not null
);

create table jefes (
id_jefe int primary key,
nombre varchar(100) not null,
email varchar(100) not null,
titulo varchar(100) not null
);

show tables;






