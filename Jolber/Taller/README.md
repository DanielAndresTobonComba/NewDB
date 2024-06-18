# proyectoSQL

Consultas sobre una tabla

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

### Consulta

```sql
select o.id as CodOficina , c.nombre as Ciudad  from ciudad as c inner join direccion_oficina as do on c.id = do.idCiudad inner join oficina as o on o.id = do.idOficina ; 
```

### Resultado


| CodOficina | Ciudad |
|---|---|
| 1 | Buenos Aires |
| 2 | La Plata |
| 3 | Córdoba |
| 4 | Villa Carlos Paz |
| 5 | São Paulo |
| 6 | Campinas |
| 7 | Rio de Janeiro |
| 8 | Niterói |
| 9 | La Serena |
| 10 | Coquimbo |





2. Devuelve un listado con la ciudad y el teléfono de las oficinas de Buenos Aires.

```sql
SELECT * 
FROM ciudad AS c 
INNER JOIN direccion_oficina AS do ON c.id = do.idCiudad 
INNER JOIN oficina AS o ON o.id = do.idOficina 
INNER JOIN telefono_oficina AS tof ON tof.idOficina = o.id 
WHERE c.nombre = 'Buenos Aires';
```


 select * from ciudad as c inner join direccion_oficina as do on c.id = do.idCiudad inner join oficina as o on o.id = do.idOficina inner join telefono_oficina as tof on tof.idOficina = o.id where c.nombre = 'Buenos Aires';
| id |    nombre     | id_region | codPostal | id |        direccion        | idOficina | tipo | idCiudad | id |      nombre       | id |   numero    | tipoTelefono | idOficina |
|:--:|:-------------:|:---------:|:---------:|:--:|:-----------------------:|:---------:|:----:|:--------:|:--:|:-----------------:|:--:|:-----------:|:------------:|:---------:|
|  1 | Buenos Aires  |     1     |   1000    |  1 | Calle 123, Zona Central|     1     |  1   |    1     |  1 | Oficina principal |  1 | +1234567890 |      1       |     1     |







3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
jefe tiene un código de jefe igual a 7.

```sql
SELECT nombre, CONCAT(apellido1, ' ', apellido2) AS Apellidos, email 
FROM empleado 
WHERE codigo_jefe = 7;
```

| nombre |   Apellidos    |          email           |
|:------:|:--------------:|:------------------------:|
| Isabel | Díaz Rodríguez | isabel.diaz@example.com |
| Pedro  |  Gómez López   |  pedro.gomez@example.com|





4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la
empresa.

```sql
select e.nombre , concat(e.apellido1 , ' ' , e.apellido2) as Apellidos, e.email , c.tipo from empleado as e inner join cargo as c on c.id = e.idCargo where codigo_jefe is NULL;
```


| Nombre | Apellidos | Email | Tipo |
|---|---|---|---|
| Juan | García Pérez | juan.garcia@example.com | Gerente General |



6. Devuelve un listado con el nombre, apellidos y puesto de aquellos
empleados que no sean representantes de ventas.

```sql
select e.nombre , concat(e.apellido1 , ' ' , e.apellido2) as Apellidos , c.tipo as Cargo
from empleado as e , cargo as c
where e.id not in (select e.id from empleado as e inner join cliente as c on c.idEmpleadoReporteVentas = e.id) and e.idCargo = c.id;
```
| Nombre | Apellidos | Cargo |
|---|---|---|
| Daniel | López Gómez | Gerente General |
| Haymer | Fernando Camacho | Director de Ventas |
| Lucía | Sánchez Pérez | Técnico de Soporte |
| Luisa | Martínez Fernández | Asistente Administrativo |
| Miguel | Fernández Gómez | Contador |
| Raquel | Gómez Martínez | Ingeniero de Desarrollo |
| Jorge | Martínez Sánchez | Especialista en Recursos Humanos |
| Isabel | Díaz Rodríguez | Especialista en Seguridad Informática |
| Pedro | Gómez López | Ingeniero de Sistemas |





6. Devuelve un listado con el nombre de los todos los clientes colombianos.

 ```sql
select concat (cl.nombre , ' ', cl.apellido1 , ' ' , cl.apellido2) as Nombre
from pais as p 
inner join region as r on p.id = r.id_pais
inner join ciudad as c on c.id_region = r.id
inner join direccion_cliente as dc on dc.idCiudad = c.id
inner join cliente as cl on cl.id = dc.idCliente where p.nombre = 'Colombia';
```

<pre>-------------------------------+
| Nombre                        |
+-------------------------------+
| José Martínez Fernández       |
| Paula Sánchez López           |
| Daniel Gómez Rodríguez        |
| Patricia Fernández Martínez   |
+-------------------------------+
</pre>





7. Devuelve un listado con los distintos estados por los que puede pasar un
pedido.

```sql
select tp.tipo from pedido as p 
inner join tipo_estado as tp on p.idEstado = tp.id
group by tp.tipo;
```

<pre>+---------------------------+
| tipo                      |
+---------------------------+
| En proceso                |
| Preparando envío          |
| En espera de recolección  |
| En tránsito               |
| Entregado                 |
| Retenido en aduana        |
| Devuelto al remitente     |
| En revisión de calidad    |
| Cancelado                 |
| Rechazado                 |
+---------------------------+</pre>



8. Devuelve un listado con el código de cliente de aquellos clientes que
realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:

• Utilizando la función YEAR de MySQL.
• Utilizando la función DATE_FORMAT de MySQL.
• Sin utilizar ninguna de las funciones anteriores.

```sql
select c.id , c.nombre  from pago as p 
inner join cliente as c on p.idCliente = c.id
where year(p.fecha_pago) = 2008
group by c.id;
```



| id | nombre |
|---|---|
| 1 | Juan |


```sql
SELECT c.id ,c.nombre 
FROM pago AS p 
INNER JOIN cliente AS c ON p.idCliente = c.id 
WHERE DATE_FORMAT(p.fecha_pago, '%Y') = '2008' 
GROUP BY c.id;
```


| id | nombre |
|---|---|
| 1 | Juan |


```sql
select c.id ,c.nombre  from pago as p 
inner join cliente as c on p.idCliente = c.id
where year(p.fecha_pago) = 2008
group by c.id;
```

| id | nombre |
|---|---|
| 1 | Juan |

```sql
SELECT c.id ,c.nombre
FROM pago AS p 
INNER JOIN cliente AS c ON p.idCliente = c.id 
WHERE p.fecha_pago between '2008-01-01' AND '2009-01-01' 
GROUP BY c.id;
```
| id | nombre |
|---|---|
| 1 | Juan |



9. Devuelve un listado con el código de pedido, código de cliente, fecha
esperada y fecha de entrega de los pedidos que no han sido entregados a
tiempo.

```sql
select p.id as PedidoId , c.id as ClienteId, p.fecha_esperada as Esperada  , p.fecha_entrega as Entrega
from cliente as c 
inner join pedido as p on c.id = p.idCliente
where  (p.fecha_entrega - p.fecha_esperada) > 0 or p.fecha_entrega is null;
```

| PedidoId | ClienteId | Fecha esperada de entrega | Fecha de entrega |
|---|---|---|---|
| 1 | 1 | 2024-05-10 | 2024-05-11 |
| 2 | 2 | 2024-05-11 | 2024-05-12 |
| 3 | 3 | 2024-05-12 | 2024-05-13 |
| 4 | 4 | 2024-05-13 | 2024-05-14 |
| 5 | 5 | 2024-05-14 | 2024-05-15 |
| 6 | 6 | 2024-05-15 | 2024-05-16 |
| 7 | 7 | 2024-05-16 | 2024-05-17 |
| 8 | 8 | 2024-05-17 | 2024-05-18 |
| 9 | 9 | 2024-05-18 | 2024-05-19 |
| 10 | 10 | 2024-05-19 | 2024-05-20 |
| 11 | 11 | 2024-05-20 | 2024-05-21 |
| 12 | 12 | 2024-05-21 | 2024-05-22 |
| 13 | 13 | 2024-05-22 | 2024-05-23 |
| 14 | 14 | 2024-05-23 | 2024-05-24 |
| 15 | 15 | 2024-05-24 | 2024-05-25 |
| 16 | 16 | 2024-05-25 | 2024-05-26 |
| 17 | 17 | 2024-05-26 | 2024-05-27 |
| 18 | 18 | 2024-05-27 | 2024-05-28 |
| 19 | 19 | 2024-05-28 | 2024-05-29 |
| 20 | 20 | 2024-05-29 | 2024-05-30 |



10. Devuelve un listado con el código de pedido, código de cliente, fecha
esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al
menos dos días antes de la fecha esperada.

• Utilizando la función ADDDATE de MySQL.

```sql
SELECT p.id AS PedidoId, c.id AS ClienteId, p.fecha_esperada AS Esperada, p.fecha_entrega AS Entrega
FROM cliente AS c
INNER JOIN pedido AS p ON c.id = p.idCliente
WHERE DATEDIFF(ADDDATE(p.fecha_entrega, INTERVAL 2 DAY),  p.fecha_esperada) < 0;
```
| PedidoId | ClienteId | Fecha esperada de entrega | Fecha de entrega |
|---|---|---|---|
| 21 | 19 | 2024-05-28 | 2024-05-23 |
| 22 | 19 | 2024-05-28 | 2024-05-24 |






• Utilizando la función DATEDIFF de MySQL.

```sql
SELECT p.id AS PedidoId, c.id AS ClienteId, p.fecha_esperada AS Esperada, p.fecha_entrega AS Entrega
FROM cliente AS c
INNER JOIN pedido AS p ON c.id = p.idCliente
WHERE DATEDIFF(p.fecha_esperada, p.fecha_entrega) > 2;
```
| PedidoId | ClienteId | Fecha esperada de entrega | Fecha de entrega |
|---|---|---|---|
| 21 | 19 | 2024-05-28 | 2024-05-23 |
| 22 | 19 | 2024-05-28 | 2024-05-24 |


• ¿Sería posible resolver esta consulta utilizando el operador de suma + o
resta -?

```sql
select p.id as PedidoId , c.id as ClienteId, p.fecha_esperada as Esperada  , p.fecha_entrega as Entrega
from cliente as c 
inner join pedido as p on c.id = p.idCliente
where  (p.fecha_esperada - p.fecha_entrega ) > 2;
```

| PedidoId | ClienteId | Fecha esperada de entrega | Fecha de entrega |
|---|---|---|---|
| 21 | 19 | 2024-05-28 | 2024-05-23 |
| 22 | 19 | 2024-05-28 | 2024-05-24 |


11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

```sql
select p.id , p.fecha_pedido , p.fecha_esperada , p.comentario , p.idCliente , p.idEstado from pedido as p 
inner join tipo_estado as tp on p.idEstado = tp.id
where p.idEstado = 11 and year(p.fecha_entrega) = 2024;
```

| id | fecha_pedido | fecha_esperada | comentario | idCliente | idEstado |
|---|---|---|---|---|---|
| 23 | 2024-05-19 | 2024-05-28 | Rechazado | 9 | 11 |
| 24 | 2024-05-19 | 2024-05-28 | NULL | 5 | 11 |




12. Devuelve un listado de todos los pedidos que han sido entregados en el
mes de mayo de cualquier año.

```sql
select p.id , p.fecha_pedido , p.fecha_esperada , p.comentario , p.idCliente , p.idEstado from pedido as p 
inner join tipo_estado as tp on p.idEstado = tp.id
where month(p.fecha_entrega) = 5 and p.idEstado = 5 ;
```

| id | fecha_pedido | fecha_esperada | comentario | idCliente | idEstado |
|---|---|---|---|---|---|
| 5 | 2024-05-05 | 2024-05-14 | NULL | 5 | 5 |
| 14 | 2024-05-14 | 2024-05-23 | Cliente ha solicitado envío express | 14 | 5 |



13. Devuelve un listado con todos los pagos que se realizaron en el
año 2008 mediante Efectivo. Ordene el resultado de mayor a menor.


```sql
select * from pago as p 
inner join forma_pago as fp 
on fp.id = p.forma_pago
where fp.id = 1 and year(p.fecha_pago) = 2008 
order by p.total;
```

