
-- 1. Obtener la lista de todos los menús con sus precios
### Consulta
~~~sql
-- Consulta que no repite los datos
Select nombre , precio
from Menu as m
inner join DetallePedido as dp on m.id = dp.id_pedido
group by nombre , precio;
~~~

~~~sql
-- Consulta que muestra tal cual lo solicitado
Select nombre , precio
from Menu as m
inner join DetallePedido as dp on m.id = dp.id_pedido
group by nombre , precio

union all

Select nombre , precio
from Menu as m
inner join DetallePedido as dp on m.id = dp.id_pedido
group by nombre , precio;
~~~

-- 2. Encontrar todos los pedidos realizados por el cliente 'Juan Perez'
### Consulta
~~~sql
select p.id , p.fecha , p.total
from Pedido as p 
inner join Cliente as c on p.id_cliente = c.id 
where c.nombre = 'Juan Perez';
~~~


-- 3.Listar los detalles de todos los pedidos, incluyendo el nombre del menú, cantidad y precio unitario

### Consulta
~~~sql
Select id_pedido , m.nombre, cantidad , precio_unitario
from DetallePedido 
right join Menu as m on m.id = id_menu;
~~~

-- 4. Calcular el total gastado por cada cliente en todos sus pedidos
### Consulta
~~~sql
select cl.nombre , sum(total)
from Cliente as cl 
inner join Pedido as p on p.id_cliente = cl.id
group by cl.nombre;
~~~

-- 5.Encontrar los menús con un precio mayor a $10
### Consulta
~~~sql
-- Sin datos repetidos
select nombre , precio
from Menu
where precio > 10;
~~~

~~~sql
-- Con la misma cantidad de datos que solicita la consulta

select nombre , precio
from Menu
where precio > 10

union all

select nombre , precio
from Menu
where precio > 10;
~~~

-- 6.Obtener el menú más caro pedido al menos una vez.
### Consulta
~~~sql
select nombre , precio
from Menu
order by precio desc
limit 1;
~~~

-- 7. Listar los clientes que han realizado más de un pedido.
### Consulta
~~~sql
select tabla.nombre , tabla.Correo
from 
(
Select cl.nombre as nombre, count(p.id_cliente ) as NumPedidos , cl.correo_electronico as Correo
from Cliente as cl
inner join Pedido as p on cl.id = p.id_cliente 
group by p.id_cliente ) as tabla
where tabla.NumPedidos > 1 ;
~~~


-- 8. Obtener el cliente con el mayor gasto total
### Consulta
~~~sql
select tabla.nombre 
from (
	Select cl.nombre , sum(p.total) as total
	From Cliente as cl 
	inner join Pedido as p on p.id_cliente = cl.id
	group by cl.nombre
	order by total desc
	limit 1
	) as tabla;
~~~

-- 9 Mostrar el pedido más reciente de cada cliente
### Consulta
~~~sql
SELECT 
    cl.nombre,
    p.fecha,
    p.total
FROM 
    Pedido AS p
INNER JOIN 
    Cliente AS cl 
    ON cl.id = p.id_cliente
WHERE 
    p.fecha = (
        SELECT MAX(p2.fecha)
        FROM Pedido AS p2
        WHERE p2.id_cliente = cl.id
    );
~~~

-- 10. Obtener el detalle de pedidos (menús y cantidades) para el cliente 'Juan Perez'.
### Consulta
~~~sql
Select dp.id_pedido , m.nombre , dp.cantidad , dp.precio_unitario
from Cliente as cl 
inner join Pedido as p on p.id_cliente = cl.id
inner join DetallePedido as dp on dp.id_pedido = p.id
inner join Menu as m on m.id = dp.id_menu
where cl.nombre = 'Juan Perez';
~~~

# Procedimientos 

### Procedimiento
-- 1.Crear un procedimiento almacenado para agregar un nuevo cliente


/*
Enunciado: Crea un procedimiento almacenado llamado AgregarCliente que reciba como
parámetros el nombre, correo electrónico, teléfono y fecha de registro de un nuevo cliente y lo
inserte en la tabla Clientes .
*/

~~~sql
DROP PROCEDURE IF EXISTS AgregarCliente ;
DELIMITER $$

