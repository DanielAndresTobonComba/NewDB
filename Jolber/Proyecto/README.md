### proyectoSQL

1. Obtener el historial de reparaciones de un vehículo específico.

### Consulta
~~~sql
select v.placa as Placa , CONCAT(cl.nombre , ' ' , cl.apellido) as Dueño , r.costoTotal , rs.idServicio , rs.fechaInicio , rs.fechaFin , rs.idPieza, rs.cantidadPiezas ,rs.descripcion, mv.nombre
from Vehiculo as v
inner join Reparacion as r on r.idVehiculo = v.id
inner join Cliente as cl on cl.id = v.idCliente
inner join Reparacion_servicio as rs on rs.idReparacion =r.id
inner join Marca_vehiculo as mv on mv.id = v.idMarca
where v.id = 1;
~~~

### Explicacion 
Para obtener esta información, necesitamos mirar en varias tablas de la base de datos. Por ejemplo, la tabla Vehiculo tiene datos sobre el vehículo mismo, como su placa y a qué cliente pertenece. La tabla Reparacion tiene detalles sobre la reparación en general, como el costo total. Luego, hay una tabla llamada Reparacion_servicio que detalla los servicios específicos que se están realizando como parte de la reparación.

En este caso, solo queremos información sobre un vehículo en particular, por eso usamos where v.id = 1 al final de la consulta. Esto significa que solo queremos la información del vehículo que tenga un identificador igual a 1.


### Rsultado 
<pre>+--------+-------------+------------+------------+-------------+------------+---------+----------------+---------------------------------------------------------------------+--------+
| Placa  | Dueño       | costoTotal | idServicio | fechaInicio | fechaFin   | idPieza | cantidadPiezas | descripcion                                                         | nombre |
+--------+-------------+------------+------------+-------------+------------+---------+----------------+---------------------------------------------------------------------+--------+
| ABC123 | Juan Pérez  |     290.00 |          1 | 2024-05-01  | 2024-05-01 |       1 |              5 | Se realizó el cambio de aceite y filtro en el motor del vehículo.   | Toyota |
| ABC123 | Juan Pérez  |     290.00 |          2 | 2024-05-01  | 2024-05-03 |    NULL |           NULL | Se realizó la reparación completa del motor del vehículo.           | Toyota |
+--------+-------------+------------+------------+-------------+------------+---------+----------------+---------------------------------------------------------------------+--------+
</pre>

2. Calcular el costo total de todas las reparaciones realizadas por un empleado
específico en un período de tiempo.

### Consulta 
~~~sql
select sum(rs.costo) as CostoTotal , e.id as IdEmpleado  , CONCAT(e.primerNombre , ' ' , e.segundoNombre) as Empleado
from Reparacion_servicio as rs 
inner join Reparacion_empleado as re on rs.id = re.idReparacion 
inner join Empleado as e on e.id = re.idEmpleado
where rs.fechaFin between '2024-04-01' and '2024-05-01'  and e.id = 4
group by e.id;
~~~



### Explicacion 
En resumen, esta consulta nos dará el costo total de los servicios de reparación, el identificador y el nombre completo del empleado que participó en las reparaciones con fecha de finalización entre el 1 de abril de 2024 y el 1 de mayo de 2024, y cuyo identificador de empleado es 4.

### Resultado

<pre>+------------+------------+------------+
| CostoTotal | IdEmpleado | Empleado   |
+------------+------------+------------+
|     190.00 |          4 | Ana María  |
+------------+------------+------------+</pre>

3. Listar todos los clientes y los vehículos que poseen

### Consulta
~~~sql
select  CONCAT(cl.nombre , ' ' , cl.apellido) as Dueño , v.placa , v.id
from Vehiculo as v 
inner join Cliente as cl on cl.id = v.idCLiente;
~~~

### Resultado

<pre>+----------------------+--------+----+
| Dueño                | placa  | id |
+----------------------+--------+----+
| Juan Pérez           | ABC123 |  1 |
| María González       | DEF456 |  2 |
| Pedro Martínez       | GHI789 |  3 |
| Ana López            | JKL012 |  4 |
| José Gómez           | MNO345 |  5 |
| Laura Hernández      | PQR678 |  6 |
| David Díaz           | STU901 |  7 |
| Elena Fernández      | VWX234 |  8 |
| Alejandro Rodríguez  | YZA567 |  9 |
| Sofía Sánchez        | BCD890 | 10 |
+----------------------+--------+----+
</pre>

### Explicacion 
En resumen esta me dira los vehiculos que tiene cada cliente con su respectiva placa e identificador dentro de la base de datos.



4. Obtener la cantidad de piezas en inventario para cada pieza


### Consulta
~~~sql
SELECT p.id as Id ,  p.nombre as Nombre , sum(inv.cantidad) as Total
FROM Pieza as p
INNER JOIN Inventario as inv ON p.id = inv.PiezaId
group by Nombre , Id ;

~~~
### Explicacion 

Esta consulta calcula el total de la cantidad de cada pieza en el inventario y muestra el resultado junto con el identificador y el nombre de cada pieza.

La información se obtiene de las tablas Pieza e Inventario. La tabla Inventario contiene la cantidad de cada pieza en el inventario, mientras que la tabla Pieza contiene información sobre cada pieza, incluidos su identificador y nombre.

### Resultado
<pre>+----+-------------------------+-------+
| Id | Nombre                  | Total |
+----+-------------------------+-------+
|  1 | Filtro de aceite        |    10 |
|  4 | Amortiguador            |     5 |
|  5 | Correa de distribución  |     1 |
|  6 | Filtro de aire          |    10 |
|  7 | Termostato              |     1 |
|  8 | Embrague                |     5 |
|  9 | Radiador                |    10 |
|  2 | Pastillas de freno      |     3 |
|  3 | Bujía de encendido      |     2 |
+----+-------------------------+-------+
</pre>

5. Obtener las citas programadas para un día específico

### Consulta
~~~sql
select id as NumeroCita , hora as FechaCita , idCLiente as Cliente , idTaller as Taller
from Cita
where  date(hora) = '2024-06-06';
~~~
### Explicacion 
Esta consulta selecciona el número de cita, la hora de la cita, el identificador del cliente y el identificador del taller de la tabla "Cita". Solo incluye las citas que ocurran en la fecha específica '2024-06-06'.


### Resultado


