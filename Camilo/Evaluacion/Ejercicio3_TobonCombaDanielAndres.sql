
CREATE DATABASE Ejercicio3_TobonCombaDanielAndres;

use Ejercicio3_TobonCombaDanielAndres;
create table User (
    UserId INT PRIMARY KEY ,
    FirtsName varchar(25) not null,
    LastName varchar(25) not null
);

create table Address (
    AddressID int primary key, 
    UserID Int, 
    Email varchar(50) not null , 
    Foreign Key (UserID) REFERENCES User (UserId)
);

create table Product (
    ProductID int primary key, 
    ProductName varchar(50) not null
);

create table downloads (
    DownloadID int PRIMARY key, 
    UserID int, 
    ProductId int,
    FileName varchar(50) not null,
    TimeDownload DATETIME not null, 
    Foreign Key (UserID) REFERENCES User (UserId),
    Foreign Key (ProductId) REFERENCES Product (ProductId)
);