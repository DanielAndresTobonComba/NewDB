-- Active: 1710891255909@@127.0.0.1@3306@tienda
/*
1. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €
*/


use ventas;

select * from cliente;
select * from comercial;

select * from pedido;


select concat( c.nombre , " " , c.apellido1 , " " , c.apellido2 )  as nombreCompleto , c.ciudad as Ciudad
from cliente as c
right join pedido as p on p.id_cliente = c.id 
where YEAR(p.fecha) = 2017 and  p.total BETWEEN 300 and 1000 ;
 

 /*
2. Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
 */

 select concat( c.nombre , " " , c.apellido1 , " " , c.apellido2 )  as nombreCompleto
 from Comerciante