<pre>+------------+---------------------+---------+--------+
| NumeroCita | FechaCita           | Cliente | Taller |
+------------+---------------------+---------+--------+
|          1 | 2024-06-06 09:00:00 |       1 |      1 |
|          2 | 2024-06-06 10:30:00 |       2 |      1 |
|          3 | 2024-06-06 11:45:00 |       3 |      1 |
+------------+---------------------+---------+--------+
</pre>

6. Mostrar una factura de un cliente específico en una fecha determinada

### Consulta
~~~sql
select f.id as NumeroFactura, cl.idTaller as Taller , f.fecha as Fecha , f.idReparacion as NumReparacion , f.impuesto as ProcentajeImpuesto , f.total as Total 
from Cliente as cl
inner join Factura as f on cl.id = f.idCliente
inner join Reparacion as r on f.idReparacion = r.id
where f.fecha = '2024-05-07' ;
~~~
### Explicacion 

Esta consulta busca información específica de las facturas emitidas el 7 de mayo de 2024. Selecciona el número de factura, el taller asociado, la fecha de emisión, el número de reparación, el porcentaje de impuesto y el total de la factura. Estos datos provienen de las tablas Cliente, Factura y Reparacion.

### Resultado
<pre>+---------------+--------+------------+---------------+--------------------+--------+
| NumeroFactura | Taller | Fecha      | NumReparacion | ProcentajeImpuesto | Total  |
+---------------+--------+------------+---------------+--------------------+--------+
|             1 |      1 | 2024-05-07 |             1 |                  3 | 293.48 |
+---------------+--------+------------+---------------+--------------------+--------+
</pre>

7. Listar todas las órdenes de compra y sus detalles


### Consulta
~~~sql
SELECT
    oc.id AS idOrdenCompra,
    oc.fecha AS fecha,
    oc.idProveedor AS idProveedor,
    oc.idEmpleado AS idEmpleado,
    oc.total AS totalOrden,
    od.idOrdenCompra AS idOrdenCompraDetalle,
    od.idPieza AS idPieza,
    od.cantidad AS cantidad,
    od.idMarca AS idMarca,
    od.precioUnidad AS precioUnidad
FROM Orden_compra AS oc
INNER JOIN Orden_detalle AS od ON oc.id = od.idOrdenCompra;

~~~
### Explicacion 

Esta consulta combina datos de dos tablas, Orden_compra y Orden_detalle, mediante una unión interna. Selecciona varios campos de ambas tablas. De la tabla Orden_compra se seleccionan el ID de la orden de compra, la fecha, el ID del proveedor, el ID del empleado que realizó la orden, y el total de la orden. De la tabla Orden_detalle se seleccionan el ID de la orden de compra y los detalles relacionados con cada pieza incluida en la orden: el ID de la pieza, la cantidad, el ID de la marca y el precio unitario

### Resultado
<pre>+---------------+------------+-------------+------------+------------+----------------------+---------+----------+---------+--------------+
| idOrdenCompra | fecha      | idProveedor | idEmpleado | totalOrden | idOrdenCompraDetalle | idPieza | cantidad | idMarca | precioUnidad |
+---------------+------------+-------------+------------+------------+----------------------+---------+----------+---------+--------------+
|             1 | 2024-06-01 |           1 |          1 |     500.00 |                    1 |       1 |       10 |       1 |        15.00 |
|             1 | 2024-06-01 |           1 |          1 |     500.00 |                    1 |       2 |        3 |       2 |        50.00 |
|             1 | 2024-06-01 |           1 |          1 |     500.00 |                    1 |       3 |        2 |       3 |       100.00 |
|             2 | 2024-06-02 |           2 |          1 |     750.00 |                    2 |       4 |        5 |       4 |        50.00 |
|             2 | 2024-06-02 |           2 |          1 |     750.00 |                    2 |       5 |        1 |       5 |       250.00 |
|             2 | 2024-06-02 |           2 |          1 |     750.00 |                    2 |       6 |       10 |       6 |        50.00 |
|             3 | 2024-06-03 |           3 |          1 |    1000.00 |                    3 |       7 |        1 |       7 |       550.00 |
|             3 | 2024-06-03 |           3 |          1 |    1000.00 |                    3 |       8 |        5 |       8 |        70.00 |
|             3 | 2024-06-03 |           3 |          1 |    1000.00 |                    3 |       9 |       10 |       9 |        10.00 |
+---------------+------------+-------------+------------+------------+----------------------+---------+----------+---------+--------------+
</pre>

8. Obtener el costo total de piezas utilizadas en una reparación específica

### Consulta
~~~sql
select tabla.NumReparacion , tabla.Vehiculo  , tabla.nombre as Nombre , tabla.Cantidad ,tabla.precioUnidad ,(tabla.Cantidad * tabla.precioUnidad) as CostePieza
from (select r.id as NumReparacion , r.idVehiculo as Vehiculo , rs.cantidadPiezas as Cantidad ,               p.nombre , od.precioUnidad 
        from Reparacion as r
        inner join Reparacion_servicio as rs on r.id = rs.idReparacion
        inner join Pieza as p on p.id = rs.idPieza
        inner join Orden_detalle as od on od.idPieza = p.id
        where r.id = 1) as tabla; 
~~~
### Explicacion 

La consulta selecciona datos detallados sobre las piezas utilizadas en una reparación específica, junto con el costo total de cada pieza. Los datos se obtienen de varias tablas y se filtran para una reparación particular (con ID 1). La consulta utiliza una subconsulta para reunir los datos necesarios, luego calcula el costo total de cada pieza multiplicando la cantidad de piezas por el precio unitario. Los resultados incluyen el número de reparación, el vehículo asociado, el nombre de la pieza y el costo total de cada pieza.

### Resultado

<pre>+---------------+----------+------------------+----------+--------------+------------+
| NumReparacion | Vehiculo | Nombre           | Cantidad | precioUnidad | CostePieza |
+---------------+----------+------------------+----------+--------------+------------+
|             1 |        1 | Filtro de aceite |        5 |        15.00 |      75.00 |
+---------------+----------+------------------+----------+--------------+------------+
</pre>

9. Obtener el inventario de piezas que necesitan ser reabastecidas (cantidad
menor que un umbral)

### Consulta

~~~sql
select p.nombre , p.id , i.cantidad 
from Pieza as p
inner join Inventario as i on p.id = i.piezaId
where i.cantidad < 10;
~~~

### Explicacion 

