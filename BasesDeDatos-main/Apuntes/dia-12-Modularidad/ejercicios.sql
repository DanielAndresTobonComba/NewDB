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
error_descripcion varchar (100) , fecha date default (current_stamp)

);
select * 
from error_log;

drop table error_log;

drop procedure AñadirProducto;
DELIMITER //

CREATE PROCEDURE AñadirProducto(IN nombre VARCHAR(255), IN precio DECIMAL(10, 2), IN stock INT)
BEGIN
    DECLARE contador INT;
    DECLARE mensaje_error varchar(100);
    

    SELECT COUNT(*) INTO contador 
    FROM Productos AS p
    WHERE p.nombre = nombre;

    IF contador > 0 THEN
        set mensaje_error =  concat( "El nombre producto " , nombre ,  " ya existe en la base de datos")  ;
        insert into error_log(error_descripcion) 
        values (mensaje_error);
        select mensaje_error;
    ELSE
        INSERT INTO Productos(nombre, precio, stock) VALUES (nombre, precio, stock);
    END IF;
END //

DELIMITER ;


drop table Productos;

call AñadirProducto("Celular" , 150 , 12.4);

DELIMITER //

CREATE PROCEDURE RegistrarCliente(IN nombre VARCHAR(255), IN email VARCHAR(255))
BEGIN

    INSERT INTO Clientes(nombre, email) VALUES (nombre, email);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE RealizarVenta(IN productoID INT, IN clienteID INT, IN cantidad INT)
BEGIN
    -- Aquí podrías añadir lógica para actualizar el stock, verificar disponibilidad, etc.
    INSERT INTO Ventas(producto_id, cliente_id, cantidad, fecha_venta) VALUES (productoID, clienteID, cantidad, CURDATE());
END //

DELIMITER ;
