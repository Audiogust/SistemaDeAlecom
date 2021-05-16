create database AlecomBD
use AlecomBD

create table perfil(
tipo int primary key,
usuario varchar(50)
)

insert into perfil values(1,'Admnistrador')
insert into perfil values(2,'Almacenista')
insert into perfil values(3,'Vendedor')

create table usuarios (
id_usuario int IDENTITY(1,1) PRIMARY KEY,
nombre varchar(50),
contrasena varchar(50),
correo varchar(50),
tipo int,
foreign key(tipo) references perfil(tipo),
)

insert into usuarios values ('Edgar','123','edgar@gmail.com',1)
insert into usuarios values ('edggava159','123','edgar@gmail.com',1)