<pre>+---------+-----------+------------+------------+--------+----+----------+
| id      | idCliente | fecha_pago | forma_pago | total  | id | tipo     |
+---------+-----------+------------+------------+--------+----+----------+
| PAG-021 |         1 | 2008-06-12 |          1 | 450.25 |  1 | Efectivo |
+---------+-----------+------------+------------+--------+----+----------+
</pre>


14. Devuelve un listado con todas las formas de pago que aparecen en la
tabla pago. Tenga en cuenta que no deben aparecer formas de pago
repetidas.

```sql
select fp.id  as id , fp.tipo as Forma
from forma_pago as fp 
inner join pago as p on p.forma_pago = fp.id
group by id;
```
| id | Forma de Pago |
|---|---|
| 1 | Efectivo |
| 2 | Tarjeta de crédito |
| 3 | Transferencia bancaria |
| 4 | Cheque |
| 5 | PayPal |
| 6 | Criptomoneda |
| 7 | Pago en línea |
| 8 | Pago móvil |
| 9 | Pago por adelantado |
| 10 | Financiamiento |





15. Devuelve un listado con todos los productos que pertenecen a la
gama Electronica y que tienen más de 100 unidades en stock. El listado
deberá estar ordenado por su precio de venta, mostrando en primer lugar
los de mayor precio.

```sql
select gp.gama , gp.nombre , gp.descripcion_texto , p.nombre , p.descripcion ,p.cantidad_en_stock , p.precio_venta
from gama_producto as gp 
inner join producto as p on p.gama = gp.gama
where p.gama = 1 and p.cantidad_en_stock > 100
order by p.precio_venta desc;
```

| Gama | Nombre | Descripción del Producto | Nombre Detallado | Descripción Detallada | Cantidad en Stock | Precio de Venta |
|---|---|---|---|---|---|---|
| 1 | Electrónica | Un teléfono inteligente de última generación con una pantalla AMOLED de 6.5 pulgadas. | Teléfono Inteligente Z3 | Teléfono inteligente de gama media con pantalla LCD de 6.0 pulgadas. | 120 | 499.99 |



16. Devuelve un listado con todos los clientes que sean de la ciudad de Buenos Aires y
cuyo representante de ventas tenga el código de empleado 1 o 7.

```sql
SELECT * 
FROM direccion_cliente AS dc 
INNER JOIN cliente AS c ON dc.idCliente = c.id
INNER JOIN ciudad AS ct ON ct.id = dc.idCiudad
WHERE ct.id = 1 AND (c.idEmpleadoReporteVentas = 7 OR c.idEmpleadoReporteVentas = 1);
```

| id | Dirección | idCliente | Tipo | idCiudad | id | Nombre | Apellido1 | Apellido2 | idEmpleadoReporteVentas | Limite Credito | id | Nombre | id_region | CodPostal |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Calle A #123 | 1 | 1 | 1 | 1 | Juan | López | García | 1 | 1000.00 | 1 | Buenos Aires | 1 | 1000 |




### Consultas multitabla (Composición interna)

1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su
representante de ventas.

```sql
select concat(c.nombre , ' ' , c.apellido1 , ' ', c.apellido2) as Cliente , concat(e.nombre , ' ' , e.apellido1 , ' ', e.apellido2) as Representante
from cliente as c 
inner join empleado as e on c.idEmpleadoReporteVentas = e.id;
```

| id | Dirección | idCliente | Tipo | idCiudad | id | Nombre | Apellido1 | Apellido2 | idEmpleadoReporteVentas | Limite Credito | id | Nombre | id_region | CodPostal |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Calle A #123 | 1 | 1 | 1 | 1 | Juan | López | García | 1 | 1000.00 | 1 | Buenos Aires | 1 | 1000 |
| 2 | Calle B #456 | 2 | 2 | 2 | 2 | María | Martínez | Sánchez | 2 | 2000.00 | 2 | Córdoba | 2 | 2000 |
| 3 | Calle C #789 | 3 | 3 | 3 | 3 | Carlos | González | Fernández | 3 | 3000.00 | 3 | Rosario | 3 | 3000 |
| 4 | Calle D #1011 | 4 | 4 | 4 | 4 | Laura | Pérez | Díaz | 4 | 4000.00 | 4 | Santa Fe | 4 | 4000 |
| 5 | Calle E #1213 | 5 | 5 | 5 | 5 | Javier | Gómez | Martínez | 5 | 5000.00 | 5 | Mendoza | 5 | 5000 |
| 6 | Calle F #1415 | 6 | 6 | 6 | 6 | Ana | Sánchez | López | 6 | 6000.00 | 6 | La Plata | 6 | 6000 |
| 7 | Calle G #1617 | 7 | 7 | 7 | 7 | David | Martínez | Gómez | 7 | 7000.00 | 7 | Tucumán | 7 | 7000 |
| 8 | Calle H #1819 | 8 | 8 | 8 | 8 | Carmen | Fernández | Sánchez | 8 | 8000.00 | 8 | Santiago del Estero | 8 | 8000 |
| 9 | Calle I #2021 | 9 | 9 | 9 | 9 | Pablo | Rodríguez | Pérez | 9 | 9000.00 | 9 | Neuquén | 9 | 9000 |
| 10 | Calle J #2223 | 10 | 10 | 10 | 10 | Sara | López | Martínez | 10 | 10000.00 | 10 | Río Negro | 10 | 10000 |






2. Muestra el nombre de los clientes que hayan realizado pagos junto con el
nombre de sus representantes de ventas.

```sql
SELECT CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) AS Cliente, CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2) AS Representante
FROM cliente AS c 
INNER JOIN empleado AS e ON c.idEmpleadoReporteVentas = e.id
INNER JOIN pago AS p ON p.idCliente = c.id
GROUP BY Cliente, Representante
ORDER BY Cliente;
```
| Cliente                                         | Representante                                     |
|-------------------------------------------------|------------------------------------------------------|
| Ana Sánchez López                                 | Ana Pérez Sánchez                                 |
| Carlos González Fernández                         | Carlos Martínez Gómez                               |
| Carmen Fernández Sánchez                           | Carmen Martínez López                              |
| Daniel Gómez Rodríguez                            | María López Martínez                               |
| David Martínez Gómez                              | David Gómez Rodríguez                             |
| Elena Pérez Gómez                                 | Elena García Martínez                             |
| Javier Gómez Martínez                             | Javier Díaz Fernández                              |
| José Martínez Fernández                         | Mario Sánchez Fernández                           |
| Juan López García                               | Juan García Pérez                                   |
| Laura Pérez Díaz                                  | Laura Sánchez González                              |
| Luis García Hernández                             | Diego López Díaz                                   |
| María Martínez Sánchez                            | María López Martínez                               |
| Marina Martínez Sánchez                           | Javier Díaz Fernández                              |
| Pablo Rodríguez Pérez                              | Pablo Fernández García                             |
| Patricia Fernández Martínez                       | Carlos Martínez Gómez                               |
| Paula Sánchez López                                | Juan García Pérez                                   |
| Roberto López Gómez                               | Laura Sánchez González                              |
| Sara López Martínez                                | Sara Rodríguez Pérez                              |




3. Muestra el nombre de los clientes que no hayan realizado pagos junto con
el nombre de sus representantes de ventas.


```sql
SELECT CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) AS Cliente, CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2) AS Representante 
FROM cliente AS c 
INNER JOIN empleado AS e ON c.idEmpleadoReporteVentas = e.id
left JOIN pago AS p ON p.idCliente = c.id
where c.id not in (SELECT c.id
                  FROM cliente AS c 
                  INNER JOIN empleado AS e ON c.idEmpleadoReporteVentas = e.id
                  INNER JOIN pago AS p ON p.idCliente = c.id
                  group by c.id)
GROUP BY Cliente, Representante
ORDER BY Cliente;
```


```sql
SELECT CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) AS Cliente, CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2) AS Representante 
FROM cliente AS c 
INNER JOIN empleado AS e ON c.idEmpleadoReporteVentas = e.id
LEFT JOIN pago AS p ON p.idCliente = c.id
WHERE p.idCliente IS NULL
GROUP BY Cliente, Representante
ORDER BY Cliente;
```


| Cliente                                         | Representante                                     |
|-------------------------------------------------|------------------------------------------------------|
| Cristina Gómez López                              | David Gómez Rodríguez                             |
| Joaquín Pérez Rodríguez                            | Ana Pérez Sánchez                                 |
| Manuel Steven Sánchez                            | Ana Pérez Sánchez                                 |






4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
representantes junto con la ciudad de la oficina a la que pertenece el
representante.

```sql
select CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) AS Cliente , CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2) AS Representante , ct.nombre as CiudadRepresentante , o.nombre as OficinaRepresentante
from cliente as c 
inner join pago as p on p.idCliente = c.id
inner join empleado as e on c.idEmpleadoReporteVentas = e.id
inner join direccion_cliente as dc on dc.idCliente = c.id
inner join ciudad as ct on ct.id = dc.idCiudad 
inner join oficina as o on o.id = e.codigo_oficina
group by Cliente , Representante , CiudadRepresentante , OficinaRepresentante;
```

| Cliente                                         | Representante                                     | CiudadRepresentante | OficinaRepresentante                                       |
|-------------------------------------------------|------------------------------------------------------|---------------------|--------------------------------------------------------|
| Juan López García                               | Juan García Pérez                                   | Buenos Aires       | Oficina principal                                           |
| María Martínez Sánchez                            | María López Martínez                               | La Plata           | Oficina de ventas                                        |
| Carlos González Fernández                         | Carlos Martínez Gómez                               | Córdoba             | Oficina de desarrollo                                       |
| Laura Pérez Díaz                                  | Laura Sánchez González                              | Villa Carlos Paz    | Oficina de recursos humanos                                 |
| Javier Gómez Martínez                             | Javier Díaz Fernández                              | São Paulo          | Oficina de contabilidad                                    |
| Ana Sánchez López                                 | Ana Pérez Sánchez                                 | Campinas            | Oficina de marketing                                       |
| David Martínez Gómez                              | David Gómez Rodríguez                             | Rio de Janeiro     | Oficina de soporte técnico                                   |
| Carmen Fernández Sánchez                           | Carmen Martínez López                              | Niterói             | Oficina de calidad                                        |
| Pablo Rodríguez Pérez                              | Pablo Fernández García                             | La Serena          | Oficina de investigación y desarrollo                  |
| Sara López Martínez                                | Sara Rodríguez Pérez                              | Coquimbo            | Oficina administrativa                                     |
| Luis García Hernández                             | Diego López Díaz                                   | Los Andes           | Oficina principal                                           |
| Elena Pérez Gómez                                 | Elena García Martínez                             | San Felipe          | Oficina de ventas                                        |
| José Martínez Fernández                         | Mario Sánchez Fernández                           | Bogotá             | Oficina de desarrollo                                       |
| Paula Sánchez López                                | Juan García Pérez                                   | Soacha              | Oficina principal                                           |
| Daniel Gómez Rodríguez                            | María López Martínez                               | Medellín            | Oficina de ventas                                        |
| Patricia Fernández Martínez                       | Carlos Martínez Gómez                               | Envigado            | Oficina de desarrollo                                       |
| Roberto López Gómez                               | Laura Sánchez González                              | Tuxtla Gutiérrez   | Oficina de recursos humanos                                 |
| Marina Martínez Sánchez                           | Javier Díaz Fernández                              | Buenos Aires       | Oficina de contabilidad                                    |




5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre
de sus representantes junto con la ciudad de la oficina a la que pertenece el
representante.

```sql
SELECT CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) AS Cliente, CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2) AS Representante , ct.nombre as CiudadRepresentante , o.nombre as OficinaRepresentante
FROM cliente AS c 
INNER JOIN empleado AS e ON c.idEmpleadoReporteVentas = e.id
left JOIN pago AS p ON p.idCliente = c.id
inner join direccion_cliente as dc on dc.idCliente = c.id
inner join ciudad as ct on ct.id = dc.idCiudad 
inner join oficina as o on o.id = e.codigo_oficina
where c.id not in (SELECT c.id
                  FROM cliente AS c 
                  INNER JOIN empleado AS e ON c.idEmpleadoReporteVentas = e.id
                  INNER JOIN pago AS p ON p.idCliente = c.id
                  group by c.id)
group by Cliente , Representante , CiudadRepresentante , OficinaRepresentante;
ORDER BY Cliente;
```

