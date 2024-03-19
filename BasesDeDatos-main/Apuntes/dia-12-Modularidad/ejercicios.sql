-- parte 2 sofware review 

-- EJERCICIOS 

CREATE DATABASE EXCEPCIONES ;
USE EXCEPCIONES;

CREATE TABLE Productos (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(255),
    precio DECIMAL(10, 2),
    stock INT,
    PRIMARY KEY (id)
);


CREATE TABLE Clientes (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(255),
    email VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE Ventas (
    id INT AUTO_INCREMENT,
    producto_id INT,
    cliente_id INT,
    cantidad INT,
    fecha_venta DATE,
    PRIMARY KEY (id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

drop table error_log;
create table error_log (id int auto_increment primary key , 
error_descripcion varchar (100) , fecha datetime default (current_timestamp)

);


drop table Clientes;
drop table error_log;
drop table Productos;
DROP TABLE Ventas;

drop procedure AñadirProducto;
drop procedure RegistrarCliente;
drop procedure RealizarVenta;


select * 
from Productos;

select * 
from Clientes;

select * 
from error_log;

DELIMITER //
CREATE PROCEDURE AñadirProducto(IN nombre VARCHAR(255), IN precio DECIMAL(10, 2), IN stock INT)
BEGIN
    DECLARE contador INT;
    DECLARE mensaje_error varchar(100);
    

    SELECT COUNT(*) INTO contador 
    FROM Productos AS p
    WHERE p.nombre = nombre;

    IF contador > 0 or trim(nombre ) = "" THEN 
        set mensaje_error =  concat( "ERROR.El nombre producto " , nombre ,  " ya existe en la base de datos o es erroneo")  ;
        insert into error_log(error_descripcion) 
        values (mensaje_error);
        select mensaje_error;
	ELSEIF precio <= 0 THEN 
		set mensaje_error =  concat( "ERROR.El precio del producto es invalido" )  ;
        insert into error_log(error_descripcion) 
        values (mensaje_error);
        select mensaje_error;
      
	ELSEIF stock < 0 THEN 
		set mensaje_error =  concat( "ERROR.El numero de stock no es valido" )  ;
        insert into error_log(error_descripcion) 
        values (mensaje_error);
        select mensaje_error;
    
    ELSE
        INSERT INTO Productos(nombre, precio, stock) VALUES (nombre, precio, stock);
    END IF;
END //
DELIMITER ;
call AñadirProducto("Motorola One Fusion" , 250 , 15);

DELIMITER //
CREATE PROCEDURE RegistrarCliente(IN nombre VARCHAR(255), IN email VARCHAR(255))
BEGIN

	DECLARE contador INT;
    declare contadoremail int ; 
    DECLARE mensaje_error varchar(100);
    

    SELECT COUNT(*) INTO contador 
    FROM Clientes AS p
    WHERE p.nombre = nombre;
    
    SELECT COUNT(*) INTO contadoremail 
    FROM Clientes AS c
    WHERE c.email = email;

    IF contador > 0 or trim(nombre) = "" THEN 
        set mensaje_error =  concat( "ERROR.El nombre del cliente ya existe o es erroneo")  ;
        insert into error_log(error_descripcion) 
        values (mensaje_error);
        select mensaje_error;
	ELSEIF contadoremail > 0 or trim(email) = "" THEN 
		set mensaje_error =  concat( "ERROR.El email del cliente es invalido o y existe" )  ;
        insert into error_log(error_descripcion) 
        values (mensaje_error);
        select mensaje_error;
    ELSE
		INSERT INTO Clientes(nombre, email) VALUES (nombre, email);
    END IF;

    
END //
DELIMITER ;
call RegistrarCliente("3c ingenieros" , "3cingenieros@xd.com");


drop procedure RealizarVenta;
-- REVIZAR PORQUE NO FUNCIONA ESTE PROCEDIMIENTO
DELIMITER //
CREATE PROCEDURE RealizarVenta(IN productoID INT, IN clienteID INT, IN cantidad INT)
BEGIN
	DECLARE banderaProducto boolean;
    DECLARE banderaCliente boolean;
    DECLARE mensaje_error varchar(100);
    declare cantStock int ;
    
    set banderaProducto = false ; 
    set banderaCliente = false ; 

    set banderaProducto = exists(select id from Productos where productoId = id );
    SET banderaCliente =  exists(select id from Clientes where clienteID = id );
	
    if not banderaProducto then
        set mensaje_error =  concat( "ERROR.El id del producto no existe o es erroneo" )  ;
        insert into error_log(error_descripcion) 
        values (mensaje_error);
        select mensaje_error;
	ELSEIF not banderaCliente THEN 
		set mensaje_error =  concat( "ERROR.El id del cliente es invalido o no existe" )  ;
        insert into error_log(error_descripcion) 
        values (mensaje_error);
        select mensaje_error;
	ELSEIF cantidad <= 0 THEN 
		set mensaje_error =  concat( "ERROR.La cantidad de ventases invalida" )  ;
        insert into error_log(error_descripcion) 
        values (mensaje_error);
        select mensaje_error;
	
    end if;
    
    if banderaProducto and banderaCliente then 
		if (select stock into cantStock from Productos where productoId = id ) >= cantidad 
			then 
				INSERT INTO Ventas(producto_id, cliente_id, cantidad, fecha_venta) 
				VALUES (productoID, clienteID, cantidad, CURDATE()); 
		else 
			set mensaje_error =  concat( "ERROR.La cantidad solicitada supera la cantidad en stock" , cantStock )  ;
			insert into error_log(error_descripcion) 
			values (mensaje_error);
			select mensaje_error;
		end if;

    END IF;
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE RealizarVenta(IN productoID INT, IN clienteID INT, IN cantidad INT)
BEGIN
    DECLARE banderaProducto BOOLEAN;
    DECLARE banderaCliente BOOLEAN;
    DECLARE mensaje_error VARCHAR(100);
    DECLARE cantStock INT;

    SET banderaProducto = FALSE;
    SET banderaCliente = FALSE;

    SELECT COUNT(*) INTO banderaProducto FROM Productos WHERE productoId = productoID;
    SELECT COUNT(*) INTO banderaCliente FROM Clientes WHERE clienteID = clienteID;

    IF NOT banderaProducto THEN
        SET mensaje_error = CONCAT("ERROR. El ID del producto no existe o es incorrecto");
        INSERT INTO error_log(error_descripcion) VALUES (mensaje_error);
        SELECT mensaje_error;
    ELSEIF NOT banderaCliente THEN
        SET mensaje_error = CONCAT("ERROR. El ID del cliente es inválido o no existe");
        INSERT INTO error_log(error_descripcion) VALUES (mensaje_error);
        SELECT mensaje_error;
    ELSEIF cantidad <= 0 THEN
        SET mensaje_error = CONCAT("ERROR. La cantidad de venta es inválida");
        INSERT INTO error_log(error_descripcion) VALUES (mensaje_error);
        SELECT mensaje_error;
    END IF;

    IF banderaProducto AND banderaCliente THEN
        SELECT stock INTO cantStock FROM Productos WHERE productoId = productoID;
        IF cantStock >= cantidad THEN
            INSERT INTO Ventas(producto_id, cliente_id, cantidad, fecha_venta) 
            VALUES (productoID, clienteID, cantidad, CURDATE()); 
        ELSE
            SET mensaje_error = CONCAT("ERROR. La cantidad solicitada supera la cantidad en stock: ", cantStock);
            INSERT INTO error_log(error_descripcion) VALUES (mensaje_error);
            SELECT mensaje_error;
        END IF;
    END IF;
END //
DELIMITER ;


call RealizarVenta (1 , 1 , 16);
