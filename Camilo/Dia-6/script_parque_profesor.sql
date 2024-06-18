-- Active: 1714005429713@@127.0.0.1@3306@parquesIncompleto

create database parquesIncompleto;

use parquesIncompleto; 

create table Entidad(
    idEntidad INT PRIMARY KEY AUTO_INCREMENT, 
    nombre varchar(45)
); 


CREATE TABLE Departamento (
    idDepartamento INT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(25), 
    idEntidad INT,
    Foreign Key (idEntidad) REFERENCES Entidad(idEntidad)
);


CREATE TABLE ParqueNatural (
    idParque INT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(30) not null, 
    fecha DATETIME not null
); 

CREATE TABLE DepartamentoParque (
    idDeptParque INT PRIMARY KEY AUTO_INCREMENT, 
    idDepartamento INT, 
    idParqueNatural INT, 
    FOREIGN KEY (idDepartamento) REFERENCES Departamento(idDepartamento), 
    FOREIGN KEY (idParqueNatural) REFERENCES ParqueNatural(idParque)
);


CREATE TABLE AreaParque (
    idAreaParque INT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(25) not null, 
    extension DOUBLE, 
    idParque INT, 
    Foreign Key (idParque) REFERENCES ParqueNatural(idParque)
);



CREATE TABLE tipoEspecie (
    id int PRIMARY key AUTO_INCREMENT, 
    descripcion VARCHAR(200)
);

create Table Especie (
    idEspecie int PRIMARY key AUTO_INCREMENT,  
    nombreCientifico VARCHAR(40), 
    nombreVulgar VARCHAR(40), 
    densidadPoblacional int, 
    idAreaParque int,
    idTipoEspecie int,
    Foreign Key (idAreaParque) REFERENCES AreaParque(idAreaParque), 
    Foreign Key (idTipoEspecie) REFERENCES tipoEspecie(id)
);


CREATE Table Trabajador (
    idTrabajador int PRIMARY key AUTO_INCREMENT, 
    nombre VARCHAR(25) not null,
    cedula int not null,
    dirreccion VARCHAR(25) not null,
    sueldo DOUBLE not null,
    idParque int,
    Foreign Key (idParque) REFERENCES ParqueNatural(idParque)
);

CREATE Table Telefono (
    idTelefono int PRIMARY key AUTO_INCREMENT,
    numFijo int NOT null, 
    numMovil int not null,
    idTrabajador int,
    Foreign Key (idTrabajador) REFERENCES Trabajador(idTrabajador)
);


create table gestionTrabajador (
    id INT PRIMARY KEY AUTO_INCREMENT,
    entradaParque VARCHAR(25) not null,
    idTrabajador int,
    idAreaParque int,
    Foreign Key (idTrabajador) REFERENCES Trabajador(idTrabajador),
    Foreign Key (idAreaParque) REFERENCES AreaParque(idAreaParque)
);

drop table gestionTrabajador;

create table Entrada (
    idEntrada int PRIMARY key AUTO_INCREMENT,
    numEntrada int not null,
    ubicacion VARCHAR(25) not NULL,
    idParque int,
    Foreign Key (idParque) REFERENCES ParqueNatural(idParque)
);

INSERT INTO Entidad (idEntidad, nombre) 
VALUES 
    (1, "Agencia de Conservacion Ambiental"),
    (2, 'Agencia de Protección Ambiental'),
    (3, 'Comisión Nacional del Medio Ambiente'),
    (4, 'Agencia de Protección Ambiental de EE. UU.'),
    (5, 'Ministerio del Ambiente y Recursos Naturales');



INSERT INTO Departamento (nombre , idEntidad)
values 
        ("Gestor Fk" , 1), 
        ("CAR" , 5),
        ("FBI" , 3), 
        ("DEA" , 2),
        ("Pentagono" , 1);


