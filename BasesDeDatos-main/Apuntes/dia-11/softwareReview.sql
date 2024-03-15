-- Consultas y procedimientos 

/*
1. Construya el procedimiento almacenado que saque todos los empleados que se dieron de
alta entre una determinada fecha inicial y fecha final y que pertenecen a un determinado
departamento.
*/	

drop procedure pacientesDadosDeAlta;

delimiter $$
create procedure pacientesDadosDeAlta (in fechaInicial date , in fechaSalida date , in departamento varchar(50) )

	begin 
		
		select e.Emp_No , e.Apellido , e.Oficio , e.Dir , e.Fecha_Alt , e.Salario , e.Comision , e.Dept_No
		from Emp as e
        where  e.Fecha_Alt > fechaInicial and e.Fecha_Alt < fechaSalida and departamento = e.Dept_No ;
    end$$

delimiter ;

call pacientesDadosDeAlta ('1980-12-17' , '1982-12-17' , 30);



/*
2. Construya el procedimiento que inserte un empleado.
*/
DELIMITER $$
CREATE PROCEDURE insertarEmpleado (
    IN Emp_No INT,
    IN Apellido VARCHAR(50),
    IN Oficio VARCHAR(50),
    IN Dir INT,
    IN Fecha_Alt DATE,
    IN Salario INT,
    IN Comision INT,
    IN Dept_No INT
)
BEGIN
    INSERT INTO Emp (Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
    VALUES (Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No);
END$$
DELIMITER ;


CALL insertarEmpleado(8000, 'SANCHEZ', 'EMPLEADO', 1000, '1980-12-17', 208000, 0, 10);


/*3
Construya el procedimiento que recupere el nombre, número y número de personas a
partir del número de departamento.
*/

delimiter $$ 

create procedure numPersonaPorDepartamento ( in nombreDep varchar(50) ) 

	begin 
		select d.Dept_No , d.DNombre , count(d.Dept_No) as cantidad
        from Dept as d 
        inner join Emp as e on  e.Dept_No = d.Dept_No and d.DNombre = nombreDep
        group by d.Dept_No , d.DNombre   ;
    end$$ 


delimiter ; 

call numPersonaPorDepartamento ("CONTABILIDAD"); 


/*
4. Diseñe y construya un procedimiento igual que el anterior, pero que recupere también las
personas que trabajan en dicho departamento, pasándole como parámetro el nombres
*/

drop procedure datosPersonaPorDepartamento;
delimiter $$ 

create procedure datosPersonaPorDepartamento ( in nombreDep varchar(50) ) 

	begin 
    
		select d.Dept_No , d.DNombre , count(d.Dept_No) as cantidad
        from Dept as d 
        inner join Emp as e on  e.Dept_No = d.Dept_No and d.DNombre = nombreDep
        group by d.Dept_No , d.DNombre   ;
    
    
		select d.Dept_No , d.DNombre , e.Apellido as Apellidos , e.Salario
        from Dept as d 
        inner join Emp as e on  e.Dept_No = d.Dept_No and d.DNombre = nombreDep;
    
    end$$ 


delimiter ; 
       
        
call datosPersonaPorDepartamento ("INVESTIGACION");	


/*
5. Construya un procedimiento para devolver salario, oficio y comisión, pasándole el apellido.
*/




drop procedure datosPersonaPorApellido; 

delimiter $$ 

create procedure datosPersonaPorApellido ( in apellido varchar(50) ) 

	begin 
		select  e.Oficio as Oficio , e.Salario as Salario , e.Comision as Comision
        from Emp as e 
        where e.Apellido = apellido;
    
    end$$ 


delimiter ; 

call datosPersonaPorApellido ('Sanchez');



/*
6. Tal como el ejercicio anterior, pero si no le pasamos ningún valor, mostrará los datos de
todos los empleados.
*/




drop procedure datosPersonaPorApellidoFiltrado;

delimiter $$ 

create procedure datosPersonaPorApellidoFiltrado ( in apellido varchar(50) ) 

	begin  
		case 
				when apellido = " "  
                
                then  
							select *
							from Emp;
				else 
							
							select  e.Oficio as Oficio , e.Salario as Salario , e.Comision as Comision
							from Emp as e 
							where e.Apellido = apellido; 
		end case ; 
		
			
    end$$ 

delimiter ; 

call datosPersonaPorApellidoFiltrado (' ');



/* 
7. Construya un procedimiento para mostrar el salario, oficio, apellido y nombre del
departamento de todos los empleados que contengan en su apellido el valor que le
pasemos como parámetro.
*/



drop procedure buscarEmpleadoPorLetra;
delimiter $$ 

create procedure buscarEmpleadoPorLetra ( in nombre varchar(50) ) 

	begin 
    
		select e.Salario,  e.Oficio , e.Apellido as Apellidos , d.Dept_No
        from Emp as e
		inner join Dept as d on  e.Dept_No = d.Dept_No 
        where locate(nombre , Apellido ) > 0;
    
    end$$ 


delimiter ; 
       
        
call buscarEmpleadoPorLetra ("Al");		

select e.Salario,  e.Oficio , e.Apellido as Apellidos , d.Dept_No
        from Emp as e
		inner join Dept as d on  e.Dept_No = d.Dept_No and d.DNombre = 
        where locate(nombre , Apellido ) > 0;


