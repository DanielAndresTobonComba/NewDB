/*
1. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
*/

SELECT distinct f.nombre
from fabricante as f, producto as p 
where f.nombre in (SELECT f.nombre
    FROM producto AS p
    JOIN fabricante AS f ON f.id = p.id_fabricante
    GROUP BY f.id
    HAVING COUNT(*) >= 2);



-- HACER LE CONTEO INDIVIDUALMENTE


SELECT f.id , f.nombre , count(*) as productos
    FROM producto AS p
    JOIN fabricante AS f ON f.id = p.id_fabricante
    GROUP BY f.id
    HAVING COUNT(*) >= 1;


/* 2
Devuelve un listado con los nombres de los fabricantes y el número de productos que
tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre
de los fabricantes que no tienen productos que cumplan la condición.
*/

use tienda;


SELECT f.id , f.nombre , count(*) as productos
    FROM producto AS p
    JOIN fabricante AS f ON f.id = p.id_fabricante
    where p.precio >= '220'
    GROUP BY f.id
    HAVING COUNT(*) >= 1;





/*3
Devuelve un listado con los nombres de los fabricantes y el número de productos que
tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre
de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un
precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el
número de productos.
*/


SELECT f.nombre AS nombre_fabricante, COUNT(p.id) AS productos
FROM fabricante AS f
left JOIN producto AS p ON f.id = p.id_fabricante AND p.precio >= 220
GROUP BY f.nombre;

--usando coalesce

SELECT f.nombre AS nombre_fabricante, COALESCE(COUNT(p.id), 0) AS productos
FROM fabricante AS f
LEFT JOIN producto AS p ON f.id = p.id_fabricante AND p.precio >= 220
GROUP BY f.nombre;

--OTRA FORMA DE HACER EL EJERCICIO

SELECT f.nombre AS nombre_fabricante, COALESCE(conteo_productos, 0) AS productos
FROM fabricante AS f
LEFT JOIN (
    SELECT id_fabricante, COUNT(*) AS conteo_productos
    FROM producto
    WHERE precio >= 220
    GROUP BY id_fabricante
) AS subconsulta ON f.id = subconsulta.id_fabricante;


/*
4. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
*/

SELECT f.id, f.nombre, COUNT(p.id) AS productos, SUM(p.precio) AS total
FROM fabricante AS f
LEFT JOIN producto AS p ON f.id = p.id_fabricante
GROUP BY f.id 
HAVING SUM(p.precio) > 1000 ;