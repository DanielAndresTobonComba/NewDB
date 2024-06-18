use examen1;
-- Consultas

/*
Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. 
El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado.
 El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido 
 y nombre del profesor. 
 El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
*/ 

select d.nombre , p.apellido1 , p.apellido2 , p.nombre
from profesor as p left join departamento as d
on p.id_departamento = d.id
order by  d.nombre desc ,  p.apellido1 desc ,  p.apellido2 desc ;



-- 2. Devuelve un listado con los profesores que no están asociados a un departamento.

select *
from profesor as p 
where id_departamento = null or id_departamento = 'null' ; 

-- 3. Devuelve un listado con los departamentos que no tienen profesores asociados.

select * from departamento as d
where d.id not in (
	select id_departamento
	from profesor
	group by id_Departamento);


-- 4. Devuelve un listado con los profesores que no imparten ninguna asignatura.

select * 
from profesor as p , asignatura as a 
where p.id != a.id_profesor;

select *
from profesor 
where id not in(
select distinct a.id_profesor 
from asignatura as a
order by id_profesor desc);

/* 
5. Devuelve un listado con las asignaturas que no tienen un profesor asignado.
*/
select * 
from asignatura 
where id_profesor is null;


/*
6. Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya 
impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento 
y el nombre de la asignatura que no se haya impartido nunca.
*/

/*
NO SE PUEDE HACER 
JUSTIFICACION
LA BASE DE DATOS DEBERIA TENER UNA RELACION DIRECTA ENTRE DEPARTAMENTO Y ASIGNATURA 
YA QUE ES IMPOSIBLE SABER A QUE DEPARTAMENTO PERTENECE UNA ASIGNATURA YA QUE HAY MUCHOS PROFESORES QUE NO 
DICTAN ASIGNATURAS Y ESTA ENTIDAD ES EL PUENTE ENTRE DEPARTAMENTO Y ASIGNATURA PARA LUEGO RELACIONAR CON 
ALUMNO_SE_MATRICULA_ASIGNATURA PARA LUEGO PASAR A CURSO_ESCOLAR
*/

select * 
from asignatura as a , alumno_se_matricula_asignatura as ama , curso_escolar as ce 
where a.id = ama.id_asignatura and ce.id = ama.id_curso_escolar and a.id = ama.id_asignatura;

-- 7. Devuelve el número total de **alumnas** que hay

select *
from alumno
where sexo = 'M';

-- 8. Calcula cuántos alumnos nacieron en `1999`

select *
from alumno 
where year(fecha_nacimiento) = 1999;


/* 
9. Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, 
una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. 
El resultado sólo debe incluir los departamentos que tienen profesores asociados 
y deberá estar ordenado de mayor a menor por el número de profesores.
*/

select d.nombre, count(*) as NumerosProfesores
from profesor as p , departamento as d 
where p.id_departamento = d.id
group by d.nombre
order by NumerosProfesores desc;

/*
10. Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. 
Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos 
también tienen que aparecer en el listado.
*/

select d.nombre, count(p.id) as NumerosProfesores
from profesor as p right join departamento as d 
on p.id_departamento = d.id
group by d.nombre
order by NumerosProfesores desc;


/*
11. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y 
el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no 
tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. 
El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
*/

select g.nombre , count(a.id) as Grados
from grado as g left join asignatura as a 
on g.id = a.id_grado
group by g.nombre
order by Grados desc;

select *
from grado as g left join asignatura as a 
on g.id = a.id_grado;
/*
12. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el 
número de asignaturas que tiene cada uno, de los grados que tengan más de `40` asignaturas asociadas.
*/

select g.nombre , count(g.nombre) as CantidadAsignaturas
from grado as g , asignatura as a 
where g.id = a.id_grado
group by g.nombre
having CantidadAsignaturas > 40;

/*
13. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos 
que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, 
tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. 
Ordene el resultado de mayor a menor por el número total de crédidos.
*/

select sum( a.creditos) as creditos , a.tipo
from grado as g 
right join asignatura as a
on g.id = a.id_grado
group by a.tipo;

select g.nombre , sum(a.creditos) as Creditos , a.tipo
from grado as g 
left join asignatura as a
on g.id = a.id_grado
group by g.nombre , a.tipo
order by Creditos desc;

/*
14. Devuelve un listado que muestre cuántos alumnos se han matriculado en alguna asignatura en cada uno de 
los cursos escolares. El resultado deberá mostrar dos columnas, 
una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
*/

select ce.anyo_inicio as Inicio , count(ama.id_alumno) as Alumnos
from alumno as a 
inner join alumno_se_matricula_asignatura as ama on a.id = ama.id_alumno
inner join curso_escolar as ce on ce.id = ama.id_curso_escolar
group by Inicio;


/*
15. Devuelve un listado con el número de asignaturas que imparte cada profesor. 
El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. 
El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. 
El resultado estará ordenado de mayor a menor por el número de asignaturas.
*/

select p.id as Ident,  concat(p.nombre ,p.apellido1 , p.apellido2) as NombreProfesor , 
count(a.id_profesor) as Asignaturas
from profesor as p 
left join asignatura as a 
on a.id_profesor = p.id
group by p.nombre , Ident
order by Asignaturas desc ;

-- 16. Devuelve todos los datos del alumno más joven.

select * 
from alumno
order by fecha_nacimiento
limit 1;

-- 17. Devuelve un listado con los profesores que no están asociados a un departamento.

select *
from profesor as p 
where p.id_Departamento is null;

-- 18. Devuelve un listado con los departamentos que no tienen profesores asociados.


select * 
from departamento 
where id not in(
	select p.id_departamento as Departamentos
	from profesor as p  
	inner join departamento as d
	on p.id_departamento = d.id
	group by Departamentos);
    
    
    
-- 19. Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.

select * 
from profesor 
where id not in (
	select a.id_profesor
	from profesor as p  
	inner join departamento as d on p.id_departamento = d.id
	inner join asignatura as a on a.id_profesor = p.id
    group by a.id_profesor);


-- 20. Devuelve un listado con las asignaturas que no tienen un profesor asignado.

select *
from asignatura 
where id_profesor is null;