| Cliente                                         | Representante                                     | CiudadRepresentante | OficinaRepresentante                                       |
|-------------------------------------------------|------------------------------------------------------|---------------------|--------------------------------------------------------|
| Joaquín Pérez Rodríguez                            | Ana Pérez Sánchez                                 | La Plata           | Oficina de marketing                                       |
| Cristina Gómez López                              | David Gómez Rodríguez                             | Córdoba             | Oficina de soporte técnico                                   |




6. Lista la dirección de las oficinas que tengan clientes en Rio de Janeiro.

```sql
select ct.nombre as Ciudad , do.direccion as Direccion ,  o.nombre as Oficina, CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) AS Cliente 
from ciudad as ct 
inner join direccion_oficina as do on  do.idCiudad = ct.id
inner join oficina as o on o.id = do.idOficina
inner join empleado as em on em.codigo_oficina = o.id
inner join cliente as c on em.id = c.idEmpleadoReporteVentas
where ct.id = 7;
```

| Ciudad                      | Dirección                                     | Oficina                                                   | Cliente                                                 |
|------------------------------|----------------------------------------------|------------------------------------------------------------|----------------------------------------------------------|
| Rio de Janeiro                 | Autopista Norte, Km 10                         | Oficina de soporte técnico                               | David Martínez Gómez                                   |
| Rio de Janeiro                 | Autopista Norte, Km 10                         | Oficina de soporte técnico                               | Cristina Gómez López                                    |




7. Devuelve el nombre de los clientes y el nombre de sus representantes junto
con la ciudad de la oficina a la que pertenece el representante.

```sql
select CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) AS Cliente , CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2) AS Representante , ct.nombre as CiudadRepresentante , o.nombre as OficinaRepresentante
from cliente as c 
inner join empleado as e on c.idEmpleadoReporteVentas = e.id
inner join direccion_cliente as dc on dc.idCliente = c.id
inner join ciudad as ct on ct.id = dc.idCiudad 
inner join oficina as o on o.id = e.codigo_oficina
group by Cliente , Representante , CiudadRepresentante , OficinaRepresentante;
```

| Cliente                                         | Representante                                     | CiudadRepresentante | OficinaRepresentante                                       |
|-------------------------------------------------|------------------------------------------------------|---------------------|--------------------------------------------------------|
| Juan López García                               | Juan García Pérez                                   | Buenos Aires       | Oficina principal                                           |
| María Martínez Sánchez                            | María López Martínez                               | La Plata           | Oficina de ventas                                        |
| Carlos González Fernández                         | Carlos Martínez Gómez                               | Córdoba             | Oficina de desarrollo                                       |
| Laura Pérez Díaz                                  | Laura Sánchez González                              | Villa Carlos Paz    | Oficina de recursos humanos                                 |
| Javier Gómez Martínez                             | Javier Díaz Fernández                              | São Paulo          | Oficina de contabilidad                                    |
| Ana Sánchez López                                 | Ana Pérez Sánchez                                 | Campinas            | Oficina de marketing                                       |
| David Martínez Gómez                              | David Gómez Rodríguez                             | Rio de Janeiro     | Oficina de soporte técnico                                   |
| Carmen Fernández Sánchez                           | Carmen Martínez López                              | Niterói             | Oficina de calidad                                        |
| Pablo Rodríguez Pérez                              | Pablo Fernández García                             | La Serena          | Oficina de investigación y desarrollo                  |
| Sara López Martínez                                | Sara Rodríguez Pérez                              | Coquimbo            | Oficina administrativa                                     |
| Luis García Hernández                             | Diego López Díaz                                   | Los Andes           | Oficina principal                                           |
| Elena Pérez Gómez                                 | Elena García Martínez                             | San Felipe          | Oficina de ventas                                        |
| José Martínez Fernández                         | Mario Sánchez Fernández                           | Bogotá             | Oficina de desarrollo                                       |
| Paula Sánchez López                                | Juan García Pérez                                   | Soacha              | Oficina principal                                           |
| Daniel Gómez Rodríguez                            | María López Martínez                               | Medellín            | Oficina de ventas                                        |
| Patricia Fernández Martínez                       | Carlos Martínez Gómez                               | Envigado            | Oficina de desarrollo                                       |
| Roberto López Gómez                               | Laura Sánchez González                              | Tuxtla Gutiérrez   | Oficina de recursos humanos                                 |
| Marina Martínez Sánchez                           | Javier Díaz Fernández                              | Buenos Aires       | Oficina de contabilidad                                    |
| Joaquín Pérez Rodríguez                            | Ana Pérez Sánchez                                 | La Plata           | Oficina de marketing                                       |
| Cristina Gómez López                              | David Gómez Rodríguez                             | Córdoba             | Oficina de soporte técnico                                   |




8. Devuelve un listado con el nombre de los empleados junto con el nombre
de sus jefes.

```sql
select CONCAT(e2.nombre, ' ', e2.apellido1, ' ', e2.apellido2) AS Empleado , concat(e.nombre, ' ', e.apellido1, ' ', e.apellido2) as Jefe
from empleado as e 
right join empleado as e2 on e.id = e2.codigo_jefe;
```

| Empleado                                         | Jefe                                              |
|-------------------------------------------------|-------------------------------------------------------|
| Juan García Pérez                                   | Javier Díaz Fernández                              |
| María López Martínez                               | Juan García Pérez                                   |
| Carlos Martínez Gómez                               | Juan García Pérez                                   |
| Laura Sánchez González                              | María López Martínez                               |
| Javier Díaz Fernández                              | María López Martínez                               |
| Ana Pérez Sánchez                                 | Carlos Martínez Gómez                               |
| David Gómez Rodríguez                             | Carlos Martínez Gómez                               |
| Carmen Martínez López                              | Laura Sánchez González                              |
| Pablo Fernández García                             | Laura Sánchez González                              |
| Sara Rodríguez Pérez                              | Javier Díaz Fernández                              |
| Diego López Díaz                                   | Javier Díaz Fernández                              |
| Elena García Martínez                             | Ana Pérez Sánchez                                 |
| Mario Sánchez Fernández                           | Ana Pérez Sánchez                                 |
| Isabel Díaz Rodríguez                               | David Gómez Rodríguez                             |
| Pedro Gómez López                                  | David Gómez Rodríguez                             |
| Luisa Martínez Fernández                         | Carmen Martínez López                              |
| Miguel Fernández Gómez                             | Carmen Martínez López                              |
| Raquel Gómez Martínez                              | Juan García Pérez                                   |
| Jorge Martínez Sánchez                            | Juan García Pérez                                   |
| Lucía Sánchez Pérez                               | Javier Díaz Fernández                              |
| Daniel López Gómez                                 | NULL                                                |
| Haymer Fernando Camacho                           | Daniel López Gómez                                 |




9. Devuelve un listado que muestre el nombre de cada empleados, el nombre
de su jefe y el nombre del jefe de sus jefe.

```sql
SELECT 
    CONCAT(e1.nombre, ' ', e1.apellido1, ' ', e1.apellido2) AS nombre_empleado,
    CONCAT(e2.nombre, ' ', e2.apellido1, ' ', e2.apellido2) AS nombre_jefe,
    CONCAT(e3.nombre, ' ', e3.apellido1, ' ', e3.apellido2)AS nombre_jefe_de_jefe
FROM 
    empleado e1
LEFT JOIN 
    empleado e2 ON e1.codigo_jefe = e2.id
LEFT JOIN 
    empleado e3 ON e2.codigo_jefe = e3.id
order by  nombre_empleado;
```

| Nombre Empleado                                | Nombre Jefe                                   | Nombre Jefe de Jefe                                |
|-------------------------------------------------|-------------------------------------------------|-------------------------------------------------------|
| Ana Pérez Sánchez                                | Carlos Martínez Gómez                        | Juan García Pérez                                   |
| Carlos Martínez Gómez                          | Juan García Pérez                            | Javier Díaz Fernández                              |
| Carmen Martínez López                           | Laura Sánchez González                         | María López Martínez                                |
| Daniel López Gómez                               | NULL                                           | NULL                                                  |
| David Gómez Rodríguez                           | Carlos Martínez Gómez                        | Juan García Pérez                                   |
| Diego López Díaz                                | Javier Díaz Fernández                        | María López Martínez                                |
| Elena García Martínez                           | Ana Pérez Sánchez                            | Carlos Martínez Gómez                               |
| Haymer Fernando Camacho                        | Daniel López Gómez                            | NULL                                                  |
| Isabel Díaz Rodríguez                          | David Gómez Rodríguez                        | Carlos Martínez Gómez                               |
| Javier Díaz Fernández                          | María López Martínez                            | Juan García Pérez                                   |
| Jorge Martínez Sánchez                        | Juan García Pérez                            | Javier Díaz Fernández                              |
| Juan García Pérez                               | Javier Díaz Fernández                        | María López Martínez                                |
| Laura Sánchez González                          | María López Martínez                            | Juan García Pérez                                   |
| Lucía Sánchez Pérez                           | Javier Díaz Fernández                        | María López Martínez                                |
| Luisa Martínez Fernández                       | Carmen Martínez López                           | Laura Sánchez González                              |
| María López Martínez                           | Juan García Pérez                            | Javier Díaz Fernández                              |
| Mario Sánchez Fernández                       | Ana Pérez Sánchez                            | Carlos Martínez Gómez                               |
| Miguel Fernández Gómez                         | Carmen Martínez López                           | Laura Sánchez González                              |
| Pablo Fernández García                          | Laura Sánchez González                         | María López Martínez                                |
| Pedro Gómez López                              | David Gómez Rodríguez                        | Carlos Martínez Gómez                               |
| Raquel Gómez Martínez                          | Juan García Pérez                            | Javier Díaz Fernández                              |
| Sara Rodríguez Pérez                           | Javier Díaz Fernández                        | María López Martínez                                |




10. Devuelve el nombre de los clientes a los que no se les ha entregado a
tiempo un pedido.

```sql
select CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) as Cliente , p.fecha_esperada as FechaEperada , p.fecha_entrega as FechaDeEntrega
from cliente as c 
inner join pedido as p on c.id = p.idCliente
where (p.fecha_esperada - p.fecha_entrega) < 0;
```

| Cliente                                         | Fecha Esperada | Fecha de Entrega |
|-------------------------------------------------|----------------|-----------------|
| Juan López García                               | 2024-05-10      | 2024-05-11      |
| María Martínez Sánchez                           | 2024-05-11      | 2024-05-12      |
| Carlos González Fernández                         | 2024-05-12      | 2024-05-13      |
| Laura Pérez Díaz                                  | 2024-05-13      | 2024-05-14      |
| Javier Gómez Martínez                             | 2024-05-14      | 2024-05-15      |
| Ana Sánchez López                                 | 2024-05-15      | 2024-05-16      |
| David Martínez Gómez                             | 2024-05-16      | 2024-05-17      |
| Carmen Fernández Sánchez                           | 2024-05-17      | 2024-05-18      |
| Pablo Rodríguez Pérez                             | 2024-05-18      | 2024-05-19      |
| Sara López Martínez                               | 2024-05-19      | 2024-05-20      |
| Luis García Hernández                             | 2024-05-20      | 2024-05-21      |
| Elena Pérez Gómez                                 | 2024-05-21      | 2024-05-22      |
| José Martínez Fernández                         | 2024-05-22      | 2024-05-23      |
| Paula Sánchez López                               | 2024-05-23      | 2024-05-24      |
| Daniel Gómez Rodríguez                           | 2024-05-24      | 2024-05-25      |
| Patricia Fernández Martínez                       | 2024-05-25      | 2024-05-26      |
| Roberto López Gómez                               | 2024-05-26      | 2024-05-27      |
| Marina Martínez Sánchez                           | 2024-05-27      | 2024-05-28      |
| Joaquín Pérez Rodríguez                            | 2024-05-28      | 2024-05-29      |
| Cristina Gómez López                              | 2024-05-29      | 2024-05-30      |





11. Devuelve un listado de las diferentes gamas de producto que ha comprado
cada cliente.

```sql
select CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) as Cliente , gp.nombre as Gama   
from gama_producto as gp
inner join producto as pt on pt.gama = gp.gama
inner join detalle_pedido as dp on pt.id = dp.idProducto
inner join pedido as p on p.id = dp.idPedido
inner join cliente as c on c.id = p.idCliente
group by Gama , Cliente 
order by Cliente;
```

