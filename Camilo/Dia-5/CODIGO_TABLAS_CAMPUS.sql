-- Active: 1714005429713@@127.0.0.1@3306@prueba
use prueba; 

CREATE table Instituto (
    Id_instituto int PRIMARY KEY AUTO_INCREMENT, 
    Nombre VARCHAR(25) not null , 
    Dirreccion varchar(25) not null 
);


create table Coordinador (
    Id_coordinador int primary key AUTO_INCREMENT,
    Nombre varchar(25) not null , 
    Apellidos varchar(25) not null , 
    Email varchar(50) not null , 
    Edad int not null,
    Id_instituto int,
    Foreign Key (Id_instituto) REFERENCES Instituto (Id_instituto)
); 


CREATE TABLE Salon_clase (
    Id_Salon INT PRIMARY KEY AUTO_INCREMENT,
    Nombre_Salon VARCHAR(20) NOT NULL,
    Cant_equipos INT NOT NULL,
    Id_Instituto INT,
    FOREIGN KEY (Id_Instituto) REFERENCES Instituto (Id_instituto)
);


create table Camper_Salon (
    Id_Camper int , 
    Id_Salon int , 
    Foreign Key (Id_Camper) REFERENCES Camper (Id_Camper), 
    Foreign Key (Id_Salon) REFERENCES Salon_clase  ( Id_Salon)
);


create table Camper(
    Id_Camper INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(25) not null, 
    Apellido VARCHAR(25) not null,
    Email VARCHAR(25) not null,
    Edad int not null,
    Campcoins int not null
);



create table Grupo_Estudio (
    Id_Grupo_estudio int PRIMARY KEY AUTO_INCREMENT, 
    Nombre varchar(25) NOT NULL,
    Id_trainer int , 
    Foreign Key (Id_trainer) REFERENCES Trainer (id_trainer),
    id_asignatura int,
    Foreign Key (id_asignatura) REFERENCES Asignatura (id_asignatura)
);

create Table Modulos (
    id_modulo int PRIMARY KEY AUTO_INCREMENT, 
    Nombre VARCHAR(20)
);




create table Trainer (
    id_trainer int PRIMARY KEY AUTO_INCREMENT, 
    Nombre VARCHAR(25), 
    Apellido VARCHAR(25)
);


CREATE TABLE Sesion (
    id_sesion INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(25) NOT NULL,
    descripcion TEXT,
    id_modulo INT,
    id_salon_clase INT,
    FOREIGN KEY (id_modulo) REFERENCES Modulos (id_modulo),
    FOREIGN KEY (id_salon_clase) REFERENCES Salon_clase (Id_Salon)
);


CREATE TABLE Ruta (
    id_ruta INT PRIMARY KEY AUTO_INCREMENT, 
    Nombre VARCHAR(25) NOT NULL
);


CREATE TABLE Ruta_Modulos (
    id_ruta int, 
    id_modulo int,
    Descripcion TEXT , 
    FOREIGN KEY (id_ruta) REFERENCES Ruta (id_ruta), 
    FOREIGN KEY (id_modulo) REFERENCES Modulos (id_modulo)
);

create table Asignatura(
    id_asignatura INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(25),
    id_ruta INT ,
    FOREIGN KEY (id_ruta) REFERENCES Ruta(id_ruta), 
    Duracion VARCHAR(20)
);

create table Camper_grupo (
    id_camper INT,
    id_grupo INT, 
    FOREIGN KEY (id_camper) REFERENCES Camper (Id_Camper),
    FOREIGN KEY (id_grupo) REFERENCES Grupo_Estudio (Id_Grupo_estudio)
);