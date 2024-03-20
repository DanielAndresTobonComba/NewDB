-- Active: 1710891255909@@127.0.0.1@3306@tienda
-- Active: 1710891255909@@127.0.0.1@3306
CREATE DATABASE prueba_particiones;
    DEFAULT CHARACTER SET = 'utf8mb4';

use prueba_particiones;

CREATE TABLE employees (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    fname VARCHAR(25) NOT NULL, 
    lname VARCHAR(25) NOT NULL, 
    store_id INT NOT NULL,
    department_id INT NOT NULL
) 
PARTITION BY RANGE (id) (
    PARTITION p0 VALUES LESS THAN (5),
    PARTITION p1 VALUES LESS THAN (10), 
    PARTITION p2 VALUES LESS THAN (15), 
    PARTITION p3 VALUES LESS THAN MAXVALUE
);

INSERT INTO employees VALUES
    (NULL, 'Bob', 'Taylor', 3, 2), (NULL, 'Frank', 'Williams', 1, 2),
    (NULL, 'Ellen', 'Johnson', 3, 4), (NULL, 'Jim', 'Smith', 2, 4),
    (NULL, 'Mary', 'Jones', 1, 1), (NULL, 'Linda', 'Black', 2, 3),
    (NULL, 'Ed', 'Jones', 2, 1), (NULL, 'June', 'Wilson', 3, 1),
    (NULL, 'Andy', 'Smith', 1, 3), (NULL, 'Lou', 'Waters', 2, 4),
    (NULL, 'Jill', 'Stone', 1, 4), (NULL, 'Roger', 'White', 3, 2),
    (NULL, 'Howard', 'Andrews', 1, 2), (NULL, 'Fred', 'Goldberg', 3, 3),
    (NULL, 'Barbara', 'Brown', 2, 3), (NULL, 'Alice', 'Rogers', 2, 2),
    (NULL, 'Mark', 'Morgan', 3, 3), (NULL, 'Karen', 'Cole', 3, 2);

select * from employees;

-- Seleccionar con particiones en donde el nombre empieze por s y sea parte de la particion p0 y p2

SELECT * 
from employees 
PARTITION (p0 , p2) 
where lname like 's%';


-- 

select id , concat(fname , ' ' , lname) as name
from employees 
PARTITION (p2) 
order by lname;






