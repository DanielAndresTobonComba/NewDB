### Apuntes

/* 
Comandos dml / insert update delect select 
Clausulas: group by , order by. 
Comandos ddl / create table , alter table , drop table 
*/

/*
-- Reglas para poder declarar llaves foraneas 
    Las llaves deben ser del mismo tipo de dato y de la misma longitud
*/


/*
Como guardar los datos multivalores 
    Crear una tabla hija que tenga toda la informacion
*/

 
-- Modelo logico 
-- Modelo fisico
-- Modelo entidad-relacion


### Dia1

/*
PALABRAS 
    
    Atributos unicos: Son los que tiene un valor
    Atributos compuestos: Pueden tener valores diferentes al mismo tiempo
    DBMS : Database managment system 
    Motor de base de datos: Sistema para crear y administrar bases de datos 
    UID : Uniqueidentifier 

*/

/*
Datos e informacion

    Dato: Un evento o hecho o dato unico.

    Informacion: Todos los datos en conjunto que han sido analizados y 
    se puede sarcar informacio de ese analisis 

Tipos de base de datos 
    Relacional: Almacena infomracion en tablas con filas y columnas
    No relacional: 

### Modelos de bases de datos

Modelo conceptual / tablas y sus relaciones sin incluir las relaciones n:m

    Capturas las necesidades funcionales
    Se basa en las necesidades actuales y puede reflejar las futuras
    Aborda las necesidades de un negocio

    Que identifica? 
        Entidades importantes 
        Relaciones entre entidades 
    
    Pero no especifica
        Atributos
        Indentificadores unicos 

Modelo logico / mas avanzado que el conceptual

    Incluye las entidades y relaciones 
    Especifica atributos 
    Opcionalidad de atributos 
    Cardinalidad de la relacion

Modelo Fisico - Modelo entidad-relacion / tipo de datos , tamaño de los datos , primary key , foreign , 

    Estension de un modelo de datos logico
        Define la tabla , tipos de dato y la precision 
        Identifica las vistas indices y otros objetos 
        Muestra la estructura de la tabla como columnas, claves primarias y claves ajenas



Notacion para representar entidades

    -- Nombre de la entidad en mayuscula y en singular
    -- Se recomienda escribirlas en ingles 

Reglas de los atributos 
    -- Los usuarios deben poder entender los nombres de los atributos 
    -- Los atributos deben estar en minuscula (firtsName)
    -- Debe tener un simbolo que lo representa (* si es obligatorio o opcional y # si es una PK , FK)

Relaciones 

    -- Puede existir una relacion en si misma y solo en un maximo de dos entidades
    -- Una relacion tiene dos perspectivas 
    -- Ambas perspectivas de una relacion se debe etiquetar

Identificadores unicos candidatos ## FALTA 

Dependencias obligatorias y opcionales ## FALTA 

Como usar los constrains en uns database ## FALTA 


Normalizacion y reglas de negocio
1f Todos lso atributos deben tener un valor unico 
2f Un atributo debe depender de todo uid de su entidad
3f Los atributos que no son uid pueden ser dependientes de otro atributos no uid 


*/