INSERT INTO ParqueNatural (nombre, fecha)
VALUES 
    ('Parque Nacional Yellowstone', '2022-05-01'),
    ('Parque Nacional Yosemite', '2022-06-15'),
    ('Parque Nacional Gran Cañón', '2022-07-20'),
    ('Parque Nacional Everglades', '2022-08-10'),
    ('Parque Nacional Acadia', '2022-09-05');

select * from `ParqueNatural`;

insert into DepartamentoParque (idDepartamento,idParqueNatural )
VALUES 
    (1,5),
    (7,3), 
    (8,3), 
    (9,1),
    (10,2);

INSERT INTO AreaParque(nombre, extension, idParque)
VALUES 
    ('Parque Esmeralda ', 1000.5, 1),
    ('Parque Aurora Boreal', 800.75, 3),
    ('Parque Cielos Azules', 1200.25, 2),
    ('Parque Cerezos', 1500.0, 5),
    ('Parque Cascadas Plateadas', 900.3, 4);

INSERT INTO tipoEspecie (descripcion)
values(    
"El Quetzal, ave nacional de Guatemala, deslumbra con su plumaje vibrante y cola larga. Habita en bosques nubosos y se alimenta de frutas y insectos."),
("La Orquídea Cattleya, conocida por sus flores exóticas y fragantes, es un símbolo de belleza en las regiones tropicales. Sus colores varían desde el blanco puro hasta el morado intenso."),
("El Granito, una roca ígnea de grano grueso, es ampliamente utilizada en la construcción y la escultura debido a su durabilidad y belleza natural. Presenta una textura granular distintiva."),
("La Ballena Azul, el mamífero más grande del planeta, se encuentra en océanos de todo el mundo. Sus cantos melódicos y su tamaño majestuoso lo hacen una maravilla de la naturaleza."),
("El Diamante, una gema preciosa de gran valor, se forma bajo presión en las profundidades de la Tierra. Con su brillo inigualable y su dureza extrema, es símbolo de lujo y eternidad.");

select * from tipoEspecie;
insert into Especie (nombreCientifico , nombreVulgar , densidadPoblacional, idAreaParque , idTipoEspecie)
values
('Elephas maximus', 'Elefante Asiático', 200, 14, 3),
    ('Quercus robur', 'Roble Común', 150, 13, 5),
    ('Homo sapiens', 'Humano', 300, 11, 2),
    ('Canis lupus', 'Lobo Gris', 80, 15, 4),
    ('Calcite', 'Calcita', 250, 12, 1);



INSERT INTO Trabajador (nombre, cedula, dirreccion, sueldo, idParque)
VALUES 
    ('Juan Pérez', '123456789', 'Calle Principal 123', 2500, 3),
    ('María García', '987654321', 'Avenida Central 456', 2800, 2),
    ('Carlos Rodríguez', '567890123', 'Plaza Mayor 789', 3000, 4),
    ('Ana Martínez', '321098765', 'Callejón Secreto 246', 2700, 1),
    ('Luis López', '456789012', 'Paseo del Parque 135', 2600, 5);

select * from `ParqueNatural`;

INSERT INTO Telefono (numFIjo, numMovil, idTrabajador)
VALUES 
    (22558899, 55123456, 3),
    (33221100, 55987654, 2),
    (44332211, 55789012, 4),
    (55443322, 55321098, 1),
    (66554433, 55567890, 5);


INSERT INTO gestionTrabajador (entradaParque, idTrabajador, idAreaParque)
VALUES 
    ('Puerta Principal', 1, 11),
    ('Puerta Este', 2, 12),
    ('Puerta Norte', 3, 13),
    ('Puerta Oeste', 4, 14),
    ('Puerta Sur', 5, 15);

INSERT INTO Entrada (numEntrada, ubicacion, idParque)
VALUES 
    (3, 'Norte', 1),
    (7, 'Este', 2),
    (5, 'Oeste', 3),
    (1, 'Sur', 4),
    (9, 'Nordeste', 5);


