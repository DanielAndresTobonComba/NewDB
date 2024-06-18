create table if not exists Usuario( 
id_usu int primary key, 
nombre_usu varchar(100) not null, 
direccion_usu varchar(200) null, 
telefono_usu varchar(15) not null unique, 
edad int not null check(edad > 0)
);

drop table Usuario;

describe Usuario;

create table Pasaje( 
id_pas integer auto_increment primary key ,
valor_pas integer unsigned not null,
id_usu int not null, 
foreign key (id_usu) references Usuario(id_usu), 
id_viaje int not null ,
foreign key (id_viaje) references Viaje(id_viaje)
); 

create table Destino( 
	cod_dest integer primary key , 
    nombre_des varchar(50) not null 
    );
    
create table Viaje( 
id_viaje integer primary key, 
fecha_viaje date not null, 
hora_viaje time not null , 
placa_veh varchar(6) not null , 
foreign key (placa_veh) references Vehiculo(placa_veh), 
cod_dest int not null,
foreign key (cod_dest) references Destino(cod_dest)
);


create table Encomienda( 
id_enc int primary key, 
descrip_enc tinyint null, 
valor_enc int not null , 
id_viaje int not null , 
foreign key (id_viaje) references Viaje(id_viaje) 
)






