-- Active: 1714005429713@@127.0.0.1@3306@prueba

CREATE DATABASE Persona;
use Persona;

CREATE TABLE Persona (
    idPersona INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    nombre VARCHAR(25) NOT NULL, 
    apellido VARCHAR(25) NOT NULL, 
    fechaNacimiento DATETIME NOT NULL, 
    cedula VARCHAR(25) NOT NULL, 
    genero VARCHAR(15) NOT NULL, 
    email VARCHAR(25) NULL,
    numContacto VARCHAR(25) NULL,
    edad INT NULL, 
    tipoPersona INT, 
    FOREIGN KEY (tipoPersona) REFERENCES TipoPersona (idTipo)
);

CREATE TABLE TipoPersona (
    idTipo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cargo VARCHAR(25)
);
