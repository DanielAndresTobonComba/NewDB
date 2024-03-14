DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DOUBLE NOT NULL,
id_fabricante INT UNSIGNED NOT NULL,
FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);


-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.

select p.nombre , p.precio , f.nombre as Fabricante
from producto as p 
left join fabricante as f on f.id = p.id_fabricante ;


/*
Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden
alfabético.
*/

select p.nombre , p.precio , f.nombre as Fabricante
from producto as p 
left join fabricante as f on f.id = p.id_fabricante 
order by Fabricante asc; 


/*
Devuelve una lista con el identificador del producto, nombre del producto, identificador del
fabricante y nombre del fabricante, de todos los productos de la base de datos. 
*/

select p.id as id_producto , p.nombre as Nombre_Producto , f.id as id_fabricante , f.nombre as Fabricante
from producto as p 
left join fabricante as f on f.id = p.id_fabricante 
order by Fabricante asc; 


use tienda;

select * from producto ;
select * from fabricante;

/*
Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
*/

select * from producto 
where precio = ( select  min(precio)  from producto );


/* 
Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
*/

select * from producto 
where precio = ( select  max(precio)  from producto );


/*
Devuelve una lista de todos los productos del fabricante Lenovo.
*/

select * from producto as p 
right join fabricante as f on f.id = p.id_fabricante
where f.nombre = "Lenovo";


/* 
Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
*/

select * from producto as p 
right join fabricante as f on f.id = p.id_fabricante
where f.nombre = "Crucial" and p.precio > 200;


/*
Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy y Seagate. Sin utilizar el operador IN.
*/

select * from producto as p 
inner join fabricante as f on f.id = p.id_fabricante
where f.nombre = "Asus" or f.nombre = "Hewlett-Packard" or f.nombre = "Seagate" ;


/* 
Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
*/

select * from producto as p 
inner join fabricante as f on f.id = p.id_fabricante
where f.nombre in ("Asus", "Hewlett-Packard" , "Seagate" ) ;


/*
Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
*/

select *  from fabricante
where substring(nombre , length(nombre)  , length(nombre) )  = "e"  ;

/*
Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
*/

select p.nombre , p.precio , f.nombre as Fabricante from producto as p
left join fabricante as f on f.id = p.id_fabricante
where locate("w" , f.nombre) ;



/*
Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los
productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar
por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
*/

select p.nombre , p.precio , f.nombre as Fabricante from producto as p
left join fabricante as f on f.id = p.id_fabricante
where p.precio >= 180 
order by p.precio desc , p.nombre asc ;



/*
Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
*/

select distinct f.nombre as Fabricante , f.id from producto as p
left join fabricante as f on f.id = p.id_fabricante
where f.id = p.id_fabricante;



/*
14
Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los
productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes
que no tienen productos asociados.
*/

select *
from fabricante as f 
left join producto as p on f.id = p.id_fabricante;



 /* 
 15. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
 */

select * 
from fabricante as f
where f.id not in  (select f.id
	from fabricante as f 
	right join producto as p on f.id = p.id_fabricante )  ;
    
    
/*
16. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
*/


/* 
17
Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
*/

select *
from producto as p , fabricante as f
where f.id = p.id_fabricante  and f.nombre = "Lenovo";


/* 
Devuelve todos los datos de los productos que tienen el mismo precio que el producto más 
caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
*/

select *  
from producto as p , fabricante as f 
where f.id = p.id_fabricante  and p.precio = ( select max(p.precio) as precio_alto
				from producto as p , fabricante as f   
                where f.nombre = "lenovo" and  f.id = p.id_fabricante ) ; 
                
select * , max(precio)
from producto 
where precio = '559'
;	

/* 
19 Lista el nombre del producto más caro del fabricante Lenovo.
*/ 

select p.nombre
from producto as p , fabricante as f
where f.id = p.id_fabricante  and f.nombre = "Lenovo"
order by p.precio desc
limit 1;


/*
20.Lista el nombre del producto más barato del fabricante Hewlett-Packard.
*/

select p.nombre
from producto as p , fabricante as f
where f.id = p.id_fabricante  and f.nombre = "Hewlett-Packard"
order by p.precio asc
limit 1;


/* 
21. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al
producto más caro del fabricante Lenovo.
*/ 



select distinct p.nombre , p.precio , f.nombre
	from  producto as p , fabricante as f 
	where f.id = p.id_fabricante and p.precio >= (
			select p.precio
			from producto as p , fabricante as f
			where f.id = p.id_fabricante and f.nombre = "Lenovo"
			order by p.precio desc
			limit 1);






/*
22. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
*/

select * , (select format( avg(precio ), 0)  from producto) as precio_promedio
from producto as p , fabricante as f 
where  f.id = p.id_fabricante and  precio > (select  avg(precio ) as precio_promedio
												from producto) and f.nombre = "Asus";


    
     