| Cliente                                         | Gama                                         |
|-------------------------------------------------|-------------------------------------------------------|
| Ana Sánchez López                                 | Electrodomésticos                               |
| Carlos González Fernández                         | Moda                                          |
| Carlos González Fernández                         | Juguetería                                    |
| Carmen Fernández Sánchez                           | Moda                                          |
| Cristina Gómez López                              | Deportes                                      |
| Daniel Gómez Rodríguez                           | Electrónica                                   |
| David Martínez Gómez                             | Juguetería                                    |
| Elena Pérez Gómez                                 | Juguetería                                    |
| Javier Gómez Martínez                             | Electrónica                                   |
| Joaquín Pérez Rodríguez                            | Moda                                          |
| José Martínez Fernández                         | Moda                                          |
| Juan López García                                 | Juguetería                                    |
| Juan López García                                 | Electrodomésticos                               |
| Juan López García                                 | Electrónica                                   |
| Laura Pérez Díaz                                  | Deportes                                      |
| Luis García Hernández                             | Electrodomésticos                               |
| María Martínez Sánchez                            | Juguetería                                    |
| María Martínez Sánchez                            | Moda                                          |
| María Martínez Sánchez                            | Electrodomésticos                               |
| Marina Martínez Sánchez                           | Juguetería                                    |
| Pablo Rodríguez Pérez                             | Deportes                                      |
| Patricia Fernández Martínez                       | Electrónica                                   |
| Paula Sánchez López                                | Deportes                                      |
| Roberto López Gómez                               | Electrodomésticos                               |
| Sara López Martínez                                | Electrónica                                   |



### Consultas multitabla (Composición externa)

1. Devuelve un listado que muestre solamente los clientes que no han
realizado ningún pago.

```sql

SELECT CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) AS Cliente
FROM cliente AS c 
left JOIN pago AS p ON p.idCliente = c.id
where c.id not in (SELECT c.id
                  FROM cliente AS c 
                  INNER JOIN empleado AS e ON c.idEmpleadoReporteVentas = e.id
                  INNER JOIN pago AS p ON p.idCliente = c.id
                  group by c.id)
GROUP BY Cliente
ORDER BY Cliente;


```

```sql
SELECT  CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) AS Cliente 
FROM cliente AS c 
LEFT JOIN pago AS p ON p.idCliente = c.id
LEFT JOIN empleado AS e ON c.idEmpleadoReporteVentas = e.id
WHERE p.id IS NULL
GROUP BY Cliente
ORDER BY Cliente;
```





| Cliente                                         |
|-------------------------------------------------|
| Cristina Gómez López                               |
| Cristina Martínez Carmen                          |
| Joaquín Pérez Rodríguez                            |
| Manuel Steven Sánchez                            |
| María Steven Sánchez                             |



2. Devuelve un listado que muestre solamente los clientes que no han
realizado ningún pedido.

```sql

SELECT CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) AS Cliente
from cliente as c 
left join pedido as p on p.idCliente = c.id
where p.id is NULL;
```
| Cliente                                         |
|-------------------------------------------------|
| Manuel Steven Sánchez                            |
| María Steven Sánchez                             |
| Cristina Martínez Carmen                          |




3. Devuelve un listado que muestre los clientes que no han realizado ningún
pago y los que no han realizado ningún pedido.

```sql
SELECT CONCAT(c.nombre, ' ', c.apellido1, ' ', c.apellido2) AS Cliente 
FROM cliente AS c 
LEFT JOIN pago AS p ON p.idCliente = c.id
LEFT JOIN empleado AS e ON c.idEmpleadoReporteVentas = e.id
left join pedido as pd on pd.idCliente = c.id
WHERE p.id IS NULL or pd.id is NULL;
```

| Cliente                                         |
|-------------------------------------------------|
| Joaquín Pérez Rodríguez                            |
| Joaquín Pérez Rodríguez                            |
| Joaquín Pérez Rodríguez                            |
| Cristina Gómez López                               |
| Manuel Steven Sánchez                            |
| María Steven Sánchez                             |
| Cristina Martínez Carmen                          |




4. Devuelve un listado que muestre solamente los empleados que no tienen
una oficina asociada.

```sql
select e.id , CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2) AS Empleado , e.email , e.codigo_oficina , e.codigo_jefe , e.idCargo
from empleado as e 
left join oficina as o on o.id = e.codigo_oficina
WHERE e.codigo_oficina is null;
```


| id | Empleado                                     | email                                          | codigo_oficina | codigo_jefe | idCargo |
|---|---|---|---|---|---|
| 22 | Haymer Fernando Camacho                   | Fernando.Camacho@example.com                   | NULL            | 21          | 2        |



5. Devuelve un listado que muestre solamente los empleados que no tienen un
cliente asociado.

```sql
select e.id , CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2) AS Empleado , e.email , e.codigo_oficina , e.codigo_jefe , e.idCargo
from empleado as e 
left join cliente as c on c.idEmpleadoReporteVentas = e.id
where c.id is null;
```

| id | Empleado                                     | email                                          | codigo_oficina | codigo_jefe | idCargo |
|---|---|---|---|---|---|
| 14 | Isabel Díaz Rodríguez                            | isabel.diaz@example.com                        | 4              | 7           | 14      |
| 15 | Pedro Gómez López                             | pedro.gomez@example.com                        | 5              | 7           | 15      |
| 16 | Luisa Martínez Fernández                       | luisa.martinez@example.com                      | 6              | 8           | 6       |
| 17 | Miguel Fernández Gómez                       | miguel.fernandez@example.com                     | 7              | 8           | 7       |
| 18 | Raquel Gómez Martínez                           | raquel.gomez@example.com                       | 8              | 1           | 8       |
| 19 | Jorge Martínez Sánchez                       | jorge.martinez@example.com                     | 9              | 1           | 9       |
| 20 | Lucía Sánchez Pérez                           | lucia.sanchez@example.com                       | 10             | 5           | 5       |
| 21 | Daniel López Gómez                             | daniel.lopez@example.com                        | 1              | NULL        | 1       |
| 22 | Haymer Fernando Camacho                       | Fernando.Camacho@example.com                   | NULL            | 21          | 2       |



6. Devuelve un listado que muestre solamente los empleados que no tienen un
cliente asociado junto con los datos de la oficina donde trabajan.

```sql
select e.id , CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2) AS Empleado , o.id , o.nombre 
from empleado as e 
left join cliente as c on c.idEmpleadoReporteVentas = e.id
inner join oficina as o on e.codigo_oficina = o.id
where c.id is null;
```

| id | Empleado                                     | id | Oficina                                         |
|---|---|---|---|
| 14 | Isabel Díaz Rodríguez                            | 4 | Oficina de recursos humanos                     |
| 15 | Pedro Gómez López                             | 5 | Oficina de contabilidad                         |
| 16 | Luisa Martínez Fernández                       | 6 | Oficina de marketing                            |
| 17 | Miguel Fernández Gómez                       | 7 | Oficina de soporte técnico                     |
| 18 | Raquel Gómez Martínez                           | 8 | Oficina de calidad                             |
| 19 | Jorge Martínez Sánchez                       | 9 | Oficina de investigación y desarrollo          |
| 20 | Lucía Sánchez Pérez                           | 10 | Oficina administrativa                        |
| 21 | Daniel López Gómez                             | 1 | Oficina principal                              |




7. Devuelve un listado que muestre los empleados que no tienen una oficina
asociada y los que no tienen un cliente asociado.

```sql
select CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2) AS Empleado 
from empleado as e 
left join cliente as c on c.idEmpleadoReporteVentas = e.id
left join oficina as o on o.id = e.codigo_oficina
where c.id is null or e.codigo_oficina is null;
```

| Empleado                                         |
|-------------------------------------------------|
| Isabel Díaz Rodríguez                            |
| Pedro Gómez López                               |
| Luisa Martínez Fernández                       |
| Miguel Fernández Gómez                           |
| Raquel Gómez Martínez                           |
| Jorge Martínez Sánchez                           |
| Lucía Sánchez Pérez                             |
| Daniel López Gómez                             |
| Haymer Fernando Camacho                         |




8. Devuelve un listado de los productos que nunca han aparecido en un
pedido.

```sql

select 
p.id, p.idProveedor, p.nombre, p.gama, p.dimensiones, p.descripcion, p.cantidad_en_stock, p.precio_venta, p.precio_proveedor
from producto AS p
left join detalle_pedido AS dp ON p.id = dp.idProducto
where dp.idPedido IS NULL;

```

<pre>+----+-------------+---------------------------------+------+--------------+----------------------------------------------------------------+-------------------+--------------+------------------+
| id | idProveedor | nombre                          | gama | dimensiones  | descripcion                                                    | cantidad_en_stock | precio_venta | precio_proveedor |
+----+-------------+---------------------------------+------+--------------+----------------------------------------------------------------+-------------------+--------------+------------------+
| 14 |           4 | Chaqueta de Cuero Moderna       | 4    | 40x30x10 cm  | Chaqueta de cuero con diseño moderno y ajuste cómodo.          |                35 |       179.99 |           130.00 |
| 15 |           5 | Bicicleta de Montaña Deportiva  | 5    | 150x50x80 cm | Bicicleta de montaña resistente para aventuras al aire libre.  |                10 |       799.99 |           600.00 |
+----+-------------+---------------------------------+------+--------------+----------------------------------------------------------------+-------------------+--------------+------------------+
</pre>

9. Devuelve un listado de los productos que nunca han aparecido en un
pedido. El resultado debe mostrar el nombre, la descripción y la imagen del
producto.

```sql
select  p.nombre, p.descripcion, gp.imagen
from  producto AS p
left join detalle_pedido AS dp ON p.id = dp.idProducto
inner join gama_producto as gp on p.gama = gp.gama
where dp.idPedido IS NULL;
```

<pre>+---------------------------------+----------------------------------------------------------------+--------------------------------+
| nombre                          | descripcion                                                    | imagen                         |
+---------------------------------+----------------------------------------------------------------+--------------------------------+
| Chaqueta de Cuero Moderna       | Chaqueta de cuero con diseño moderno y ajuste cómodo.          | imagenes/chaqueta_cuero.jpg    |
| Bicicleta de Montaña Deportiva  | Bicicleta de montaña resistente para aventuras al aire libre.  | imagenes/bicicleta_montana.jpg |
+---------------------------------+----------------------------------------------------------------+--------------------------------+
</pre>




10. Devuelve las oficinas donde no trabajan ninguno de los empleados que
hayan sido los representantes de ventas de algún cliente que haya realizado
la compra de algún producto de la gama Moda.

```sql
SELECT o.id, o.nombre
FROM oficina AS o
INNER JOIN empleado AS e ON o.id = e.codigo_oficina
WHERE e.id NOT IN (
    SELECT e.id
    FROM oficina AS o
    INNER JOIN empleado AS e ON e.codigo_oficina = o.id
    INNER JOIN cliente AS cl ON cl.idEmpleadoReporteVentas = e.id
    INNER JOIN pedido AS pd ON pd.idCliente = cl.id
    INNER JOIN detalle_pedido AS dp ON dp.idPedido = pd.id
    INNER JOIN producto AS pt ON pt.id = dp.idProducto
    INNER JOIN gama_producto gp ON gp.gama = pt.gama
    WHERE gp.gama = 4
) group by o.id , o.nombre;
```
<pre>+----+----------------------------------------+
| id | nombre                                 |
+----+----------------------------------------+
|  1 | Oficina principal                      |
|  2 | Oficina de ventas                      |
|  4 | Oficina de recursos humanos            |
|  5 | Oficina de contabilidad                |
|  6 | Oficina de marketing                   |
|  7 | Oficina de soporte técnico             |
|  8 | Oficina de calidad                     |
|  9 | Oficina de investigación y desarrollo  |
| 10 | Oficina administrativa                 |
+----+----------------------------------------+
</pre>




11. Devuelve un listado con los clientes que han realizado algún pedido pero no
han realizado ningún pago.

```sql
SELECT cl.id, cl.nombre, cl.apellido1, cl.apellido2, cl.idEmpleadoReporteVentas, cl.limite_credito
FROM cliente AS cl
LEFT JOIN pago AS pg ON pg.idCliente = cl.id
INNER JOIN pedido AS pd ON pd.idCliente = cl.id
WHERE pg.idCliente IS NULL;
```

