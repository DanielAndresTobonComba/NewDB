### mysql maquina virtual
ssh p4student@172.101.16.139
passwd: 1027210907

Install Command: sudo apt-get install mysql-server

Enter MYSQL; 

sudo mysql

Create password: alter user 'root'@'localhost' identified with mysql_native_password by '1027210907';

Enter with password: sudo mysql -u root -p

Permissions:

sudo mysql_secure_installation

no, no, no, no, yes

sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf

bind address: 0.0.0.0

mysqlx-bind-address: 0.0.0.0

systemctl restart mysql

Create Global User
create user 'root'@'%' identified by 1027210907;

grant all privileges on . to 'root'@'%' with grant option;

flush privileges;

MYSQL is a service on the internet

Service Classes
Class A: Empresarial, 0-127 WAN
Class B: Municipal, 128-191 MAN
Class C: Domestico, 192-223 LAN

Ports
Ports are the means in which you access a certain part of an IP

Different Ports

80 HTTP
443 HTTPS
21 FTP
22 SSH
3306 MYSQL

- iP: 172.16.101.134

- ssh p4student@172.16.101.134 

- password: mi cedula

estatus de mysql:systemctl status mysql.

sudo mysql : para entrar como usuario raiz.

id addr:  saber mi ip 

sudo mysql -u root -p: iniciar sesion en la terminal 

sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf : acceder a las configuraciones de mysql voy a bind-adreess y le coloco 0.0.0.0 para que acepte cualquier ip tabien en mysql-bind-adrres

hay que reiniciar se usa sytemctl restart mysql si no sirve su coloca restart o stop o start con systemctl "start" mysql 

CREATE USER 'root'@'%' IDENTIFIED BY '1000240915': crear un usuario y la contraseña 