Esta consulta selecciona el nombre, el identificador y la cantidad de las piezas que tienen una cantidad en el inventario menor que 10
unidades de existencias disponibles 

### Resultado
<pre>+-------------------------+----+----------+
| nombre                  | id | cantidad |
+-------------------------+----+----------+
| Amortiguador            |  4 |        5 |
| Correa de distribución  |  5 |        1 |
| Termostato              |  7 |        1 |
| Embrague                |  8 |        5 |
| Pastillas de freno      |  2 |        3 |
| Bujía de encendido      |  3 |        2 |
+-------------------------+----+----------+
</pre>

10. Obtener la lista de servicios más solicitados en un período específico


### Consulta
~~~sql
select rp.idServicio , s.nombre , s.costoBase
from Reparacion_servicio as rp
inner join Servicio as s on rp.idServicio = s.id
where rp.fechaInicio between '2024-05-01 ' and '2024-05-17'
group by rp.idServicio , s.nombre
limit 2;
~~~

### Explicacion 


Esta consulta selecciona los nombres y costos base de hasta dos servicios que se utilizaron en reparaciones entre el 1 y el 17 de mayo de 2024. Los datos se obtienen de las tablas "Reparacion_servicio" y "Servicio", y se agrupan por servicio para evitar duplicados.


### Resultado
<pre>+------------+----------------------+-----------+
| idServicio | nombre               | costoBase |
+------------+----------------------+-----------+
|          1 | Cambio de aceite     |     40.00 |
|          2 | Reparación de motor  |    100.00 |
+------------+----------------------+-----------+
</pre>

11. Obtener el costo total de reparaciones para cada cliente en un período
específico

### Consulta
~~~sql
SELECT f.id as idFactura, f.fecha, f.idReparacion, f.idCliente, f.impuesto, f.total, 
       cl.id as idCliente, cl.identificacion, cl.nombre, cl.apellido, cl.direccion, cl.email, 
       cl.idTipoDocumento, cl.idTaller
FROM Factura as f
INNER JOIN Cliente as cl ON cl.id = f.idCliente
WHERE f.fecha BETWEEN '2024-05-01' AND '2024-05-31';

~~~

### Explicacion 

Esta consulta selecciona datos de las tablas Factura y Cliente. Selecciona varios campos de la tabla Factura, incluyendo el ID de la factura, la fecha, el ID de la reparacion asociada, el ID del cliente, el impuesto y el total. También selecciona varios campos de la tabla Cliente, como el ID del cliente, la identificación, el nombre, el apellido, la dirección, el correo electrónico, el tipo de documento y el ID del taller

Los datos se seleccionan para facturas emitidas entre el 1 y el 31 de mayo de 2024. La tabla Cliente se une a la tabla Factura mediante el ID del cliente para obtener información adicional del cliente asociado a cada factura

### Resultado


<pre>+-----------+------------+--------------+-----------+----------+--------+-----------+----------------+--------+----------+-----------+------------------+-----------------+----------+
| idFactura | fecha      | idReparacion | idCliente | impuesto | total  | idCliente | identificacion | nombre | apellido | direccion | email            | idTipoDocumento | idTaller |
+-----------+------------+--------------+-----------+----------+--------+-----------+----------------+--------+----------+-----------+------------------+-----------------+----------+
|         1 | 2024-05-07 |            1 |         1 |        3 | 293.48 |         1 | 123456789      | Juan   | Pérez    | Calle 123 | juan@example.com |               1 |        1 |
+-----------+------------+--------------+-----------+----------+--------+-----------+----------------+--------+----------+-----------+------------------+-----------------+----------+
</pre>


12. Listar los empleados con mayor cantidad de reparaciones realizadas en un
período específico

### Consulta

~~~sql
select e.id as Id  , concat(e.primerNombre, ' ' ,e.segundoNombre )  as Nombre , count(e.id) as CantidadReparaciones
from Empleado as e
inner join Reparacion_empleado as re on e.id = re.idEmpleado
group by  e.id , Nombre
limit 2;
~~~

### Explicacion 


Esta consulta busca obtener información sobre los empleados y el número de reparaciones en las que han participado. Los datos se obtienen de las tablas Empleado y Reparacion_empleado.


### Resultado

<pre>+----+-------------+----------------------+
| Id | Nombre      | CantidadReparaciones |
+----+-------------+----------------------+
|  4 | Ana María   |                    2 |
|  6 | Laura Elena |                    2 |
+----+-------------+----------------------+
</pre>


13. Obtener las piezas más utilizadas en reparaciones durante un período
específico

### Consulta

~~~sql
select p.nombre , p.id , sum( rs.cantidadPiezas) as Cantidad 
from Reparacion as r
inner join Reparacion_servicio as rs on r.id = rs.idReparacion
inner join Pieza as p on p.id = rs.idPieza
inner join Orden_detalle as od on od.idPieza = p.id
where rs.fechaInicio between '2024-05-01' and '2024-05-31'
group by p.nombre , p.id ; 
~~~

### Explicacion 

Esta consulta busca obtener información sobre las piezas utilizadas en reparaciones que ocurrieron dentro de un período específico, junto con la cantidad total de cada pieza utilizada durante ese período. Los datos se obtienen de las tablas Reparacion, Reparacion_servicio, Pieza y Orden_detalle.

### Resultado

<pre>+------------------+----+----------+
| nombre           | id | Cantidad |
+------------------+----+----------+
| Filtro de aceite |  1 |        5 |
+------------------+----+----------+
</pre>


14. Calcular el promedio de costo de reparaciones por vehículo


### Consulta

~~~sql
select v.id , v.placa , format(AVG(r.costoTotal) , 2) AS PromedioVehiculo , 
concat (cl.apellido ,  ' ' , cl.nombre) as Dueño
from Vehiculo as v
inner join Reparacion as r on r.idVehiculo = v.id
inner join Cliente as cl on cl.id = v.idCliente
GROUP BY v.id ;
~~~

### Explicacion
En resumen, la consulta obtiene la identificación y placa de cada vehículo, el costo promedio de sus reparaciones y el nombre completo del dueño,
ademas tablas están relacionadas entre sí mediante las claves foráneas idVehiculo en la tabla Reparacion que se refiere a id en la tabla Vehiculo, y idCliente en la tabla Vehiculo que se refiere a id en la tabla Cliente.

### Resultado

