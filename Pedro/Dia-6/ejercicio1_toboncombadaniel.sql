

-- EJERCICIO CASA: CREAR LA 2NF DE ACUERDO A LAS INDICACIONES DADAS EN CLASE 


create table Estudiante (
	id_estudiante varchar(10),
    nombre_Estudiante varchar(50) not null
);

create table Curso(
	id_curso varchar(10),
	nombre_curso varchar(50),
    nombre_profesor varchar(50)
);

create table Estudiante_Curso (
	id_estudiante varchar(10),
    id_curso varchar(10),
);


INSERT INTO Estudiante values
    ('E01','Ana'),
    ('E02','Juan'),
    ('E03','Maria'),
    ('E04','Pedro');

insert into Curso VALUES
    ('C101','Matematicas'),
    ('C102','Historia'),
    ('C103','Fisica');
insert into Estudiante_curso VALUES
    ('E01','C101'),
    ('E02','C102'),
    ('E03','C101'),
    ('E04','C103');

    ('E01','Ana','C101','Matematicas', 'Sr. Garcia' ),
    ('E02','Juan','C102','Historia', 'Sra. Lopez' ),
    ('E03','Maria','C101','Matematicas', 'Sr. Garcia' ),
    ('E04','Pedro','C103','Fisica', 'Sr. Hernandez' );