<pre>+----+----------+-----------+------------+-------------------------+----------------+
| id | nombre   | apellido1 | apellido2  | idEmpleadoReporteVentas | limite_credito |
+----+----------+-----------+------------+-------------------------+----------------+
| 19 | Joaquín  | Pérez     | Rodríguez  |                       6 |       10000.00 |
| 19 | Joaquín  | Pérez     | Rodríguez  |                       6 |       10000.00 |
| 19 | Joaquín  | Pérez     | Rodríguez  |                       6 |       10000.00 |
| 20 | Cristina | Gómez     | López      |                       7 |       10500.00 |
+----+----------+-----------+------------+-------------------------+----------------+
</pre>



12. Devuelve un listado con los datos de los empleados que no tienen clientes
asociados y el nombre de su jefe asociado.

```sql
SELECT e.id, e.nombre, e.apellido1, e.apellido2, e.extension, e.email, e.codigo_oficina, e.idCargo, jefe.nombre AS nombre_jefe, jefe.apellido1 AS apellido1_jefe, jefe.apellido2 AS apellido2_jefe
FROM empleado AS e
LEFT JOIN cliente AS cl ON cl.idEmpleadoReporteVentas = e.id
LEFT JOIN empleado AS jefe ON e.codigo_jefe = jefe.id
WHERE cl.id IS NULL;
```

<pre>+----+--------+------------+------------+-----------+------------------------------+----------------+---------+-------------+----------------+----------------+
| id | nombre | apellido1  | apellido2  | extension | email                        | codigo_oficina | idCargo | nombre_jefe | apellido1_jefe | apellido2_jefe |
+----+--------+------------+------------+-----------+------------------------------+----------------+---------+-------------+----------------+----------------+
| 14 | Isabel | Díaz       | Rodríguez  | 1014      | isabel.diaz@example.com      |              4 |      14 | David       | Gómez          | Rodríguez      |
| 15 | Pedro  | Gómez      | López      | 1015      | pedro.gomez@example.com      |              5 |      15 | David       | Gómez          | Rodríguez      |
| 16 | Luisa  | Martínez   | Fernández  | 1016      | luisa.martinez@example.com   |              6 |       6 | Carmen      | Martínez       | López          |
| 17 | Miguel | Fernández  | Gómez      | 1017      | miguel.fernandez@example.com |              7 |       7 | Carmen      | Martínez       | López          |
| 18 | Raquel | Gómez      | Martínez   | 1018      | raquel.gomez@example.com     |              8 |       8 | Juan        | García         | Pérez          |
| 19 | Jorge  | Martínez   | Sánchez    | 1019      | jorge.martinez@example.com   |              9 |       9 | Juan        | García         | Pérez          |
| 20 | Lucía  | Sánchez    | Pérez      | 1020      | lucia.sanchez@example.com    |             10 |       5 | Javier      | Díaz           | Fernández      |
| 21 | Daniel | López      | Gómez      | 1021      | daniel.lopez@example.com     |              1 |       1 | NULL        | NULL           | NULL           |
| 22 | Haymer | Fernando   | Camacho    | 1022      | Fernando.Camacho@example.com |           NULL |       2 | Daniel      | López          | Gómez          |
+----+--------+------------+------------+-----------+------------------------------+----------------+---------+-------------+----------------+----------------+
</pre>



### Consultas resumen

1. ¿Cuántos empleados hay en la compañía?

```sql
select count(*) as CantEmpleados
from empleado;
```
<pre>+---------------+
| CantEmpleados |
+---------------+
|            22 |
+---------------+
</pre>



2. ¿Cuántos clientes tiene cada país?

```sql
select ps.nombre , count(ps.nombre) as Clientes
from cliente as cl
inner join direccion_cliente as dc on cl.id = dc.idCliente
inner join ciudad as ct on ct.id = dc.idCiudad
inner join region as rg on rg.id = ct.id_region
inner join pais as ps on ps.id = rg.id_pais
group by ps.nombre;
```

<pre>+-----------+----------+
| nombre    | Clientes |
+-----------+----------+
| Argentina |        7 |
| Brasil    |        4 |
| Chile     |        4 |
| Colombia  |        4 |
| México    |        1 |
+-----------+----------+
</pre>


3. ¿Cuál fue el pago medio en 2024?

```sql
SELECT FORMAT(AVG(total), 2) as Media
FROM pago
WHERE YEAR(fecha_pago) = 2024;
```

<pre>+--------+
| Media  |
+--------+
| 215.80 |
+--------+
</pre>

4. ¿Cuántos pedidos hay en cada ciudad? Ordena el resultado de forma
descendente por el número de pedidos.

```sql
select ct.nombre as Ciudad , count(ct.id) as PedidosCiudad
from pedido as p
inner join cliente as cl on p.idCliente = cl.id
inner join direccion_cliente as dc on dc.idCliente = cl.id
inner join ciudad as ct on ct.id = dc.idCiudad
group by ct.id;
```


<pre>+-------------------+---------------+
| Ciudad            | PedidosCiudad |
+-------------------+---------------+
| Buenos Aires      |             2 |
| La Plata          |             4 |
| Córdoba           |             2 |
| Villa Carlos Paz  |             1 |
| São Paulo         |             2 |
| Campinas          |             1 |
| Rio de Janeiro    |             1 |
| Niterói           |             1 |
| La Serena         |             2 |
| Coquimbo          |             1 |
| Los Andes         |             1 |
| San Felipe        |             1 |
| Bogotá            |             1 |
| Soacha            |             1 |
| Medellín          |             1 |
| Envigado          |             1 |
| Tuxtla Gutiérrez  |             1 |
+-------------------+---------------+
</pre>


5. Calcula el precio de venta del producto más caro y más barato en una
misma consulta.
```sql
SELECT id, idProveedor, nombre, gama, dimensiones, descripcion, cantidad_en_stock, precio_venta, precio_proveedor
FROM producto
WHERE precio_venta = (SELECT MAX(precio_venta) FROM producto) 
   OR precio_venta = (SELECT MIN(precio_venta) FROM producto)
ORDER BY precio_venta desc;
```
```sql
(
  SELECT *
  FROM producto
  WHERE precio_venta = (SELECT MAX(precio_venta) FROM producto)
  LIMIT 1
)
UNION
(
  SELECT *
  FROM producto
  WHERE precio_venta = (SELECT MIN(precio_venta) FROM producto)
  LIMIT 1
);
```


<pre>+----+-------------+----------------------------------------+------+-------------+------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
| id | idProveedor | nombre                                 | gama | dimensiones | descripcion                                                                              | cantidad_en_stock | precio_venta | precio_proveedor |
+----+-------------+----------------------------------------+------+-------------+------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
|  1 |           1 | Teléfono Inteligente X1                | 1    | 15x8x1 cm   | Un teléfono inteligente de última generación con una pantalla AMOLED de 6.5 pulgadas.    |               100 |       799.99 |           600.00 |
| 13 |           3 | Juego de Construcción Creativa Junior  | 3    | 20x20x5 cm  | Kit básico de bloques de construcción para niños pequeños.                               |               300 |        19.99 |            15.00 |
+----+-------------+----------------------------------------+------+-------------+------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
</pre>

6. Calcula el número de clientes que tiene la empresa.

```sql
SELECT COUNT(id) AS CantClientes
FROM cliente;
```

<pre>+--------------+
| CantClientes |
+--------------+
|           23 |
+--------------+
</pre>


7. ¿Cuántos clientes existen con domicilio en la ciudad de La plata?

```sql
select count(ct.id) as Clientes
from cliente as cl 
inner join direccion_cliente as dc on cl.id = dc.idCliente
inner join ciudad as ct on ct.id = dc.idCiudad
where ct.nombre = 'La plata' ;
```

<pre>+----------+
| Clientes |
+----------+
|        2 |
+----------+
</pre>

8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan
por M?

```sql
select ct.nombre , count(ct.id) as Clientes
from cliente as cl 
inner join direccion_cliente as dc on cl.id = dc.idCliente
inner join ciudad as ct on ct.id = dc.idCiudad
where ct.nombre like 'M%' or  ct.nombre like 'm%'
group by ct.nombre;
```

<pre>+-----------+----------+
| nombre    | Clientes |
+-----------+----------+
| Medellín  |        1 |
+-----------+----------+
</pre>



9. Devuelve el nombre de los representantes de ventas y el número de clientes
al que atiende cada uno.

```sql
select em.nombre as Representante , count(em.id) as Clientes
from cliente as cl
inner join empleado as em on cl.idEmpleadoReporteVentas = em.id
group by em.id , cl.idEmpleadoReporteVentas;
```
<pre>+---------------+----------+
| Representante | Clientes |
+---------------+----------+
| Juan          |        2 |
| María         |        2 |
| Carlos        |        2 |
| Laura         |        2 |
| Javier        |        2 |
| Ana           |        3 |
| David         |        2 |
| Carmen        |        1 |
| Pablo         |        1 |
| Sara          |        1 |
| Diego         |        1 |
| Elena         |        1 |
| Mario         |        1 |
+---------------+----------+
</pre>



10. Calcula el número de clientes que no tiene asignado representante de
ventas.

```sql
SELECT count(cl.id) as SinRepresentante
FROM cliente AS cl
left JOIN empleado AS e ON cl.idEmpleadoReporteVentas = e.id
where cl.idEmpleadoReporteVentas is null ;
```

<pre>+------------------+
| SinRepresentante |
+------------------+
|                2 |
+------------------+
</pre>

11. Calcula la fecha del primer y último pago realizado por cada uno de los
clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

```sql
select cl.nombre , MAX(pg.fecha_pago) as UltimoPago , MIN(pg.fecha_pago) as PrimerPago
from cliente as cl 
inner join pago as pg on cl.id = pg.idCliente
group by cl.nombre
order by cl.nombre;
```

<pre>+----------+------------+------------+
| nombre   | UltimoPago | PrimerPago |
+----------+------------+------------+
| Ana      | 2024-05-06 | 2024-05-06 |
| Carlos   | 2024-05-03 | 2024-05-03 |
| Carmen   | 2024-05-08 | 2024-05-08 |
| Daniel   | 2024-05-15 | 2024-05-15 |
| David    | 2024-05-07 | 2024-05-07 |
| Elena    | 2024-05-12 | 2024-05-12 |
| Javier   | 2024-05-05 | 2024-05-05 |
| José     | 2024-05-13 | 2024-05-13 |
| Juan     | 2024-05-19 | 2008-02-11 |
| Laura    | 2024-05-04 | 2024-05-04 |
| Luis     | 2024-05-11 | 2024-05-11 |
| María    | 2024-05-20 | 2024-05-02 |
| Marina   | 2024-05-18 | 2024-05-18 |
| Pablo    | 2024-05-09 | 2024-05-09 |
| Patricia | 2024-05-16 | 2024-05-16 |
| Paula    | 2024-05-14 | 2024-05-14 |
| Roberto  | 2024-05-17 | 2024-05-17 |
| Sara     | 2024-05-10 | 2024-05-10 |
+----------+------------+------------+
</pre>

12. Calcula el número de productos diferentes que hay en cada uno de los
pedidos.

```sql
select dp.idPedido as NumeroPedido , count(dp.idProducto) as CantProducto  
from pedido as pd 
inner join detalle_pedido as dp on pd.id = dp.idPedido
inner join producto as pt on pt.id = dp.idProducto
group by dp.idPedido 
order by NumeroPedido ;
```

<pre>+--------------+--------------+
| NumeroPedido | CantProducto |
+--------------+--------------+
|            1 |            4 |
|            2 |            4 |
|            3 |            3 |
|            4 |            2 |
|            5 |            2 |
|            6 |            1 |
|            7 |            1 |
|            8 |            1 |
|            9 |            1 |
|           10 |            1 |
|           11 |            1 |
|           12 |            1 |
|           13 |            1 |
|           14 |            1 |
|           15 |            1 |
|           16 |            1 |
|           17 |            1 |
|           18 |            1 |
|           19 |            1 |
|           20 |            1 |
+--------------+--------------+
</pre>



13. Calcula la suma de la cantidad total de todos los productos que aparecen en
cada uno de los pedidos.

```sql
select dp.idPedido as NumeroPedido , sum(precio_unidad * (dp.cantidad) ) as SumaTotal
from pedido as pd
inner join detalle_pedido as dp on pd.id = dp.idPedido
inner join producto as pt on pt.id = dp.idProducto
group by dp.idPedido 
order by NumeroPedido ;
```