<pre>
+----+--------+------------------+----------------+
| id | placa  | PromedioVehiculo | Dueño          |
+----+--------+------------------+----------------+
|  1 | ABC123 | 290.00           | Pérez Juan     |
|  2 | DEF456 | 500.00           | González María |
|  3 | GHI789 | 70.00            | Martínez Pedro |
+----+--------+------------------+----------------+
</pre>



### Consulta

15. Obtener el inventario de piezas por proveedor
    
~~~sql
select p.nombre , pr.nombre , sum(inv.cantidad)
from Pieza as p
inner join orden_detalle as od on p.id = od.idPieza
inner join Orden_compra as oc on oc.id = od.idOrdenCompra
inner join Proveedor as pr on pr.id = oc.idProveedor
inner join Inventario as inv on p.id = inv.piezaId 
group by p.nombre , pr.nombre ;

~~~
### Explicacion 

En resumen, la consulta obtiene el nombre de cada pieza, el nombre de su proveedor y la cantidad total de esa pieza en el inventario , para lograr esto segui la siguiente logica: 

La tablas Pieza está conectada con orden_detalle a través del identificador de la pieza. La tabla orden_detalle está conectada con Orden_compra a través del identificador de la orden de compra. La tabla Orden_compra está conectada con proveedor a través del identificador del proveedor, la tabla Pieza está conectada con inventario a través del identificador de la pieza

### Resultado
<pre>
+------------------------+-------------+-------------------+
| nombre                 | marca       | sum(inv.cantidad) |
+------------------------+-------------+-------------------+
| Filtro de aceite       | Bosch       |                10 |
| Pastillas de freno     | Bosch       |                 3 |
| Bujía de encendido     | Bosch       |                 2 |
| Amortiguador           | Denso       |                 5 |
| Correa de distribución | Denso       |                 1 |
| Filtro de aire         | Denso       |                10 |
| Termostato             | Continental |                 1 |
| Embrague               | Continental |                 5 |
| Radiador               | Continental |                10 |
+------------------------+-------------+-------------------+
</pre>



16. Listar los clientes que no han realizado reparaciones en el último año

### Consulta

~~~sql
select concat (cl.nombre ,  ' ' , cl.apellido)  as NombreCliente
from Cliente as cl
inner join Reparacion as r on  cl.id = r.id
inner join Reparacion_servicio as rs on rs.idReparacion = r.id 
where year(rs.fechaFin) <> 2023
group by NombreCliente;
~~~

### Explicacion 
La consulta obtiene una lista de clientes con nombre y apellido que han tenido reparaciones terminadas en años distintos a 2023. Para ello, une las tablas de clientes, reparaciones y servicios de reparación, y filtra los resultados por la fecha de finalización del servicio. Luego, agrupa los resultados por el nombre completo del cliente


### Resultado
<pre>
+----------------+
| NombreCliente  |
+----------------+
| Juan Pérez     |
| María González |
| Pedro Martínez |
+----------------+
</pre>






### Consulta
17. Obtener las ganancias totales del taller en un período específico

~~~sql
select t.nombre , sum(f.total) as TotalGanancias
from Taller as t 
left join Cliente as cl on cl.idTaller = t.id
left join Factura as f on f.idCliente = cl.id 
group by t.nombre;
~~~

### Explicacion 

La consulta obtiene una lista de talleres con sus nombres y la suma de las ganancias totales de las facturas asociadas. Une las tablas de talleres, clientes y facturas, luego agrupa los resultados por el nombre del taller.

### Resultado
<pre>
+--------------------+----------------+
| nombre             | TotalGanancias |
+--------------------+----------------+
| Taller Central     |         881.32 |
| Taller Bucaramanga |           NULL |
+--------------------+----------------+
</pre>


18. Listar los empleados y el total de horas trabajadas en reparaciones en un
período específico asumiendo que se registra la duración de cada reparación

### Consulta
~~~sql
select  concat (em.primerNombre , ' '  , em.segundoNombre) as Empleado , s.nombre as Servicio , 
SUM(re.horasTrabajadas) as HorasTrabajadas
from Reparacion_empleado  as re
inner join Empleado as em on em.id = re.idEmpleado 
inner join Reparacion as r on r.id = re.idReparacion
inner join Reparacion_servicio as rs on rs.idReparacion = r.id
inner join Servicio as s on s.id = rs.idServicio
where rs.fechaFin between '2024-05-01' and '2024-05-15'
group by Servicio , Empleado
order by Empleado;
~~~
### Explicacion 
En esta consulta, obtengo el nombre completo de los empleados, los servicios que realizaron y la suma de las horas trabajadas en esos servicios durante la primera quincena de mayo de 2024, uniendo varias tablas relacionadas, filtrando por la fecha de finalización del servicio, agrupando por servicio y empleado, y ordenando por el nombre del empleado

### Resultado
<pre>
+----------------+---------------------+-----------------+
| Empleado       | Servicio            | HorasTrabajadas |
+----------------+---------------------+-----------------+
| Ana María      | Cambio de aceite    |               1 |
| Ana María      | Reparación de motor |               1 |
| Ana María      | Pintura completa    |              10 |
| Carlos Manuel  | Pintura completa    |              12 |
| Elena Cristina | Cambio de aceite    |               1 |
| Elena Cristina | Reparación de motor |               1 |
+----------------+---------------------+-----------------+
</pre>



19. Obtener el listado de servicios prestados por cada empleado en un período
específico

### Consulta

~~~sql
select  concat (em.primerNombre , ' '  , em.segundoNombre) as Empleado , s.nombre as Servicio 
from Reparacion_empleado  as re
inner join Empleado as em on em.id = re.idEmpleado 
inner join Reparacion as r on r.id = re.idReparacion
inner join Reparacion_servicio as rs on rs.idReparacion = r.id
inner join Servicio as s on s.id = rs.idServicio
where rs.fechaFin between '2024-05-01' and '2024-05-10'
group by Servicio , Empleado
order by Empleado;
~~~

### Explicacion 
En esta consulta, estoy seleccionando el nombre completo del empleado y el nombre del servicio que realizaron durante un período específico  uno varias tablas como Reparacion_empleado, Empleado, Reparacion, Reparacion_servicio y Servicio, para relacionar empleados con reparaciones y servicios.  filtro los resultados por la fecha de finalización del servicio entre el 1 y el 10 de mayo de 2024. Luego estoy agrupando los resultados por el nombre del servicio y el nombre completo del empleado, y los estoy ordenando alfabéticamente por el nombre del empleado


