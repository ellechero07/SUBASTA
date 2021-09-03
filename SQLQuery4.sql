select puja_ofertada, cliente_nombres, cliente_apellido, numero_puja from PUJA o
join CLIENTE c on c.cliente_id=o.cliente_id where subasta_id=6

--procedimiento almacenado en muestre los autos donados mostrandolos con el nombre del donador
create or alter procedure autos_donado

 @autos_donado varchar(50) as
select nombre, apellido, marca, modelo, color, fecha_donado from AUTO_DONADO r

join DONADOR c on c.donador_id = r.donador_id

where C.nombre = @autos_donado

select count(r.donador_id) as autos_donados from AUTO_DONADO r
inner join DONADOR c on c.donador_id= r.donador_id where c.nombre=@autos_donado

go


exec autos_donado 'Juliana Luisa'



---Se desea contactar con la lista de clientes para enviar sus autos, por lo que se requiere datos de los clientes, direcciones y autos a enviar
Declare @cedula varchar(10),
@nombres varchar(50),
@apellido varchar(50),
@marca varchar(50),
@modelo varchar(50),
@direccion varchar(50)
Declare datos cursor 
 for select cliente_cedula,cliente_nombres, cliente_apellido,
marca,modelo,cliente_direccion from dbo.CLIENTE o
inner join PUJA p on p.cliente_id=o.cliente_id
inner join OFERTA_ACEPTADA f on f.puja_id=p.puja_id
inner join SUBASTA s on s.subasta_id=f.subasta_id
inner join AUTO_DONADO a on a.auto_id=s.auto_id
 Open datos
 fetch datos into @cedula, @nombres,@apellido,@marca,@modelo,@direccion
 while (@@FETCH_STATUS=0) 
 begin 
 print @cedula +' , '+ @nombres  +'  '+@apellido +' , '+ @marca  +',  '+ @modelo +' , '+@direccion
 fetch datos into @cedula, @nombres,@apellido,@marca,@modelo,@direccion
 end 
 close datos 
 deallocate datos


------TRIGGER-------------------------------------------
 
 create trigger Noinsertar
 on dbo.CLIENTE for insert
 as begin
 print 'No se pueden insertar  datos'
 rollback transaction
 end
  delete from CLIENTE where cliente_id=6
 
  create trigger Noborrar
 on dbo.CLIENTE for delete
 as begin
 print 'No se pueden borrar los datos'
 rollback transaction
 end
  create trigger Noactualizar
 on dbo.CLIENTE  for update
 as begin
 print 'No se puede actualizar los datos'
 rollback transaction
 end
	insert into CLIENTE values (8,'1658445895','Julio Stalin','Valle Mero','098585687','Cuba','juliovale@gmail.com')
	
	update CLIENTE set cliente_nombres= 'Eduardo Carlos' where cliente_nombres='Eduardo Julio'
	
	delete from CLIENTE where cliente_id=8


--------------REPORTE---------------------------------

select fecha_oferta, puja_ofertada,cliente_nombres,cliente_apellido, numero_puja, marca,modelo from OFERTA_ACEPTADA o
inner join PUJA p on p.puja_id=o.puja_id
inner join CLIENTE c on c.cliente_id=p.cliente_id
inner join SUBASTA s on s.subasta_id=o.subasta_id
inner join AUTO_DONADO a on a.auto_id=s.auto_id
select sum(puja_ofertada) as TOTAL_RECAUDADO from PUJA o
inner join OFERTA_ACEPTADA p on p.puja_id=o.puja_id
