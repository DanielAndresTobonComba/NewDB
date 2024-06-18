
use tienda;

/*
1. Calcula el número total de productos que hay en la tabla productos.
*/

select count(*) as cant
from producto;

/*
2.Calcula el número total de fabricantes que hay en la tabla fabricante.
*/

select count(*) as cant_fabricantes
from fabricante;		

/*
3. Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.
REVIZAR ESTE NO ENTIENDO EL ENUNCIADO 
*/
select count(*) as Cantidad_de_fabricantes
from (
select p.id_fabricante
from producto as p 
group by p.id_fabricante) as Cantidad;	

select count(distinct id_fabricante) 
from tienda.producto;

/*
4. Calcula la media del precio de todos los productos.
*/

select format( avg(precio) , 2)
from producto;


/*
5. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
*/

select f.nombre, max(p.precio) as Max , min(p.precio) as Min , format( avg(p.precio) , 1) as Promedio , count(p.nombre) as Productos
from producto as p
inner join fabricante as f on p.id_fabricante = f.id
where f.nombre = "Crucial";



/* 
6. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado
también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará
dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene.
Ordene el resultado descendentemente por el número de productos.
*/

select f.nombre , count(p.nombre) as Productos 
from producto as p 
right join fabricante as f on p.id_fabricante = f.id 
group by f.nombre
order by Productos desc ;


/*
7. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los
fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se
solicitan.
*/

select f.id , f.nombre , max(p.precio) as Max , min(p.precio) as Min , avg(p.precio) as Media 
from producto as p 
left join fabricante as f on p.id_fabricante = f.id 
group by f.id
order by f.id;


/*
8. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de
los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el
nombre del fabricante, con el identificador del fabricante es suficiente.
*/

select * 
	from (
		select f.id , 
		max(p.precio) as Max , 
		min(p.precio) as Min , 
		avg(p.precio) as Media ,
		count(*) as Cantidad_productos
	from producto as p 
	right join fabricante as f on p.id_fabricante = f.id 
	group by f.id) as tabla
where Media > 220; 


/*
9. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio
medio y el número total de productos de los fabricantes que tienen un precio medio superior
a 200€. Es necesario mostrar el nombre del fabricante.
*/

select * 
	from (
	select f.nombre , 
		max(p.precio) as Max , 
        min(p.precio) as Min , avg(p.precio) as Media , 
        count(p.id_fabricante) as Cant_Productos

	from producto as p 
	right join fabricante as f on p.id_fabricante = f.id 
	group by f.nombre) as tabla
where Media > 200; 





select f.nombre , 
	max(p.precio) as Max , 
	min(p.precio) as Min , avg(p.precio) as Media , 
	count(p.id_fabricante) as Cant_Productos

from producto as p 
right join fabricante as f on p.id_fabricante = f.id 
group by f.nombre
having Media > 200;







/*
10. Calcula el número de productos que tienen un precio mayor o igual a 180€.
*/

select count(nombre) as Cantidad_Productos
from producto
where precio > 180;	

select count(*)  as Cantidad_Productos 
from (
select *
from producto
where precio > 180) as tabla;	


/*
11. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
*/

select f.nombre , count(p.nombre) as Cant_Productos 
from producto as p 
left join fabricante as f on f.id = p.id_fabricante
where p.precio > 180
group by f.nombre 
order by Cant_Productos desc;