### Resultado

<pre>
+----------------+---------------------+
| Empleado       | Servicio            |
+----------------+---------------------+
| Ana María      | Cambio de aceite    |
| Ana María      | Reparación de motor |
| Elena Cristina | Cambio de aceite    |
| Elena Cristina | Reparación de motor |
+----------------+---------------------+
</pre>


# Subconsultas


1. Obtener el cliente que ha gastado más en reparaciones durante el último año.

### Consulta
~~~sql
select CONCAT(cl.nombre , ' ' , cl.apellido) as Nombre , sum(f.total) as GastoTotal
from Cliente as cl 
inner join Factura as f on cl.id = f.idCliente 
where year(f.fecha) = '2024'
group by f.idCliente , Nombre 
order by GastoTotal
limit 1 ; 
~~~
### Explicacion 

En esta consulta, estoy obteniendo el nombre completo del cliente y el gasto total que ha realizado en facturas durante el año 2024. Estoy uniendo las tablas de clientes y facturas, filtrando los resultados por el año 2024, agrupando los resultados por el cliente y su nombre completo, y ordenando los resultados por el gasto total. Finalmente, limito el resultado a un solo registro.

### Resultado
<pre>
+----------------+------------+
| Nombre         | GastoTotal |
+----------------+------------+
| Pedro Martínez |      77.84 |
+----------------+------------+
</pre>



2. Obtener la pieza más utilizada en reparaciones durante el último mes


### Consulta

~~~sql
SELECT p.nombre AS Pieza, SUM(rs.cantidadPiezas) AS CantidadUsada
FROM Reparacion_servicio rs
INNER JOIN Pieza p ON rs.idPieza = p.id
WHERE rs.fechaFin BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
GROUP BY p.nombre
ORDER BY CantidadUsada DESC
LIMIT 1;
~~~

### Explicacion 

En esta consulta, busco obtener la pieza más utilizada en reparaciones durante el último mes, Para eso selecciono el nombre de la pieza y la suma de las cantidades utilizadas en las reparaciones. Uno la tabla de reparaciones con la tabla de piezas y filtro las reparaciones realizadas en el último mes, desde hace un mes hasta la fecha actual, agrupo los resultados por el nombre de la pieza, los ordeno por la cantidad de piezas utilizadas de mayor a menor, y muestro solo la pieza más utilizada.

### Resultado

<pre>
+--------------------+---------------+
| Pieza              | CantidadUsada |
+--------------------+---------------+
| Pintura automotriz |             1 |
+--------------------+---------------+
</pre>


3. Obtener los proveedores que suministran las piezas más caras

### Consulta
~~~sql
select p.nombre as Proveedor , od.precioUnidad as Precio
from Proveedor as p
inner join Orden_compra oc on p.id = oc.idProveedor 
inner join Orden_detalle od on od.idOrdenCompra = oc.id
order by Precio desc
limit 2;
~~~

### Explicacion 

En esta consulta, estoy obteniendo los nombres de los proveedores y el precio unitario de las piezas que han suministrado. Para ello, uno las tablas de proveedores, órdenes de compra y detalles de las órdenes. Luego, ordeno los resultados por el precio unitario de las piezas en orden descendente y limito el resultado a los dos precios más altos

### Resultado

<pre>
+-------------+--------+
| Proveedor   | Precio |
+-------------+--------+
| Continental | 550.00 |
| Denso       | 250.00 |
+-------------+--------+
</pre>



4. Listar las reparaciones que no utilizaron piezas específicas durante el último


### Consulta
~~~sql
select nombre as Nombre , descripcion as Descripcion
from Pieza 
where id not in (select p.id
				from Pieza  as p 
				inner join Reparacion_servicio rs on p.id = rs.idPieza);
~~~

### Explicacion 

En esta consulta, estoy obteniendo el nombre y la descripción de las piezas que no han sido utilizadas en ninguna reparación por eso , selecciono las piezas cuya identificacion no aparece en los registros de servicios de reparación. Uno la tabla de piezas con la tabla de servicios de reparación y filtro las piezas que no están asociadas a ningún servicio de reparación

### Resultado

<pre>
+------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------+
| Nombre                 | Descripcion                                                                                                                                              |
+------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------+
| Pastillas de freno     | Componente utilizado en el sistema de frenos para generar fricción y detener el vehículo.                                                               |
| Bujía de encendido     | Dispositivo que produce la chispa necesaria para encender la mezcla de aire y combustible en el motor de combustión interna.                             |
| Amortiguador           | Elemento del sistema de suspensión diseñado para absorber y disipar la energía cinética generada por el movimiento del vehículo.                         |
| Correa de distribución | Correa que sincroniza el movimiento de las diferentes partes del motor, como el cigüeñal y los árboles de levas.                                       |
| Filtro de aire         | Filtro diseñado para atrapar las partículas de suciedad presentes en el aire antes de que ingresen al sistema de combustión del motor.                   |
| Termostato             | Dispositivo que regula la temperatura del motor controlando el flujo de líquido refrigerante.                                                           |
| Embrague               | Mecanismo utilizado para conectar y desconectar el motor de la transmisión, permitiendo cambiar de marcha.                                                |
| Radiador               | Componente del sistema de refrigeración que disipa el calor del líquido refrigerante.                                                                   |
| Sensor de oxígeno      | Dispositivo que mide la cantidad de oxígeno presente en los gases de escape y ayuda a controlar la mezcla aire-combustible para optimizar la combustión. |
+------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------+
</pre>



5. Obtener las piezas que están en inventario por debajo del 10% del stock inicial


### Consulta

~~~sql
select p.nombre  as Nombre , it.cantidad as Existencias , it.stockInicial as StockInicial
from Inventario as inv 
inner join Pieza as p on p.id = inv.piezaId
inner join Inventario_taller as it on it.idInventario = inv.id
where inv.cantidad < ( (it.stockInicial) * 0.1) ;
~~~

### Explicacion 

En esta consulta, obtengo el nombre de las piezas, las existencias actuales y el stock inicial de cada una. Uno las tablas de inventario, piezas e inventario del taller. Luego, filtro los resultados para mostrar solo aquellas piezas cuyas existencias actuales están por debajo del 10% de su stock inicial

