
-- 1. Consulta de Todos los Eventos en un Complejo Deportivo Específico.
select * 
from complejo_deportivo as cd 
inner join evento_complejo_deportivo as ecd 
on cd.id_complejo_deportivo = ecd.id_complejo
inner join eventos as e 
on ecd.id_evento = e.id_evento
where cd.id_complejo_deportivo = 3 ;
-- En el where coloque el id del complejo que desea buscar


-- 2. Consulta de Comisarios Asignados a un Evento en Particular.
select * 
from evento_comisario as ec
inner join comisario as c on ec.id_evento_comisario = c.id_comisario
where ec.id_evento = '1';

-- En el where coloque el id del evento en especifico

-- 3. Consulta de Todos los Eventos en un Rango de Fechas.

select * 
from eventos
where year(fecha) = 2024 ;

select * 
from eventos
where month(fecha) between 1 and 6 ;

-- 4. Consulta del Número Total de Comisarios Asignados a Eventos.

select count(*) as NumeroTotalConEventos
from evento_comisario as ec
inner join comisario as c on ec.id_evento_comisario = c.id_comisario;


-- 5 Consulta de Complejos Polideportivos con Área Total Ocupada Superior a un Valor Específico.

select * 
from complejo_polideportivo as cp 
inner join info_complejo as ic 
on cp.id_complejo_polideportivo = ic.id_complejo
where ic.area_complejo > 10;


-- 6 Consulta de Eventos con Número de Participantes Mayor que la Media.

select *
from eventos 
where num_participantes > (select avg (num_participantes) from eventos);


-- 7. Consulta de Equipamiento Necesario para un Evento Específico.

select e.nombre_equipos as Equipo , e.stock as Cantidad
from equipamiento as e 
inner join evento_equipo as eq  on e.id_equipamiento = eq.id_equipamiento
where eq.id_evento = 3;

-- 8. Consulta de Eventos Celebrados en Complejos Deportivos con Jefe de Organización Específico.

select e.nombre , e.fecha , e.duracion , cd.nombre , j.nombre , j.email
from eventos as e
inner join evento_complejo_deportivo as ecd
on e.id_evento = ecd.id_evento_complejo_deportivo
inner join complejo_deportivo as cd 
on cd.id_complejo_deportivo = ecd.id_complejo
inner join info_complejo as ic 
on ic.id_complejo = cd.id_info_complejo
inner join jefes as j 
on ic.id_jefe = j.id_jefe
where ic.id_jefe = 3;

-- 9. Consulta de Complejos Polideportivos sin Eventos Celebrados.

select *
from complejo_deportivo 
where id_complejo_deportivo not in
	(select distinct compp.id_complejo_polideportivo
	from complejo_polideportivo as cp
	inner join evento_complejo_deportivo as ecp 
	on cp.id_complejo_polideportivo = ecp.id_evento_complejo_deportivo
	inner join complejo_deportivo as comp
	on ecp.id_complejo = comp.id_complejo_deportivo
	inner join info_complejo as ic 
	on ic.id_complejo = comp.id_complejo_deportivo
	inner join complejo_polideportivo as compp
	on compp.id_complejo_polideportivo = ic.id_complejo);


/*
10. Consulta de Comisarios que Actúan como Jueces en Todos los Eventos.
*/

select c.nombre , c.email , c.tipo
from evento_comisario as ec
inner join comisario as c on ec.id_evento_comisario = c.id_comisario
where c.tipo = 'juez';

