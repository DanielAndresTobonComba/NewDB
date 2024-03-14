create schema hospital;
drop schema hospital;
use hospital;
-- EJERCICIO 5 

CREATE TABLE paciente (
	paciente_id int primary key ,
    nombre_paciente varchar(100),
    fechaNacimiento date
);



create table medico (
	medico_id int primary key , 
    nombre_medico varchar(50),
    especialidad varchar (100) 
);

create table tratamiento (

	id_trata int,
    medico_id int, 
    id_paciente int,
    
    -- id_medicamentos int,
    
    descripcion_tratamiento text ,
	fecha_cita datetime,
    
    foreign key ( medico_id) references medico (medico_id), 
    foreign key (id_paciente) references paciente (paciente_id),
    
                    
    /* foreign key (id_medicamentos) references 
					medicamentos_tratamiento (id_tratamiento_medicamentos),*/
    
    primary key (id_trata)
); 

drop table tratamiento;


create table medicamentos_tratamiento (
	id_tratamiento_medicamentos int,
		foreign key (id_tratamiento_medicamentos ) references tratamiento(id_trata),
    
	id_medicamento int ,
    foreign key (id_medicamento) references medicamento (id_medicamento),
    
    dosis varchar(50)
);

create table medicamento (
	id_medicamento int primary key ,
    nombre varchar(50)
); 

select p.paciente_id as idPaciente , p.nombre_paciente as NombrePaciente  , m.medico_id  as idMedico , t. descripcion_tratamiento as Tratamiento
	from paciente as p , medico as m , tratamiento as t 
    where p.paciente_id = t.id_paciente and m.medico_id = t. medico_id and year( t.fecha_cita ) = '2022';
    
    
    
    
    
    
    
	
    