### Resultado
<pre>
+------------------------+-------------+--------------+
| Nombre                 | Existencias | StockInicial |
+------------------------+-------------+--------------+
| Correa de distribución |           1 |           50 |
| Termostato             |           1 |           50 |
| Bujía de encendido     |           2 |           40 |
+------------------------+-------------+--------------+
</pre>


# Procedimientos Almacenados

1. Crear un procedimiento almacenado para insertar una nueva reparación.

### Procedimiento

~~~sql
DROP PROCEDURE IF EXISTS insertarReparacion;
DELIMITER //

CREATE PROCEDURE insertarReparacion (IN idReparacion INT, IN idVehiculo INT, IN costoTotal DECIMAL)
BEGIN
    INSERT INTO reparacion (id, idVehiculo, costoTotal)
    VALUES (idReparacion, idVehiculo, costoTotal);
END //

call insertarReparacion (4 , 4 , 0.00);
~~~

### Explicación 
Primero elimino un procedimiento almacenado llamado "insertarReparacion" si ya existe. Luego, creo un nuevo procedimiento almacenado con el mismo nombre. Este procedimiento toma tres parámetros: idReparacion, idVehiculo y costoTotal. Cuando se invoca, inserta un nuevo registro en la tabla "reparacion" con los valores proporcionados para idReparacion, idVehiculo y costoTotal. Finalmente, llamo al procedimiento almacenado recién creado con valores específicos, lo que inserta un nuevo registro en la tabla "reparacion" con los valores proporcionados.

### Resultado

<pre>
+----+------------+------------+
| id | idVehiculo | costoTotal |
+----+------------+------------+
|  1 |          1 |     290.00 |
|  2 |          2 |     500.00 |
|  3 |          3 |      70.00 |
|  4 |          4 |       0.00 |
+----+------------+------------+
</pre>


2. Crear un procedimiento almacenado para actualizar el inventario de una pieza.


### Procedimiento
~~~sql
DROP PROCEDURE IF EXISTS actualizarExistenciasPieza;
DELIMITER //

CREATE PROCEDURE actualizarExistenciasPieza (IN idPieza INT, in cantidadNueva int )
BEGIN
    UPDATE Inventario
	SET cantidad = cantidadNueva
	WHERE piezaId = idPieza ;
END //

call actualizarExistenciasPieza (6 , 21 );
~~~

### Explicación 
Primero, elimino un procedimiento almacenado llamado "actualizarExistenciasPieza" si existe. Luego, defino un nuevo procedimiento almacenado con ese nombre. Este procedimiento toma dos parámetros de entrada: idPieza y cantidadNueva. Cuando se invoca, actualiza el valor de la columna "cantidad" en la tabla "Inventario" con el valor proporcionado en cantidadNueva, donde el "piezaId" coincide con idPieza. Finalmente, llamo al procedimiento almacenado recién creado con los valores específicos (6 para idPieza y 21 para cantidadNueva), lo que actualiza las existencias de la pieza en el inventario con la nueva cantidad.

### Resultado
<pre>
+----+---------+--------+----------+
| id | piezaId | idZona | cantidad |
+----+---------+--------+----------+
|  1 |       1 |      4 |       10 |
|  2 |       4 |      4 |        5 |
|  3 |       5 |      4 |        1 |
|  4 |       6 |      4 |       21 |
|  5 |       7 |      4 |        1 |
|  6 |       8 |      4 |        5 |
|  7 |       9 |      4 |       10 |
|  8 |       2 |      1 |        3 |
|  9 |       3 |      1 |        2 |
+----+---------+--------+----------+
</pre>


3. Crear un procedimiento almacenado para eliminar una cita

### Procedimiento

~~~sql
DELIMITER $$
DROP PROCEDURE IF EXISTS eliminarCita_vehiculo $$
CREATE PROCEDURE eliminarCita_vehiculo(IN ID INT)
BEGIN
    DELETE FROM Cita_vehiculo WHERE idCita = ID;
    
END $$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS eliminarCita ;
CREATE PROCEDURE eliminarCita(IN num INT)
BEGIN
    DELETE FROM Cita WHERE id = num;
    select id , hora , idCliente , idTaller from Cita;
END $$
DELIMITER ;

use Taller;
call eliminarCita_vehiculo (8);
call eliminarCita(8);
~~~

### Explicación 

Primero, elimino los procedimientos almacenados llamados eliminarCita_vehiculo y eliminarCita si ya existen. Luego, creo un nuevo procedimiento almacenado para cada uno. El procedimiento eliminarCita_vehiculo toma un parámetro de entrada llamado ID y, cuando se invoca, elimina todos los registros de la tabla Cita_vehiculo donde idCita coincide con el valor de ID, luego selecciona y muestra todos los registros restantes en la tabla Cita_vehiculo. El procedimiento eliminarCita toma un parámetro de entrada llamado num y, cuando se invoca, elimina el registro de la tabla Cita donde el id coincide con el valor de num, luego selecciona y muestra todos los registros restantes en la tabla Cita. Finalmente, utilizo el procedimiento eliminarCita_vehiculo con el valor 8 para eliminar las citas de vehículos asociadas al id 8, y luego utilizo el procedimiento eliminarCita con el valor 8 para eliminar la cita correspondiente de la tabla Cita.

### Resultado

<pre>+----+---------------------+-----------+----------+
| id | hora                | idCliente | idTaller |
+----+---------------------+-----------+----------+
|  1 | 2024-06-06 09:00:00 |         1 |        1 |
|  2 | 2024-06-06 10:30:00 |         2 |        1 |
|  3 | 2024-06-06 11:45:00 |         3 |        1 |
|  4 | 2024-06-07 08:30:00 |         4 |        1 |
|  6 | 2024-06-07 13:15:00 |         6 |        1 |
|  7 | 2024-06-08 09:30:00 |         7 |        1 |
+----+---------------------+-----------+----------+
</pre>


4. Crear un procedimiento almacenado para generar una factura

### Procedimiento

~~~sql
DROP PROCEDURE IF EXISTS generarFactura;
DELIMITER $$

CREATE PROCEDURE generarFactura (IN idFactura INT , fecha date , numReparacion int , numCliente int , procentajeImpuesto decimal(12,2) , 
total decimal(12,2) )
BEGIN
	insert into Factura (id , fecha , idReparacion , idCliente , impuesto , total)
       values (idFactura , fecha , numReparacion , numCliente , procentajeImpuesto , total);

	select id , fecha , idReparacion , idCliente , impuesto , total
	from Factura;
   
END $$