<pre>+--------------+-----------+
| NumeroPedido | SumaTotal |
+--------------+-----------+
|            1 |   2449.91 |
|            2 |    949.92 |
|            3 |    629.85 |
|            4 |   1899.97 |
|            5 |   2599.96 |
|            6 |    399.98 |
|            7 |    199.96 |
|            8 |    249.99 |
|            9 |   1399.98 |
|           10 |    799.99 |
|           11 |    299.98 |
|           12 |     89.97 |
|           13 |    799.96 |
|           14 |    499.99 |
|           15 |   1399.98 |
|           16 |    799.99 |
|           17 |    299.98 |
|           18 |     89.97 |
|           19 |    799.96 |
|           20 |    499.99 |
+--------------+-----------+
</pre>


14. Devuelve un listado de los 10 productos más vendidos y el número total de
unidades que se han vendido de cada uno. El listado deberá estar ordenado
por el número total de unidades vendidas.

```sql
select pt.nombre as Producto , sum(dp.cantidad)  as UnidadesVendidas
from pedido as pd
inner join detalle_pedido as dp on pd.id = dp.idPedido
inner join producto as pt on pt.id = dp.idProducto
group by pt.nombre
order by UnidadesVendidas desc
limit 10;
```
<pre>+----------------------------------------+------------------+
| Producto                               | UnidadesVendidas |
+----------------------------------------+------------------+
| Kit de Construcción Creativa           |               21 |
| Chaqueta de Cuero Elegante             |               10 |
| Juego de Construcción Creativa XL      |                6 |
| Aspiradora Turbo                       |                5 |
| Teléfono Inteligente Y2                |                5 |
| Teléfono Inteligente X1                |                4 |
| Juego de Construcción Creativa Junior  |                4 |
| Bicicleta de Montaña Elite             |                4 |
| Bicicleta de Montaña                   |                3 |
| Aspiradora Potente Plus                |                3 |
+----------------------------------------+------------------+
</pre>





15. La facturación que ha tenido la empresa en toda la historia, indicando la
base imponible, el IVA y el total facturado. La base imponible se calcula
sumando el coste del producto por el número de unidades vendidas de la
tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la
suma de los dos campos anteriores.

```sql
select * , tabla.BaseImponible + tabla.Iva as Total
from (
select sum(precio_unidad * (dp.cantidad) ) as BaseImponible , sum((precio_unidad * dp.cantidad) * (0.21 ) ) as Iva 
from pedido as pd
inner join detalle_pedido as dp on pd.id = dp.idPedido
inner join producto as pt on pt.id = dp.idProducto) as tabla;
```

<pre>+---------------+-----------+------------+
| BaseImponible | Iva       | Total      |
+---------------+-----------+------------+
|      17159.28 | 3603.4488 | 20762.7288 |
+---------------+-----------+------------+
</pre>


16. La misma información que en la pregunta anterior, pero agrupada por
código de producto.

```sql
select * , tabla.BaseImponible + tabla.Iva as Total
from(
select  dp.idProducto as idProducto , sum(dp.cantidad) as CantProducto , sum(precio_unidad * (dp.cantidad) ) as BaseImponible ,  sum((precio_unidad * dp.cantidad) * (0.21 ) ) as Iva 
from pedido as pd 
inner join detalle_pedido as dp on pd.id = dp.idPedido
inner join producto as pt on pt.id = dp.idProducto
group by dp.idProducto
order by CantProducto desc) as tabla;
```
<pre>+------------+--------------+---------------+----------+-----------+
| idProducto | CantProducto | BaseImponible | Iva      | Total     |
+------------+--------------+---------------+----------+-----------+
|          3 |           21 |        629.79 | 132.2559 |  762.0459 |
|          4 |           10 |       1999.90 | 419.9790 | 2419.8790 |
|          8 |            6 |        299.94 |  62.9874 |  362.9274 |
|          2 |            5 |        749.95 | 157.4895 |  907.4395 |
|          6 |            5 |       3499.95 | 734.9895 | 4234.9395 |
|          1 |            4 |       3199.96 | 671.9916 | 3871.9516 |
|         10 |            4 |       2799.96 | 587.9916 | 3387.9516 |
|         13 |            4 |         79.96 |  16.7916 |   96.7516 |
|         12 |            3 |        299.97 |  62.9937 |  362.9637 |
|          5 |            3 |       1499.97 | 314.9937 | 1814.9637 |
|          7 |            3 |        599.97 | 125.9937 |  725.9637 |
|         11 |            2 |        999.98 | 209.9958 | 1209.9758 |
|          9 |            2 |        499.98 | 104.9958 |  604.9758 |
+------------+--------------+---------------+----------+-----------+
</pre>





17. La misma información que en la pregunta anterior, pero agrupada por
código de producto filtrada por los códigos que empiecen por 1.

```sql
select * , tabla.BaseImponible + tabla.Iva as Total
from(
select  dp.idProducto as idProducto , sum(dp.cantidad) as CantProducto , sum(precio_unidad * (dp.cantidad) ) as BaseImponible ,  sum((precio_unidad * dp.cantidad) * (0.21 ) ) as Iva 
from pedido as pd 
inner join detalle_pedido as dp on pd.id = dp.idPedido
inner join producto as pt on pt.id = dp.idProducto
where dp.idProducto like '1%'
group by dp.idProducto
order by CantProducto desc) as tabla;
```
<pre>+------------+--------------+---------------+----------+-----------+
| idProducto | CantProducto | BaseImponible | Iva      | Total     |
+------------+--------------+---------------+----------+-----------+
|          1 |            4 |       3199.96 | 671.9916 | 3871.9516 |
|         13 |            4 |         79.96 |  16.7916 |   96.7516 |
|         10 |            4 |       2799.96 | 587.9916 | 3387.9516 |
|         12 |            3 |        299.97 |  62.9937 |  362.9637 |
|         11 |            2 |        999.98 | 209.9958 | 1209.9758 |
+------------+--------------+---------------+----------+-----------+
</pre>






18. Lista las ventas totales de los productos que hayan facturado más de 3000
euros. Se mostrará el nombre, unidades vendidas, total facturado y total
facturado con impuestos (21% IVA).

```sql
select tabla.nombre , tabla.CantProducto , tabla.BaseImponible as TotalBruto ,  tabla.BaseImponible + tabla.Iva as TotalNeto
from(
select pt.nombre as Nombre,  dp.idProducto as idProducto , sum(dp.cantidad) as CantProducto , sum(precio_unidad * (dp.cantidad) ) as BaseImponible ,  sum((precio_unidad * dp.cantidad) * (0.21 ) ) as Iva 
from pedido as pd 
inner join detalle_pedido as dp on pd.id = dp.idPedido
inner join producto as pt on pt.id = dp.idProducto
group by dp.idProducto
order by CantProducto desc) as tabla
where tabla.BaseImponible > 3000;
```

<pre>+--------------------------+--------------+------------+-----------+
| nombre                   | CantProducto | TotalBruto | TotalNeto |
+--------------------------+--------------+------------+-----------+
| Teléfono Inteligente Y2  |            5 |    3499.95 | 4234.9395 |
| Teléfono Inteligente X1  |            4 |    3199.96 | 3871.9516 |
+--------------------------+--------------+------------+-----------+
</pre>


19. Muestre la suma total de todos los pagos que se realizaron para cada uno
de los años que aparecen en la tabla pagos.

```sql
SELECT YEAR(fecha_pago) AS Año, SUM(total) AS Total
FROM pago
GROUP BY YEAR(fecha_pago);
```
<pre>+------+---------+
| Año  | Total   |
+------+---------+
| 2024 | 4316.00 |
| 2008 |  900.50 |
+------+---------+
</pre>

Subconsultas
Con operadores básicos de comparación
1. Devuelve el nombre del cliente con mayor límite de crédito.


   
```sql
select CONCAT (c.nombre ,' ' ,c.apellido1 , ' ' , c.apellido2) as Nombre
from cliente as c
where c.limite_credito >= (select MAX(limite_credito) from cliente );
```

<pre>+------------------------+
| Nombre                 |
+------------------------+
| Manuel Steven Sánchez  |
+------------------------+</pre>


2. Devuelve el nombre del producto que tenga el precio de venta más caro.

```sql
select p.nombre , p.precio_venta
from producto as p 
where p.precio_venta >= ( select MAX(precio_venta) from producto);
```




<pre>+---------------------------------+--------------+
| nombre                          | precio_venta |
+---------------------------------+--------------+
| Teléfono Inteligente X1         |       799.99 |
| Bicicleta de Montaña Deportiva  |       799.99 |
+---------------------------------+--------------+
</pre>

3. Devuelve el nombre del producto del que se han vendido más unidades.
(Tenga en cuenta que tendrá que calcular cuál es el número total de
unidades que se han vendido de cada producto a partir de los datos de la
tabla detalle_pedido)

```sql
select tabla.Id, tabla.Nombre, tabla.Cantidad
from (
    select dp.idProducto as Id, pt.nombre as Nombre, sum(dp.cantidad) as Cantidad
    from detalle_pedido as dp
    inner join producto as pt on pt.id = dp.idProducto
    group by dp.idProducto, pt.nombre) as tabla
where tabla.Cantidad >= (
    select MAX(sub.Cantidad)
    from (
        select  sum(dp.cantidad) as Cantidad
        from detalle_pedido as dp
        group by dp.idProducto
    ) as sub
);
```






<pre>+----+-------------------------------+----------+
| Id | Nombre                        | Cantidad |
+----+-------------------------------+----------+
|  3 | Kit de Construcción Creativa  |       21 |
+----+-------------------------------+----------+
</pre>

4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya
realizado. (Sin utilizar INNER JOIN).

```sql

select cl.nombre, cl.limite_credito, 
       (select sum(pg.total) 
        from pago as pg 
        where pg.idCliente = cl.id 
        group by pg.idCliente) as Total
from cliente as cl
where cl.limite_credito > (
    select sum(pg.total) 
    from pago as pg 
    where pg.idCliente = cl.id 
    group by pg.idCliente
);
```



+----------+----------------+--------+
| nombre   | limite_credito | Total  |
+----------+----------------+--------+
| María    |        1500.00 | 630.75 |
| Carlos   |        2000.00 | 150.25 |
| Laura    |        2500.00 |  75.00 |
| Javier   |        3000.00 | 200.00 |
| Ana      |        3500.00 | 350.25 |
| David    |        4000.00 | 175.75 |
| Carmen   |        4500.00 | 300.00 |
| Pablo    |        5000.00 | 125.50 |
| Sara     |        5500.00 | 400.75 |
| Luis     |        6000.00 | 150.25 |
| Elena    |        6500.00 | 275.00 |
| José     |        7000.00 | 180.25 |
| Paula    |        7500.00 |  90.00 |
| Daniel   |        8000.00 | 220.50 |
| Patricia |        8500.00 | 320.75 |
| Roberto  |        9000.00 | 135.25 |
| Marina   |        9500.00 | 185.00 |
+----------+----------------+--------+


```sql
select cl.id as Id, cl.limite_credito
from cliente as cl
where cl.id in (
    select pg.idCliente
    from pago as pg
    group by pg.idCliente
)
and cl.limite_credito > (
    select sum(pg.total)
    from pago as pg
    where pg.idCliente = cl.id
    group by pg.idCliente
);
```




<pre>+----+----------------+
| Id | limite_credito |
+----+----------------+
|  2 |        1500.00 |
|  3 |        2000.00 |
|  4 |        2500.00 |
|  5 |        3000.00 |
|  6 |        3500.00 |
|  7 |        4000.00 |
|  8 |        4500.00 |
|  9 |        5000.00 |
| 10 |        5500.00 |
| 11 |        6000.00 |
| 12 |        6500.00 |
| 13 |        7000.00 |
| 14 |        7500.00 |
| 15 |        8000.00 |
| 16 |        8500.00 |
| 17 |        9000.00 |
| 18 |        9500.00 |
+----+----------------+
</pre>

5. Devuelve el producto que más unidades tiene en stock.

```sql
select p.id, p.nombre, p.descripcion, p.precio_venta, p.cantidad_en_stock, p.precio_proveedor , p.idProveedor , p.dimensiones , p.gama 
from producto p
where p.cantidad_en_stock = (
    select MAX(p2.cantidad_en_stock)
    from producto p2
);
```