CREATE PROCEDURE AgregarCliente (IN nombre varchar(100), in correo varchar(100) , in telefono varchar(15) ,in fechaRegistro date )
BEGIN

    
    insert into Cliente(nombre,correo_electronico,telefono,fecha_registro)
    values(nombre,correo,telefono,fechaRegistro);
    
    select nombre,correo_electronico,telefono,fecha_registro
    from Cliente 
    where correo_electronico = correo;
    
    
    
    
END $$

DELIMITER ;


call AgregarCliente ('Daniel tobon' , 'tobon@gmail.com','123-345-764','2003-05-04' );
~~~

### Procedimiento
-- 2. Crear un procedimiento almacenado para obtener los detalles de un pedido.

/*
Enunciado: Crea un procedimiento almacenado llamado ObtenerDetallesPedido que reciba
como parámetro el ID del pedido y devuelva los detalles del pedido, incluyendo el nombre del
menú, cantidad y precio unitario.
*/

~~~sql
DROP PROCEDURE IF EXISTS ObtenerDetallesPedido ;
DELIMITER $$

CREATE PROCEDURE ObtenerDetallesPedido (IN idPedido int)
BEGIN
	select p.id , m.id , m.nombre , dp.cantidad, dp.precio_unitario ,m.descripcion, m.precio
	from Pedido as p 
	inner join DetallePedido as dp on dp.id_pedido = p.id
	inner join Menu as m on m.id = dp.id_menu
	where dp.id_pedido = idPedido;
    
END $$

DELIMITER ;


call ObtenerDetallesPedido (1);

~~~
-- 3.Crear un procedimiento almacenado para actualizar el precio de un menú

/*
Enunciado: Crea un procedimiento almacenado llamado ActualizarPrecioMenu que reciba
como parámetros el ID del menú y el nuevo precio, y actualice el precio del menú en la tabla
Menus .
*/
### Procedimiento

~~~sql
DROP PROCEDURE IF EXISTS ActualizarPrecioMenu ;
DELIMITER $$

CREATE PROCEDURE ActualizarPrecioMenu (IN idMenu int , in nuevoPrecio decimal(10,2))
BEGIN
	update Menu
	set precio = nuevoPrecio
	where id = idMenu;
	
	select m.id ,m.nombre , m.precio 
	from Menu as m
	where m.id = idMenu;
    
END $$

DELIMITER ;


call ActualizarPrecioMenu (1 , 13.13);
~~~

### Procedimiento
-- 4 Crear un procedimiento almacenado para eliminar un cliente y sus pedidos

/*
Enunciado: Crea un procedimiento almacenado llamado EliminarCliente que reciba como
parámetro el ID del cliente y elimine el cliente junto con todos sus pedidos y los detalles de los
pedidos.
*/
~~~sql
drop procedure if exists EliminarCliente;

DELIMITER $$

CREATE PROCEDURE EliminarCliente(IN cliente_id INT)
BEGIN

	Declare mensaje varchar(50);

    if (cliente_id in(select id from Cliente))
   	 then
	    DELETE DP
	    FROM DetallePedido DP
	    INNER JOIN Pedido P ON DP.id_pedido = P.id
	    WHERE P.id_cliente = cliente_id;

	    
	    DELETE FROM Pedido
	    WHERE id_cliente = cliente_id;

	    
	    DELETE FROM Cliente
	    WHERE id = cliente_id;
	    
	    set mensaje = 'El cliente y sus pedidos han sido eliminados';
    else 
    
    	set mensaje = 'El cliente no existe';
    	
    end if;
    
    Select mensaje;
    
END $$

DELIMITER ;

call EliminarCliente (12);
~~~

### Procedimiento
-- 5. Crear un procedimiento almacenado para obtener el total gastado por un cliente

/*
Enunciado: Crea un procedimiento almacenado llamado TotalGastadoPorCliente que reciba
como parámetro el ID del cliente y devuelva el total gastado por ese cliente en todos sus pedidos.
*/
~~~sql
DROP PROCEDURE IF EXISTS TotalGastadoPorCliente ;
DELIMITER $$

CREATE PROCEDURE TotalGastadoPorCliente (in idCliente int)
BEGIN	
	
	select cl.nombre , sum(total) as Total
	from Cliente as cl 
	inner join Pedido as p on p.id_cliente = cl.id
	where cl.id = idCliente
	group by cl.nombre;
 
END $$

DELIMITER ;


call TotalGastadoPorCliente (1);

~~~