call generarFactura (4 , '2024-06-12' , 4 , 4 , 1 , 100);

delimiter ;
~~~

### Explicación 
Primero, compruebo si existe un procedimiento almacenado llamado generarFactura y lo elimino si es así. Luego, establezco el delimitador para definir el cuerpo del procedimiento. Dentro del procedimiento, defino los parámetros de entrada: idFactura, fecha, numReparacion, numCliente, porcentajeImpuesto y total. Cuando se invoca el procedimiento, inserta un nuevo registro en la tabla Factura con los valores proporcionados para id, fecha, idReparacion, idCliente, impuesto y total. Finalmente, restauro el delimitador para finalizar la definición del procedimiento.

### Resultado

<pre>
+----+------------+--------------+-----------+----------+--------+
| id | fecha      | idReparacion | idCliente | impuesto | total  |
+----+------------+--------------+-----------+----------+--------+
|  1 | 2024-05-07 |            1 |         1 |        3 | 293.48 |
|  2 | 2024-06-17 |            2 |         2 |       10 | 510.00 |
|  3 | 2024-06-03 |            3 |         3 |        8 |  77.84 |
|  4 | 2024-06-12 |            4 |         4 |        1 | 100.00 |
+----+------------+--------------+-----------+----------+--------+
</pre>

5. Crear un procedimiento almacenado para obtener el historial de reparaciones
de un vehículo


### Procedimiento

~~~sql
DROP PROCEDURE IF EXISTS obtenerHistorialReparacion;
DELIMITER //

CREATE PROCEDURE obtenerHistorialReparacion (IN Id INT)
BEGIN
	select r.id , r.idVehiculo , r.costoTotal, rs.idServicio , rs.descripcion , rs.costo
    from Reparacion as r
    inner join Reparacion_servicio as rs on rs.idReparacion = r.id
    where r.idVehiculo = Id;
   
END //

call obtenerHistorialReparacion (1);
~~~

### Explicación 

Primero, compruebo si existe un procedimiento almacenado llamado obtenerHistorialReparacion y lo elimino si es así. Luego, creo un nuevo procedimiento almacenado con ese nombre. Este procedimiento toma un parámetro de entrada llamado Id. Cuando se invoca, selecciona y muestra los detalles de las reparaciones y los servicios asociados a un vehículo específico cuyo id coincide con el valor proporcionado en Id. Los detalles incluyen el id de la reparación, el id del vehículo, el costo total de la reparación, el id del servicio, la descripción del servicio y el costo del servicio. Finalmente, llamo al procedimiento almacenado con el valor 1 para obtener el historial de reparaciones del vehículo con id 1

### Resultado

<pre>
+----+------------+------------+------------+-------------------------------------------------------------------+--------+
| id | idVehiculo | costoTotal | idServicio | descripcion                                                       | costo  |
+----+------------+------------+------------+-------------------------------------------------------------------+--------+
|  1 |          1 |     290.00 |          1 | Se realizó el cambio de aceite y filtro en el motor del vehículo. | 190.00 |
|  1 |          1 |     290.00 |          2 | Se realizó la reparación completa del motor del vehículo.         | 100.00 |
+----+------------+------------+------------+-------------------------------------------------------------------+--------+
</pre>


6. Crear un procedimiento almacenado para calcular el costo total de
reparaciones de un cliente en un período

### Procedimiento

~~~sql
DROP PROCEDURE IF EXISTS costoTotalCliente;
DELIMITER //

CREATE PROCEDURE costoTotalCliente (IN idCliente INT)
BEGIN
	select cl.id , cl.identificacion , concat(cl.nombre , ' ' , cl.apellido) as Nombre  , cl.idTaller as Taller
    , sum( f.total) as Total
    
    from Cliente as cl
    inner join Factura as f on f.idCliente = cl.id
    where cl.id = idCliente and f.fecha between '2024-05-02' and '2024-06-02'
    group by cl.id , cl.identificacion , Nombre ,  Taller;
    

   
END //

delimiter ;
~~~
### Explicación 

Primero, compruebo si existe un procedimiento almacenado llamado "costoTotalCliente" y lo elimino si es así. Luego, creo un nuevo procedimiento almacenado con ese nombre. Este procedimiento toma un parámetro de entrada llamado idCliente. Cuando se invoca, selecciona y muestra el id del cliente, su identificación, su nombre completo, el id del taller asociado y la suma total de las facturas del cliente. Los datos se obtienen uniendo las tablas Cliente y Factura, y se filtran por el id del cliente proporcionado y por las facturas emitidas entre el 2 de mayo de 2024 y el 2 de junio de 2024. Los resultados se agrupan por el id del cliente, su identificación, su nombre y el id del taller.

### Resultado

<pre>
	+----+----------------+------------+--------+--------+
| id | identificacion | Nombre     | Taller | Total  |
+----+----------------+------------+--------+--------+
|  1 | 123456789      | Juan Pérez |      1 | 293.48 |
+----+----------------+------------+--------+--------+
</pre>

7. Crear un procedimiento almacenado para obtener la lista de vehículos que
requieren mantenimiento basado en el kilometraje.

### Procedimiento
~~~sql
drop procedure if exists mantenimientoKilometraje ;
create procedure mantenimientoKilometraje (in inicio int , in fin int)
begin
	select id , placa , modelo , año , idCliente , idMarca , kilometraje 
    from Vehiculo 
    where kilometraje between inicio and fin ;

end $$

delimiter ;

call mantenimientoKilometraje (30000 , 50000);
~~~
### Explicación 

Primero, elimino un procedimiento almacenado llamado mantenimientoKilometraje si ya existe, luego creo un nuevo procedimiento almacenado con ese mismo nombre, este procedimiento toma dos parámetros de entrada: inicio y fin, que representan valores de kilometraje. Cuando se ejecuta, selecciona y muestra todos los registros de la tabla Vehiculo donde el kilometraje se encuentra entre los valores especificados de inicio y fin por ultimo, llamo al procedimiento almacenado con los valores 30000 y 50000 para obtener todos los vehículos cuyo kilometraje se encuentra en ese rango.

### Resultado
<pre>
+----+--------+--------+------+-----------+---------+-------------+
| id | placa  | modelo | año  | idCliente | idMarca | kilometraje |
+----+--------+--------+------+-----------+---------+-------------+
|  3 | GHI789 | Fiesta | 2019 |         3 |       3 |       30000 |
|  4 | JKL012 | Spark  | 2017 |         4 |       4 |       40000 |
|  5 | MNO345 | Gol    | 2016 |         5 |       5 |       50000 |
+----+--------+--------+------+-----------+---------+-------------+
</pre>

