/* CREACION DE TABLAS*/

create table OFERTA_ACEPTADA (
   oferta_id            int                  not null,
   subasta_id           int                  null,
   puja_id              int                  null,
   constraint PK_OFERTA_ACEPTADA primary key (oferta_id)
)
go


create table PUJA(
   puja_id              int                  not null,
   cliente_id           int                  null,
   subasta_id           int                  null,
   puja_ofertada        float(4)            null,
   numero_puja          int                  null,
   fecha_oferta         date           null,
   constraint pk_puja primary key (puja_id)
)
go
create table CLIENTE (
   cliente_id           int                  not null,
   cliente_cedula       varchar(10)          null,
   cliente_nombres      varchar(50)          null,
   cliente_apellido     varchar(50)          null,
   cliente_telefono     varchar(10)          null,
   cliente_direccion    varchar(30)          null,
   cliente_email        varchar(30)          null,
   constraint pk_cliente primary key (cliente_id)
)
go
create table PAGO (
   pa_id                int                  not null,
   oferta_id            int                  null,
   pa_tipo              varchar(20)          null,
   constraint pk_pago primary key (pa_id)
)
go
create table SUBASTA (
   subasta_id           int                  not null,
   auto_id              int                  null,
   precio_inicial       float(4)            null,
   fecha_inicial        date            null,
   fecha_final          date          null,
   constraint pk_subasta_id primary key (subasta_id)
)
go
create table AUTO_DONADO (
   auto_id              int                  not null,
   donador_id           int                  null,
   marca                varchar(50)          null,
   modelo               varchar(50)          null,
   placa                varchar(30)          null,
   color                varchar(30)          null,
   cilindraje           float(4)             null,
   ano                  int                  null,
   fecha_donado         date                 null,
   constraint pk_auto_donado primary key (auto_id)
)
go
create table DONADOR (
   donador_id           int                  not null,
   cedula               varchar(10)          null,
   nombre               varchar(50)          null,
   apellido             varchar(50)          null,
   telefono             varchar(10)          null,
   direccion            varchar(50)          null,
   correo               varchar(50)          null,
   constraint pk_donador primary key (donador_id)
)
go

/* INSERCION DE LLAVES FORANEAS*/
alter table PAGO 
add constraint FK_PAGO_OFERTA foreign key (oferta_id)
references OFERTA_ACEPTADA (oferta_id)


alter table AUTO_DONADO
add constraint FK_AUTO_DONADOR foreign key (donador_id)
references DONADOR (donador_id)

alter table SUBASTA
add constraint FK_SUBASTA_AUTO foreign key (auto_id)
references AUTO_DONADO (auto_id)

alter table PUJA
add constraint FK_PUJA_SUBASTA foreign key (subasta_id)
references SUBASTA (subasta_id)

alter table PUJA 
add constraint FK_PUJA_CLIENTE foreign key (cliente_id)
references CLIENTE(cliente_id)

alter table OFERTA_ACEPTADA
add constraint FK_OFERTA_PUJA foreign key (puja_id)
references PUJA(puja_id)

alter table OFERTA_ACEPTADA
add constraint FK_OFERTA_SUBASTA foreign key (subasta_id)
references SUBASTA(subasta_id)

/* INGRESANDO DATOS */

insert into CLIENTE(cliente_id,cliente_cedula,cliente_nombres,cliente_apellido,cliente_telefono,cliente_direccion,cliente_email)
values  (1,'1319874563','Eduardo Julio','Macias Cede?o','0978859807','Manta, Calle 36 y Av 12','eduardomacias@gmail.com'),
		(2,'1325684598','Jesus Clemente','Anchundia Palma', '0986352478', 'Manta, Calle 45 y Av 32','jesusclemente@gmail.com'),
		(3,'1315896874','Romario Julian', 'Pancracio Figeroa','0968354127','Cuenca, Calle 43 y Av 21', 'romariopancracio@gmail.com'),
		(4,'1235698556', 'Vladimir Stuard','Velez Zambrano','0988745685','Guayaquil, Calle 23 y Av 3', 'Vladimir123@gmail.com'),
		(5,'1564788566', 'Jesus Ignacio', 'Roca Pezo','0963322577','Guayaquil, Calle 2 y Av 8', 'jesusig@gmail.com'),
		(6,'1356857856','Luis Miguel','Reyes Chonillo','097847123','Quito, Calle 1 y Av 213','luism@gmail.com')



insert into DONADOR(donador_id,cedula,nombre,apellido,telefono,direccion,correo)
values (1,'1658589657','Juliana Luisa', 'Pachecho Intriago', '0985563321','Manta, Calle J3 y J4','juliana85@gmail.com'),
       (2,'1236987458','Wagner Jorge','Zambrano Macias','0944552167','Cuenca, Calle 3 y Av 12','Wagner12@gmail.com'),
	   (3,'1657855657','James Junior','Rodriguez Arteaga','0986352145','Quito, Calle 2 y Av 35','Jamesr@gmail.com'),
	   (4,'1325896874','Leonel Andres', 'Rosario Lima','0978854857','Manta, Calle 321 y Av 23', 'leonel23@gmail.com')