<pre>+----+----------------------------------------+----------------------------------------------------------------+--------------+-------------------+------------------+-------------+-------------+------+
| id | nombre                                 | descripcion                                                    | precio_venta | cantidad_en_stock | precio_proveedor | idProveedor | dimensiones | gama |
+----+----------------------------------------+----------------------------------------------------------------+--------------+-------------------+------------------+-------------+-------------+------+
| 13 | Juego de Construcción Creativa Junior  | Kit básico de bloques de construcción para niños pequeños.     |        19.99 |               300 |            15.00 |           3 | 20x20x5 cm  | 3    |
+----+----------------------------------------+----------------------------------------------------------------+--------------+-------------------+------------------+-------------+-------------+------+
</pre>


6. Devuelve el producto que menos unidades tiene en stock.

```sql
select p.id, p.nombre, p.descripcion, p.precio_venta, p.cantidad_en_stock, p.precio_proveedor , p.idProveedor , p.dimensiones , p.gama 
from producto p
where p.cantidad_en_stock = (
    select MIN(p2.cantidad_en_stock)
    from producto p2
);
```




<pre>+----+---------------------------------+----------------------------------------------------------------+--------------+-------------------+------------------+-------------+--------------+------+
| id | nombre                          | descripcion                                                    | precio_venta | cantidad_en_stock | precio_proveedor | idProveedor | dimensiones  | gama |
+----+---------------------------------+----------------------------------------------------------------+--------------+-------------------+------------------+-------------+--------------+------+
| 15 | Bicicleta de Montaña Deportiva  | Bicicleta de montaña resistente para aventuras al aire libre.  |       799.99 |                10 |           600.00 |           5 | 150x50x80 cm | 5    |
+----+---------------------------------+----------------------------------------------------------------+--------------+-------------------+------------------+-------------+--------------+------+
</pre>


7. Devuelve el nombre, los apellidos y el email de los empleados que están a
cargo de Juan Dìaz.

```sql
select concat( e2.nombre ,' ' , e2.apellido1 ,' ', e2.apellido2 ) nombre 
from empleado as e 
inner join empleado as e2 on e2.codigo_jefe = e.id
where e2.codigo_jefe = 5 ;
```

```sql

select concat( e2.nombre ,' ' , e2.apellido1 ,' ', e2.apellido2 ) nombre 
from empleado as j
inner join empleado as e2 on e2.codigo_jefe = j.id
where j.nombre = 'Javier' and j.apellido1 = 'Dìaz' ;
```



<pre>+------------------------+
| nombre                 |
+------------------------+
| Juan García Pérez      |
| Sara Rodríguez Pérez   |
| Diego López Díaz       |
| Lucía Sánchez Pérez    |
+------------------------+</pre>


8. Devuelve el nombre del cliente con mayor límite de crédito.

```sql
select * 
from cliente
where limite_credito >= all(select limite_credito
from cliente) ;
```




<pre>+----+--------+-----------+-----------+-------------------------+----------------+
| id | nombre | apellido1 | apellido2 | idEmpleadoReporteVentas | limite_credito |
+----+--------+-----------+-----------+-------------------------+----------------+
| 21 | Manuel | Steven    | Sánchez   |                       6 |       15000.00 |
+----+--------+-----------+-----------+-------------------------+----------------+
</pre>

9. Devuelve el nombre del producto que tenga el precio de venta más caro.

```sql
select * 
from producto
where precio_venta >= all (select precio_venta from producto);
```


<pre>+----+-------------+---------------------------------+------+--------------+------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
| id | idProveedor | nombre                          | gama | dimensiones  | descripcion                                                                              | cantidad_en_stock | precio_venta | precio_proveedor |
+----+-------------+---------------------------------+------+--------------+------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
|  1 |           1 | Teléfono Inteligente X1         | 1    | 15x8x1 cm    | Un teléfono inteligente de última generación con una pantalla AMOLED de 6.5 pulgadas.    |               100 |       799.99 |           600.00 |
| 15 |           5 | Bicicleta de Montaña Deportiva  | 5    | 150x50x80 cm | Bicicleta de montaña resistente para aventuras al aire libre.                            |                10 |       799.99 |           600.00 |
+----+-------------+---------------------------------+------+--------------+------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
</pre>

10. Devuelve el producto que menos unidades tiene en stock.

```sql
select * 
from producto
where cantidad_en_stock <= all (select cantidad_en_stock from producto);
```



<pre>+----+-------------+---------------------------------+------+--------------+----------------------------------------------------------------+-------------------+--------------+------------------+
| id | idProveedor | nombre                          | gama | dimensiones  | descripcion                                                    | cantidad_en_stock | precio_venta | precio_proveedor |
+----+-------------+---------------------------------+------+--------------+----------------------------------------------------------------+-------------------+--------------+------------------+
| 15 |           5 | Bicicleta de Montaña Deportiva  | 5    | 150x50x80 cm | Bicicleta de montaña resistente para aventuras al aire libre.  |                10 |       799.99 |           600.00 |
+----+-------------+---------------------------------+------+--------------+----------------------------------------------------------------+-------------------+--------------+------------------+
</pre>


11. Devuelve el nombre, apellido1 y cargo de los empleados que no
representen a ningún cliente.


```sql

select concat(e.nombre , ' ' , e.apellido1) as Nombre , c.tipo as nombre
from empleado as e 
inner join cargo as c on c.id = e.idcargo
where e.id not in(
select e.id
from cliente as cl 
inner join empleado as e on cl.idEmpleadoReporteVentas = e.id);
```




<pre>+-------------------+----------------------------------------+
| Nombre            | nombre                                 |
+-------------------+----------------------------------------+
| Daniel López      | Gerente General                        |
| Haymer Fernando   | Director de Ventas                     |
| Lucía Sánchez     | Técnico de Soporte                     |
| Luisa Martínez    | Asistente Administrativo               |
| Miguel Fernández  | Contador                               |
| Raquel Gómez      | Ingeniero de Desarrollo                |
| Jorge Martínez    | Especialista en Recursos Humanos       |
| Isabel Díaz       | Especialista en Seguridad Informática  |
| Pedro Gómez       | Ingeniero de Sistemas                  |
+-------------------+----------------------------------------+
</pre>

12. Devuelve un listado que muestre solamente los clientes que no han
realizado ningún pago.

```sql

select cl.id , cl.nombre , cl.apellido1 , cl.apellido2 , cl.idEmpleadoReporteVentas , cl.limite_credito
from cliente as cl
where id not in (select cl.id
                from cliente as cl 
                inner join pago as p on cl.id = p.idCliente);
```


 <pre>+----+----------+-----------+------------+-------------------------+----------------+
| id | nombre   | apellido1 | apellido2  | idEmpleadoReporteVentas | limite_credito |
+----+----------+-----------+------------+-------------------------+----------------+
| 19 | Joaquín  | Pérez     | Rodríguez  |                       6 |       10000.00 |
| 20 | Cristina | Gómez     | López      |                       7 |       10500.00 |
| 21 | Manuel   | Steven    | Sánchez    |                       6 |       15000.00 |
| 22 | María    | Steven    | Sánchez    |                    NULL |        1000.00 |
| 23 | Cristina | Martínez  | Carmen     |                    NULL |        1200.00 |
+----+----------+-----------+------------+-------------------------+----------------+
</pre>



13. Devuelve un listado que muestre solamente los clientes que sí han realizado
algún pago.

```sql
select cl.id , cl.nombre , cl.apellido1 , cl.apellido2 , cl.idEmpleadoReporteVentas , cl.limite_credito
from cliente as cl
where id in (select cl.id
                from cliente as cl 
                inner join pago as p on cl.id = p.idCliente);
```



<pre>+----+----------+------------+------------+-------------------------+----------------+
| id | nombre   | apellido1  | apellido2  | idEmpleadoReporteVentas | limite_credito |
+----+----------+------------+------------+-------------------------+----------------+
|  1 | Juan     | López      | García     |                       1 |        1000.00 |
|  2 | María    | Martínez   | Sánchez    |                       2 |        1500.00 |
|  3 | Carlos   | González   | Fernández  |                       3 |        2000.00 |
|  4 | Laura    | Pérez      | Díaz       |                       4 |        2500.00 |
|  5 | Javier   | Gómez      | Martínez   |                       5 |        3000.00 |
|  6 | Ana      | Sánchez    | López      |                       6 |        3500.00 |
|  7 | David    | Martínez   | Gómez      |                       7 |        4000.00 |
|  8 | Carmen   | Fernández  | Sánchez    |                       8 |        4500.00 |
|  9 | Pablo    | Rodríguez  | Pérez      |                       9 |        5000.00 |
| 10 | Sara     | López      | Martínez   |                      10 |        5500.00 |
| 11 | Luis     | García     | Hernández  |                      11 |        6000.00 |
| 12 | Elena    | Pérez      | Gómez      |                      12 |        6500.00 |
| 13 | José     | Martínez   | Fernández  |                      13 |        7000.00 |
| 14 | Paula    | Sánchez    | López      |                       1 |        7500.00 |
| 15 | Daniel   | Gómez      | Rodríguez  |                       2 |        8000.00 |
| 16 | Patricia | Fernández  | Martínez   |                       3 |        8500.00 |
| 17 | Roberto  | López      | Gómez      |                       4 |        9000.00 |
| 18 | Marina   | Martínez   | Sánchez    |                       5 |        9500.00 |
+----+----------+------------+------------+-------------------------+----------------+</pre>



14. Devuelve un listado de los productos que nunca han aparecido en un
pedido.

```sql
select p.nombre 
from producto as p
where p.id not in (select p.id
from producto as p 
inner join detalle_pedido as dp on p.id = dp.idProducto);
```




<pre>+---------------------------------+
| nombre                          |
+---------------------------------+
| Chaqueta de Cuero Moderna       |
| Bicicleta de Montaña Deportiva  |
+---------------------------------+
</pre>


15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
empleados que no sean representante de ventas de ningún cliente.

```sql
select nombre , apellido1 , apellido2 , extension
from empleado 
where id not in (select cl.idEmpleadoReporteVentas  
from empleado as em 
inner join cliente as cl on cl.idEmpleadoReporteVentas = em.id);
```



<pre>+--------+------------+------------+-----------+
| nombre | apellido1  | apellido2  | extension |
+--------+------------+------------+-----------+
| Isabel | Díaz       | Rodríguez  | 1014      |
| Pedro  | Gómez      | López      | 1015      |
| Luisa  | Martínez   | Fernández  | 1016      |
| Miguel | Fernández  | Gómez      | 1017      |
| Raquel | Gómez      | Martínez   | 1018      |
| Jorge  | Martínez   | Sánchez    | 1019      |
| Lucía  | Sánchez    | Pérez      | 1020      |
| Daniel | López      | Gómez      | 1021      |
| Haymer | Fernando   | Camacho    | 1022      |
+--------+------------+------------+-----------+
</pre>


16. Devuelve las oficinas donde no trabajan ninguno de los empleados que
hayan sido los representantes de ventas de algún cliente que haya realizado
la compra de algún producto de la gama Moda.

```sql
SELECT o.id, o.nombre
FROM oficina AS o
INNER JOIN empleado AS e ON o.id = e.codigo_oficina
WHERE e.id NOT IN (
    SELECT e.id
    FROM oficina AS o
    INNER JOIN empleado AS e ON e.codigo_oficina = o.id
    INNER JOIN cliente AS cl ON cl.idEmpleadoReporteVentas = e.id
    INNER JOIN pedido AS pd ON pd.idCliente = cl.id
    INNER JOIN detalle_pedido AS dp ON dp.idPedido = pd.id
    INNER JOIN producto AS pt ON pt.id = dp.idProducto
    INNER JOIN gama_producto gp ON gp.gama = pt.gama
    WHERE gp.gama = 4)
group by o.id , o.nombre;
```
<pre>+----+----------------------------------------+
| id | nombre                                 |
+----+----------------------------------------+
|  1 | Oficina principal                      |
|  2 | Oficina de ventas                      |
|  4 | Oficina de recursos humanos            |
|  5 | Oficina de contabilidad                |
|  6 | Oficina de marketing                   |
|  7 | Oficina de soporte técnico             |
|  8 | Oficina de calidad                     |
|  9 | Oficina de investigación y desarrollo  |
| 10 | Oficina administrativa                 |
+----+----------------------------------------+
</pre>