8. Crear un procedimiento almacenado para insertar una nueva orden de compra

### Procedimiento

~~~sql
DROP PROCEDURE IF EXISTS insertarOrdenCompra;
DELIMITER //

CREATE PROCEDURE insertarOrdenCompra (IN idOrden INT , in fecha date , in idProveedor int , in idEmpleado int , in total decimal(12,2))
BEGIN
	insert into Orden_compra (id , fecha ,idProveedor , idEmpleado , total )
    values(idOrden,fecha,idProveedor, idEmpleado , total);
    
    select id , fecha , idProveedor ,idEmpleado , total
    from Orden_compra 
    where id = idOrden;
   
END //

delimiter ;
call insertarOrdenCompra (4 ,  '2024-06-04' , 3 , 1 , 150.00  );
~~~
### Explicación 

Primero, elimino un procedimiento almacenado llamado insertarOrdenCompra si ya existe. Luego, creo un nuevo procedimiento almacenado con ese nombre. Este procedimiento toma cinco parámetros de entrada: idOrden, fecha, idProveedor, idEmpleado y total. Cuando se invoca, inserta un nuevo registro en la tabla Orden_compra con los valores proporcionados para id, fecha, idProveedor, idEmpleado y total. Después de la inserción, selecciona y muestra el registro recién insertado de la tabla Orden_compra donde el id coincide con idOrden. Finalmente, llamo al procedimiento almacenado con valores específicos, lo que inserta una nueva orden de compra y luego muestra los detalles de esa orden.

### Resultado

<pre>
+----+------------+-------------+------------+--------+
| id | fecha      | idProveedor | idEmpleado | total  |
+----+------------+-------------+------------+--------+
|  4 | 2024-06-04 |           3 |          1 | 150.00 |
+----+------------+-------------+------------+--------+	
</pre>


9. Crear un procedimiento almacenado para actualizar los datos de un cliente

### Procedimiento

~~~sql

DROP PROCEDURE IF EXISTS actualizarDatoClientes;
DELIMITER //

CREATE PROCEDURE actualizarDatoClientes (
    IN idCliente INT, 
    IN identificacion VARCHAR(50), 
    IN nombre VARCHAR(50), 
    IN apellido VARCHAR(50), 
    IN direccion VARCHAR(50), 
    IN email VARCHAR(50), 
    IN tipoDocumento INT, 
    IN idTaller INT
)
BEGIN
    DECLARE cliente_existe INT;

    -- Verificar si el cliente existe
    SELECT COUNT(*) INTO cliente_existe FROM Cliente WHERE id = idCliente;

    IF cliente_existe > 0 THEN
        
        UPDATE Cliente 
        SET identificacion = identificacion, 
            nombre = nombre, 
            apellido = apellido, 
            direccion = direccion, 
            email = email, 
            idTipoDocumento = tipoDocumento, 
            idTaller = idTaller
        WHERE id = idCliente;
	END IF;   
    
	select id , identificacion , nombre , apellido , direccion , email , idTipoDocumento , idTaller
    from Cliente where id = idCliente;
   
    
END //

DELIMITER ;
call actualizarDatoClientes (7 , 13412653 , 'Daniel' , 'Andres' , 'Calle 1c # 2A-35' , 'DanielAndres@gmail.com' , 1 , 1 );
~~~

### Explicación 
Primero, elimino un procedimiento almacenado llamado actualizarDatoClientes si ya existe. Luego, creo un nuevo procedimiento almacenado con ese nombre. Este procedimiento toma ocho parámetros de entrada: idCliente, identificacion, nombre, apellido, direccion, email, tipoDocumento e idTaller, primero declaro una variable llamada cliente_existe para verificar si el cliente con el id dado existe en la tabla Cliente. Si el cliente existe, actualizo los datos del cliente con los valores proporcionados, Finalmente, selecciono y muestro todos los datos del cliente actualizado. Luego, llamo al procedimiento almacenado con valores específicos para actualizar los datos de un cliente existente y mostrar su información actualizada

### Resultado


<pre>
+----+----------------+--------+----------+------------------+------------------------+-----------------+----------+
| id | identificacion | nombre | apellido | direccion        | email                  | idTipoDocumento | idTaller |
+----+----------------+--------+----------+------------------+------------------------+-----------------+----------+
|  7 | 13412653       | Daniel | Andres   | Calle 1c # 2A-35 | DanielAndres@gmail.com |               1 |        1 |
+----+----------------+--------+----------+------------------+------------------------+-----------------+----------+	
</pre>


10. Crear un procedimiento almacenado para obtener los servicios más solicitados
en un período

### Procedimiento
~~~sql
DROP PROCEDURE IF EXISTS obtenerServicio;
DELIMITER //

CREATE PROCEDURE obtenerServicio (
    IN inicio date , in fin date
)
BEGIN
   
    
	select s.nombre as Nombre , count(rs.idServicio) as Cantidad
    from reparacion_Servicio as rs
    inner join Servicio as s on s.id = rs.idServicio
    where rs.fechaFin between inicio and fin
    group by Nombre , rs.idServicio
    order by Cantidad
    limit 2;
   
    
END //

DELIMITER ;
call obtenerServicio ('2024-01-01' , '2024-05-31');

~~~
### Explicación 
Primero, elimino un procedimiento almacenado llamado obtenerServicio si ya existe. Luego, creo un nuevo procedimiento almacenado con ese nombre. Este procedimiento toma dos parámetros de entrada: inicio y fin. Cuando se invoca, selecciona y muestra el nombre del servicio y la cantidad de veces que se ha realizado durante el periodo especificado, uniendo las tablas reparacion_Servicio y Servicio. Los resultados se agrupan por el nombre del servicio y su id, se ordenan por la cantidad de servicios realizados y se limitan a los dos servicios más frecuentes. Finalmente, llamo al procedimiento almacenado con fechas específicas para obtener los servicios más comunes realizados entre el 1 de enero de 2024 y el 31 de mayo de 2024.
### Resultado

<pre>
+---------------------+----------+
| Nombre              | Cantidad |
+---------------------+----------+
| Cambio de aceite    |        1 |
| Reparación de motor |        1 |
+---------------------+----------+
</pre>




