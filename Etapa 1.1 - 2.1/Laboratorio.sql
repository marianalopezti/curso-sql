create database laboratorio;

use laboratorio;

create table facturas (
	letra char,
    numero int,
	clienteid int,
	articuloid int,
	fecha date,
	monto double,
	primary key(letra, numero)
);

create table articulos (
	articuloid int primary key,
	nombre varchar(50),
    precio double,stock int
);

create table clientes (
	clienteid int primary key,
    nombre varchar(25),
    apellido varchar(25),
    cuit char(16),
    direccion varchar(50),
    comentarios varchar(50)
);

show databases;

# show tables;

desc clientes;

alter table facturas
change clienteid idcliente int,
change articuloid idarticulo int,
modify monto double unsigned;

desc facturas;

alter table articulos
change articuloid idarticulo int,
modify precio double unsigned not null,
modify nombre varchar(75),
modify stock int unsigned not null;

alter table clientes
change clienteid idcliente int,
modify nombre varchar(30) not null,
modify apellido varchar(35) not null,
change comentarios observaciones varchar(255);

desc clientes;

insert into facturas values ('A', 28, 14, 255, '2021-03-18', 1589.50), 
('A', 39, 26, 157, '2021-04-12', 979.75),
('B', 8, 17, 95, '2021-04-25', 513.35),
('B', 12, 5, 411, '2021-05-03', 2385.70),
('B', 19, 50, 157, '2021-05-26', 979.75);

insert into articulos values (95, 'Webcam con Micrófono Plug & Play', 513.35, 39),
(157, 'Apple AirPods Pro', 979.75, 152),
(335, 'Lavasecarropas Automático Samsung', 1589.50, 12),
(411, 'Gloria Trevi/ Gloria / CD+DVD', 2385.70, 2);

insert into clientes values (5, 'Santiago', 'González', '23-24582359-9', 'Uriburu 558 - 7°A', 'VIP'),
(14, 'Gloria', 'Fernández', '23-35965852-5', 'Constitución 323', 'GBA'),
(17, 'Gonzalo', 'López', '23-33589416-0', 'Arias 2624', 'GBA'),
(26, 'Carlos', 'García', '23-423221230-9', 'Pasteur 322 - 2°C', 'VIP'),
(50, 'Micaela', 'Altieri', '23-22885566-5', 'Santamarina 1255', 'GBA');

select * from articulos;
select * from facturas;

alter table clientes_neptuno 
modify idcliente varchar(5), 
add primary key(idcliente);

alter table clientes_neptuno 
modify NombreCompania varchar(100) not null;

alter table clientes_neptuno 
modify Pais varchar(15) not null;

desc clientes_neptuno;

alter table clientes rename contactos;

select * from contactos;

##### TABLA CLIENTES #####

alter table clientes 
modify COD_CLIENTE varchar(7) primary key,
modify EMPRESA varchar(100) not null,
modify CIUDAD varchar(25) not null,
modify TELEFONO int unsigned,
modify RESPONSABLE varchar(30) not null;

select * from clientes;

######### PEDIDOS ########

alter table pedidos 
modify NUMERO_PEDIDO int unsigned primary key,
modify CODIGO_CLIENTE varchar(7) not null,
modify FECHA_PEDIDO DATE not null,
modify FORMA_PAGO ENUM('APLAZADO','CONTADO','TARJETA'),
modify ENVIADO ENUM('SI', 'NO');

select * from pedidos;

############## PRODUCTOS ###############

alter table productos 
modify COD_PRODUCTO int unsigned primary key,
modify SECCION varchar(20) not null,
modify NOMBRE varchar(40) not null,
modify IMPORTADO ENUM('VERDADERO','FALSO') not null,
modify ORIGEN varchar(25) not null,
modify DIA int unsigned not null,
modify MES int unsigned not null,
change ANO ANIO int unsigned not null;