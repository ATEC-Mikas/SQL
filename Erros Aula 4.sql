use campeonato2
go

select * from Automovel

--delete Automovel where matricula='22-AA-11'
--insert into Automovel values('22-AA-11','Teste',1999,1999,1999)

insert into Automovel values('aa-22-aa','Teste',1999,1999,1999)
insert into Automovel values('65-87-GR','Teste',1999,1999,1999)
insert into Automovel values(null,'Teste',1999,1999,1999)
insert into Automovel values('22-AA-11',null,1999,1999,1999)
insert into Automovel values('22-AA-11','Teste',1,1999,1999)
insert into Automovel values('22-AA-11','Teste',1999,2020,1999)
insert into Automovel values('22-AA-11','Teste',1999,1999,-2)

select * from cliente
--delete cliente where nome='teste'
--insert into cliente(nome,nr_identificacao_civil,nif,data_nascimento) values('teste',null,100000001,'1950-01-01')

insert into cliente values(8,'teste',null,100000001,'1950-01-01')
insert into cliente values(null,'teste',null,100000001,'1950-01-01')
insert into cliente(nome,nr_identificacao_civil,nif,data_nascimento) values('teste',987345,100000001,'1950-01-01')
insert into cliente(nome,nr_identificacao_civil,nif,data_nascimento) values('teste',9,100000001,'1950-01-01')
insert into cliente(nome,nr_identificacao_civil,nif,data_nascimento) values('teste',null,105098124,'1950-01-01')
insert into cliente(nome,nr_identificacao_civil,nif,data_nascimento) values('teste',null,null,'1950-01-01')
insert into cliente(nome,nr_identificacao_civil,nif,data_nascimento) values('teste',null,100000001,null)

select * from automovel_cliente

insert into automovel_cliente values('42-90-AS',2)
insert into automovel_cliente values('42-90-AS',null)
insert into automovel_cliente values('42-90-AS',10)

select * from Revisao

insert into Revisao values('42-90-AS','2018-10-23 10:50:00','N')
insert into Revisao values(null,null,'N')
insert into Revisao values('42-90-AA','2018-10-23 10:50:00','N')
insert into Revisao values('42-90-AS','2018-10-21 10:50:00','H')
insert into Revisao values('42-90-AS','2018-10-21 10:50:00',null)
