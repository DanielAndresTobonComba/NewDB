create database empresa;
use empresa;

-- SESION 7 
-- APUNTES RESTRICCIONES 

-- CLAVES 
-- sE USAN PARA ORGANIZAR RELACIONAR Y ASEGURAR LA INTEGRIDAD DE LA BASE DE DATOS 

/* 
VENTAJAS 

INTEGRIDAD DE DE DATOS 
 Rendimiento 
 Relaciones entre tablas 
 Prevencion de datos duplicados 
 */


-- Claves Primarias (PRIMARY KEY)

	create table estudiantes (
		id int primary key,
		nombre varchar(50)

	);

	-- Otra forma de crear la clave primaria 
	create table estudiantes (
		id int,
		nombre varchar(50),
		primary key (id)
	);


-- CLAVES FORANEAS (EXTERNAS) FOREIGN KEY 

	/* Se utiliza para refereciar la llave primaria de la table padres
    de esta */
    
    create table cursos (
		id int primary key, 
        nombre varchar(50)
    
    );
    
    create table estudiantes (
		id int primary key,
		nombre varchar(50)

	);
    
    create table inscripciones (
		estudiante_id int,
		curso_id int, 
        foreign key (estudiante_id) references estudiantes(id), 
        foreign key (curso_id) references cursos(id)

	);

-- RESTRICCIONES 
	
-- RESTRICCIONES DE UNICIDAD (UNIQUE) : 
	/* Garantiza que los valores de una columna o 
    un conjunto de columnas sean unicos en la tabla */
    
    -- EJEMPLO 
    
    create table empleados (
		
        id int primary key ,
        codigo_empleado int unique, 
        nombre varchar(50)
        
    );
    

-- RESTRICCION DE VALOR DETERMINADO (DEFAULT) 
	/* Define un valor determinado para una columna si 
    no se proporciona un valor al insertar un nuevo resgitro 
    y evitar el manejo de nulos. */
    
    create table pedidos (
		id int primary key,
        fecha_pedido date default (current_date),
        total decimal(10 , 2) default 0.00
    );
    
    
    insert into pedidos (id , total) 
    values (1 , 100), (2,30), (3, 150) , (4 , null);
    
    select * from pedidos;
    drop table pedidos;
    
    insert into pedidos (id) values (5);
    
    
-- RESTRICCION DE VERIFICACION (CHECK)
	/* Permite definir una condicion que debe cumplirse para que un 
    valor se almacene en una columna */
    
    create table producto (
			
		id int primary key, 
        nombre varchar(50),
        cantidad int check (cantidad > 0)
        
    );
    
    insert into producto values (1 , "Bandeja paisa" , 1 );
    
-- 	RESTRICCION DE LOS NO NULLOS (NOT NULL) 
	/* Indica que una columna no puede contener valores nulos */ 
    
	-- Ejemplo 
    
    create table clientes (
		id int primary key,
        nombre varchar(50) not null
    );
    
    
-- RESTRICCION DE VALOR UNICO EN CLAVE PRIMARIA (AUTO_INCREMENT); 
	/* SE UTILIZA PARA GENERAR AUTOMATICAMENTE VALORES UNICOS PARA
    UNA COLUMNA DE CLAVE PRIMARIA. */ 
    
    -- EJEMPLO 
    
    drop table if exists empleados;
    
    CREATE TABLE empleados (
        id int primary key auto_increment, 
        nombre varchar(50)
    );
    
    insert into empleados (nombre) 
    values ("camilo") , ("Lorenzo") , ("Carlos");

	select * from empleados;
    

-- ENTIDAD RELACION Y MODELO RELACIONAL 

	-- COMPONENTES PRINCIPALES DEL MODELO E-R 
    
    /*
    
    1. Entidades: Objetos del mundo real de interes para el sistema 
    2. Atributos: Caracteristicas o propiedades de las entidades 
    3. Relaciones: Conexiones o asociaciones entre las entidades 
    4. Cardinalidad: Cantidad de instancias de una_entidad en la otra. 
		uno a muchos: (1,m) 
        muchos a muchos: (n,m)
		y de uno a uno.
        
--MODELO RELACIONAL 
    
    /* Es una representacion logica mas concreta 
    y fisica de la base de datos. 
    
    Los datos se organizan en tablas y relaciones 
    
    Las tablas filas(registros) y columnas (campos) 
    
    Las relaciones se hacen a travez de las llaves (primarias y 
    foraneas) 
	*/
    
    














    