18. Devuelve un listado con los clientes que han realizado algún pedido pero no
han realizado ningún pago.

```sql
select *
from cliente 
where id in(
SELECT cl.id
FROM cliente AS cl
LEFT JOIN pago AS pg ON pg.idCliente = cl.id
INNER JOIN pedido AS pd ON pd.idCliente = cl.id
WHERE pg.idCliente IS NULL);
```




<pre>+----+----------+-----------+------------+-------------------------+----------------+
| id | nombre   | apellido1 | apellido2  | idEmpleadoReporteVentas | limite_credito |
+----+----------+-----------+------------+-------------------------+----------------+
| 19 | Joaquín  | Pérez     | Rodríguez  |                       6 |       10000.00 |
| 20 | Cristina | Gómez     | López      |                       7 |       10500.00 |
+----+----------+-----------+------------+-------------------------+----------------+
</pre>

18. Devuelve un listado que muestre solamente los clientes que no han
realizado ningún pago.

```sql

SELECT concat(cl.nombre , ' ' , cl.apellido1 , ' ' , cl.apellido2) as Cliente
FROM cliente AS cl
WHERE NOT EXISTS (
    SELECT cl2.id
    FROM cliente AS cl2
    INNER JOIN pago AS pg ON pg.idCliente = cl.id
    GROUP BY cl2.id
)
ORDER BY cl.id;
```



<pre>+----------------------------+
| Cliente                    |
+----------------------------+
| Joaquín Pérez Rodríguez    |
| Cristina Gómez López       |
| Manuel Steven Sánchez      |
| María Steven Sánchez       |
| Cristina Martínez Carmen   |
+----------------------------+
</pre>


19. Devuelve un listado que muestre solamente los clientes que sí han realizado
algún pago.

```sql
select cl.id , concat(cl.nombre , ' ' , cl.apellido1 , ' ' , cl.apellido2) as Cliente
from cliente as cl
where EXISTS(select cl.id
                from pago as pg
                where cl.id = pg.idCliente);
```

<pre>+----+-------------------------------+
| id | Cliente                       |
+----+-------------------------------+
|  1 | Juan López García             |
|  2 | María Martínez Sánchez        |
|  3 | Carlos González Fernández     |
|  4 | Laura Pérez Díaz              |
|  5 | Javier Gómez Martínez         |
|  6 | Ana Sánchez López             |
|  7 | David Martínez Gómez          |
|  8 | Carmen Fernández Sánchez      |
|  9 | Pablo Rodríguez Pérez         |
| 10 | Sara López Martínez           |
| 11 | Luis García Hernández         |
| 12 | Elena Pérez Gómez             |
| 13 | José Martínez Fernández       |
| 14 | Paula Sánchez López           |
| 15 | Daniel Gómez Rodríguez        |
| 16 | Patricia Fernández Martínez   |
| 17 | Roberto López Gómez           |
| 18 | Marina Martínez Sánchez       |
+----+-------------------------------+
</pre>


20. Devuelve un listado de los productos que nunca han aparecido en un
pedido.

```sql
select p.nombre 
from producto as p
where NOT EXISTS (select p.nombre
                  from detalle_pedido as dp 
                  where p.id = dp.idProducto
                   );

```


21.Devuelve un listado de los productos que han aparecido en un pedido
alguna vez.

```sql
select p.id , p.nombre
from producto as p 
where NOT EXISTS (select * 
                  from detalle_pedido as dp 
                  where p.id = dp.idProducto);
```

<pre>+----+---------------------------------+
| id | nombre                          |
+----+---------------------------------+
| 14 | Chaqueta de Cuero Moderna       |
| 15 | Bicicleta de Montaña Deportiva  |
+----+---------------------------------+
</pre>

### Subconsultas correlacionadas
### Consultas variadas

1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos
pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no
han realizado ningún pedido.

```sql
select cl.nombre , count(pd.id) as Pedidos
from cliente as cl 
left join pedido as pd on pd.idCliente = cl.id 
left join detalle_pedido dtp on dtp.idPedido = pd.id
group by cl.nombre , cl.id;
```
<pre>+----------+---------+
| nombre   | Pedidos |
+----------+---------+
| Juan     |       4 |
| María    |       4 |
| Carlos   |       3 |
| Laura    |       2 |
| Javier   |       3 |
| Ana      |       1 |
| David    |       1 |
| Carmen   |       1 |
| Pablo    |       2 |
| Sara     |       1 |
| Luis     |       1 |
| Elena    |       1 |
| José     |       1 |
| Paula    |       1 |
| Daniel   |       1 |
| Patricia |       1 |
| Roberto  |       1 |
| Marina   |       1 |
| Joaquín  |       3 |
| Cristina |       1 |
| Manuel   |       0 |
| María    |       0 |
| Cristina |       0 |
+----------+---------+
</pre>


2. Devuelve un listado con los nombres de los clientes y el total pagado por
cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han
realizado ningún pago.
```sql

select cl.nombre , sum(pg.total)
from cliente as cl 
left join pago as pg on pg.idCliente = cl.id
group by cl.id , pg.idCliente;
```
<pre>+----------+---------------+
| nombre   | sum(pg.total) |
+----------+---------------+
| Juan     |       1251.25 |
| María    |        630.75 |
| Carlos   |        150.25 |
| Laura    |         75.00 |
| Javier   |        200.00 |
| Ana      |        350.25 |
| David    |        175.75 |
| Carmen   |        300.00 |
| Pablo    |        125.50 |
| Sara     |        400.75 |
| Luis     |        150.25 |
| Elena    |        275.00 |
| José     |        180.25 |
| Paula    |         90.00 |
| Daniel   |        220.50 |
| Patricia |        320.75 |
| Roberto  |        135.25 |
| Marina   |        185.00 |
| Joaquín  |          NULL |
| Cristina |          NULL |
| Manuel   |          NULL |
| María    |          NULL |
| Cristina |          NULL |
+----------+---------------+
</pre>



3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008
ordenados alfabéticamente de menor a mayor.

```sql
select cl.nombre as Nombre 
from cliente as cl 
inner join pedido as pd on pd.idCliente = cl.id 
where YEAR(pd.fecha_pedido) = 2024
order by Nombre;
```

<pre>+----------+
| Nombre   |
+----------+
| Ana      |
| Carlos   |
| Carmen   |
| Cristina |
| Daniel   |
| David    |
| Elena    |
| Javier   |
| Javier   |
| Joaquín  |
| Joaquín  |
| Joaquín  |
| José     |
| Juan     |
| Laura    |
| Luis     |
| María    |
| Marina   |
| Pablo    |
| Pablo    |
| Patricia |
| Paula    |
| Roberto  |
| Sara     |
+----------+
</pre>



4. Devuelve el nombre del cliente, el nombre y primer apellido de su
representante de ventas y el número de teléfono de la oficina del
representante de ventas, de aquellos clientes que no hayan realizado ningún
pago.

```sql
 select concat(cl.nombre, ' ' , cl.apellido1 , ' ' , cl.apellido2) as Cliente , concat(em.nombre , ' ' , em.apellido1) as Representante, tel.numero  as NumeroOficina
 from cliente as cl 
 inner join empleado as em on cl.idEmpleadoReporteVentas = em.id 
 inner join oficina as o on o.id = em.codigo_oficina 
 inner join telefono_oficina as tel on tel.idOficina = o.id
 left join pago as pg on pg.idCliente = cl.id
 where pg.id is null;
```
<pre>+----------------------------+---------------+----------------+
| Cliente                    | Representante | NumeroOficina  |
+----------------------------+---------------+----------------+
| Joaquín Pérez Rodríguez    | Ana Pérez     | +5491112345678 |
| Cristina Gómez López       | David Gómez   | +541141414141  |
| Manuel Steven Sánchez      | Ana Pérez     | +5491112345678 |
+----------------------------+---------------+----------------+
</pre>




5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el
nombre y primer apellido de su representante de ventas y la ciudad donde
está su oficina.

```sql
select concat(cl.nombre, ' ' , cl.apellido1 , ' ' , cl.apellido2) as Cliente , concat(em.nombre , ' ' , em.apellido1) as Representante, ct.nombre as CiudadOficina
from cliente as cl 
inner join empleado as em on cl.idEmpleadoReporteVentas = em.id 
inner join oficina as o on o.id = em.codigo_oficina
inner join direccion_oficina as dir on dir.idOficina = o.id
inner join ciudad as ct on ct.id = dir.idCIudad;
```
<pre>+-------------------------------+------------------+------------------+
| Cliente                       | Representante    | CiudadOficina    |
+-------------------------------+------------------+------------------+
| Juan López García             | Juan García      | Buenos Aires     |
| Paula Sánchez López           | Juan García      | Buenos Aires     |
| Luis García Hernández         | Diego López      | Buenos Aires     |
| María Martínez Sánchez        | María López      | La Plata         |
| Daniel Gómez Rodríguez        | María López      | La Plata         |
| Elena Pérez Gómez             | Elena García     | La Plata         |
| Carlos González Fernández     | Carlos Martínez  | Córdoba          |
| Patricia Fernández Martínez   | Carlos Martínez  | Córdoba          |
| José Martínez Fernández       | Mario Sánchez    | Córdoba          |
| Laura Pérez Díaz              | Laura Sánchez    | Villa Carlos Paz |
| Roberto López Gómez           | Laura Sánchez    | Villa Carlos Paz |
| Javier Gómez Martínez         | Javier Díaz      | São Paulo        |
| Marina Martínez Sánchez       | Javier Díaz      | São Paulo        |
| Ana Sánchez López             | Ana Pérez        | Campinas         |
| Joaquín Pérez Rodríguez       | Ana Pérez        | Campinas         |
| Manuel Steven Sánchez         | Ana Pérez        | Campinas         |
| David Martínez Gómez          | David Gómez      | Rio de Janeiro   |
| Cristina Gómez López          | David Gómez      | Rio de Janeiro   |
| Carmen Fernández Sánchez      | Carmen Martínez  | Niterói          |
| Pablo Rodríguez Pérez         | Pablo Fernández  | La Serena        |
| Sara López Martínez           | Sara Rodríguez   | Coquimbo         |
+-------------------------------+------------------+------------------+
</pre>



6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
empleados que no sean representante de ventas de ningún cliente.

```sql
select concat(em.nombre , ' ' , em.apellido1) as Representante , cg.tipo as Puesto , tel.numero as TelefonoOficina
from cliente as cl 
right join empleado as em on cl.idEmpleadoReporteVentas = em.id
inner join cargo as cg on em.idCargo = cg.id
inner join oficina as o on o.id = em.codigo_oficina
inner join telefono_oficina as tel on tel.idOficina = o.id
where cl.id is null;
```
<pre>+-------------------+----------------------------------------+-----------------+
| Representante     | Puesto                                 | TelefonoOficina |
+-------------------+----------------------------------------+-----------------+
| Isabel Díaz       | Especialista en Seguridad Informática  | +541199999999   |
| Pedro Gómez       | Ingeniero de Sistemas                  | +541122222222   |
| Luisa Martínez    | Asistente Administrativo               | +5491112345678  |
| Miguel Fernández  | Contador                               | +541141414141   |
| Raquel Gómez      | Ingeniero de Desarrollo                | +541155555555   |
| Jorge Martínez    | Especialista en Recursos Humanos       | +541199999999   |
| Lucía Sánchez     | Técnico de Soporte                     | +541133333333   |
| Daniel López      | Gerente General                        | +1234567890     |
+-------------------+----------------------------------------+-----------------+
</pre>



7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el
número de empleados que tiene.

```sql
select ct.nombre as Nombre , count(em.id) as NumEmpleados
from ciudad as ct 
inner join direccion_oficina as dir on dir.idCiudad = ct.id
inner join oficina as o on o.id = dir.idOficina
inner join empleado as em on em.codigo_oficina = o.id
group by ct.id , dir.id , o.id ;
```

<pre>+------------------+--------------+
| Nombre           | NumEmpleados |
+------------------+--------------+
| Buenos Aires     |            3 |
| La Plata         |            2 |
| Córdoba          |            2 |
| Villa Carlos Paz |            2 |
| São Paulo        |            2 |
| Campinas         |            2 |
| Rio de Janeiro   |            2 |
| Niterói          |            2 |
| La Serena        |            2 |
| Coquimbo         |            2 |
</pre>


                