insert into AUTO_DONADO(auto_id,donador_id,marca,modelo,placa,color,cilindraje,ano,fecha_donado)
values (1,1,'Chevrolet', 'Corvette', 'MAN-9868','Verde',8,2013,'2021-6-1'),
	   (2,1,'Ford', 'Mustang','MAC-4862','Gris',8,1970,'2021-6-1'),
	   (3,2,'Nissan','Skyline','AFR-8945','Rojo',2.6,1999,'2021-6-7'),
	   (4,3,'Mitsubishi','Lancer','PRE-1236','Azul',2.4,1998,'2021-6-6'),
	   (5,3,'Chevrolet', 'Camaro', 'PEW-4568','Amarillo',6.2,1996,'2021-6-7'),
	   (6,4,'Ford','Shelby  GT500','MAN-4986','Blanco',5.2,1996,'2021-6-9')


insert into SUBASTA(subasta_id,auto_id,precio_inicial,fecha_inicial,fecha_final)
values (1,1,125000,'2021-06-10','2021-06-11'),
	   (2,2,250000,'2021-06-11','2021-06-12'),
	   (3,3,230000,'2021-06-11','2021-06-12'),
	   (4,4,80000,'2021-06-12','2021-06-13'),
	   (5,5,200000,'2021-06-12','2021-06-13'),
	   (6,6,300000,'2021-06-12','2021-06-13')

insert into PUJA(puja_id,cliente_id,subasta_id,puja_ofertada,numero_puja,fecha_oferta)
values (1,1,1,150000,1,'2021-06-10'),
	   (2,2,1,175000,1,'2021-06-10'),
	   (3,1,1,200000,2,'2021-06-11'),
	   (4,3,2,260000,1,'2021-06-11'),
	   (5,5,2,270000,1,'2021-06-11'),
	   (6,4,2,280000,1,'2021-06-12'),
	   (7,3,3,250000,1,'2021-06-12'),
	   (8,6,3,260000,1,'2021-06-12'),
	   (9,3,3,280000,2,'2021-06-12'),
	   (10,6,4,90000,1,'2021-06-13'),
	   (11,2,4,100000,1,'2021-06-13'),
	   (12,6,5,225000,1,'2021-06-13'),
	   (13,5,6,325000,1,'2021-06-13'),
	   (14,4,6,350000,1,'2021-06-13'),
	   (15,5,6,400000,2,'2021-06-13'),
	   (16,2,6,410000,1,'2021-06-13'),
	   (17,5,6,425000,2,'2021-06-13')
	   select *from PAGO
insert into OFERTA_ACEPTADA(oferta_id,subasta_id,puja_id)
values(1,1,3),
	  (2,2,6),
	  (3,3,9),
	  (4,4,11),
	  (5,5,12),
	  (6,6,17)
insert into PAGO (pa_id,oferta_id,pa_tipo)
values(1,2,'Targeta de Credito'),
	  (2,2,'Efectivo'),
	  (3,3,'Efectivo'),
	  (4,4,'Transferencia'),
	  (5,5,'Targeta de Credito'),
	  (6,6,'Trasferencia')

/*CONSULTA 1*/
/*Se requiere saber?cual?es el total del dinero recaudado en la subasta*/

select fecha_oferta, puja_ofertada  from OFERTA_ACEPTADA o 
inner join PUJA p on p.puja_id=o.puja_id

select sum(puja_ofertada) as TOTAL_RECAUDADO from PUJA o 
inner join OFERTA_ACEPTADA p on p.puja_id=o.puja_id

/*CONSULTA 2*/
/* Se requiere?saber en?que?autos se vendieron y en que fecha se recaudaron m?s fondos?*/
select fecha_oferta,marca,modelo,color  from OFERTA_ACEPTADA o 
join PUJA p on p.puja_id=o.puja_id
join SUBASTA r on r.subasta_id=o.subasta_id
join AUTO_DONADO s on s.auto_id=r.auto_id
select (fecha_oferta) as AUTOS_VENDIDOS
FROM PUJA o  join OFERTA_ACEPTADA p on p.puja_id=o.puja_id where fecha_oferta=('2021-06-13')
/*CONSULTA 3*/
/*Quienes fueron los donadores, que autos donaron, en que fecha y que cantidad de autos donaron*/

select nombre, apellido, marca, modelo, fecha_donado, color
from  AUTO_DONADO a 
join DONADOR d on a.donador_id=d.donador_id

select nombre, count(*) AUTOS_DONADOS
from  AUTO_DONADO a 
join DONADOR d on a.donador_id=d.donador_id
group by nombre

/*CONSULTA 4*/

/* Se desea saber cuantas ofertas tuvieron los autos, en la maxima oferta saber quienes fueron los clientes y la cantidad de veces que ofertaron*/

select marca,modelo, o.subasta_id, count(*)  NUMERO_OFERTAS from PUJA o
join SUBASTA r on r.subasta_id=o.subasta_id
join AUTO_DONADO s on s.auto_id=r.auto_id
group by o.subasta_id, marca, modelo

select puja_ofertada, cliente_nombres, cliente_apellido, numero_puja from PUJA o
join CLIENTE c on c.cliente_id=o.cliente_id where subasta_id=6