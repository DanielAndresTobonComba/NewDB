-- Active: 1710891255909@@127.0.0.1@3306@tienda
-- Transacciones Operaciones que se consiuderan o se tratan como si fueran una sola si falla se deshace todo deshace.alter 

use prueba_particiones;
-- Ejemplo de una transaccion

START TRANSACTION 
INSERT INTO employees values 
    (null , "Yulieht" , "Tayler" , 3 , 2); 

COMMIT;

drop table orden;
drop table factura;

CREATE TABLE orden (
    idOrden INT PRIMARY key,
    estado VARCHAR(50)
);

CREATE TABLE factura (
    idFac INT PRIMARY KEY,
    idOrden INT,
    cantidad INT,
    FOREIGN KEY (idOrden) REFERENCES orden (idOrden)
);



start TRANSACTION; 

insert into orden VALUES (100 , "Completada"); 
insert into factura values (2 , 100, 25);

commit;

rollback;

select * 
from factura ;

select * 
from orden;






