use master 
go
create database  campeonato2
go
use campeonato2
go

-- Criar Cliente

create table Cliente (
	id_cliente integer identity(1,1) constraint pk_cliente_id_cliente primary key,
	nome varchar(100) constraint nn_cliente_nome not null,
	nr_identificacao_civil integer
	constraint ck_cliente_nic check(nr_identificacao_civil >= 100000),
	nif integer constraint uk_cliente_nif unique 
--	constraint nn_cliente_nif not null
	constraint ck_cliente_nif check(nif between 100000000 and 999999999),
	data_nascimento date constraint nn_cliente_data not null,
)
go
CREATE UNIQUE NONCLUSTERED INDEX idx_yourcolumn_notnull ON Cliente(nr_identificacao_civil) WHERE nr_identificacao_civil IS NOT NULL;
go

--Criar Automovel

create table Automovel(
	matricula varchar(8) constraint pk_automovel_matricula primary key,
	marca varchar(50) constraint nn_automovel_marca not null,
	cilindrada integer 
	constraint ck_cliente_cilindrada check(cilindrada between 500 and 6000),
	ano_fabrico integer
	constraint ck_automovel_ano_fabrico check(ano_fabrico between 1900 and year(getdate())),
	preco_venda decimal(9,2) 
	constraint ck_automovel_preco_venda check(preco_venda>=0),
	constraint ck_automovel_matricula check (
		matricula like '[A-Z][A-Z]-[0-9][0-9]-[0-9][0-9]' or
		matricula like '[0-9][0-9]-[A-Z][A-Z]-[0-9][0-9]' or
		matricula like '[0-9][0-9]-[0-9][0-9]-[A-Z][A-Z]')
)
go

--criar revisao

create table Revisao(
	matricula varchar(8) references Automovel(matricula),
	data_hora_marcacao datetime default getdate(),
	efetuada varchar(1) default 'N'
	constraint ck_revisao_efetuada check(efetuada like '[SN]'),
	constraint pk_revisao_matricula_data_horamarcacao primary key (matricula,data_hora_marcacao)
)
go

--criar automovel_cliente

create table automovel_cliente (
	matricula varchar(8) references Automovel(matricula),
	id_cliente integer references Cliente(id_cliente),
	constraint pk_automovel_cliente_matricula_id_cliente primary key (matricula,id_cliente)
)
go

--inserir dados

insert into Automovel values
	('45-PD-98','Mercedes',2300,2000,34050),
	('65-87-GR','Nissan',1700,2009,23490.5),
	('42-90-AS','Kia',1300,2008,20870),
	('BL-87-23','Volkswagen',1100,2017,15600.75),
	('83-QD-27','BMW',2100,2014,35600),
	('XO-65-98','Toyota',2100,2010,15940)
go

select * from Cliente

insert into Cliente(Nome,nr_identificacao_civil,nif,data_nascimento) values 
	('Sérgio Conceição',987345,105098124,'1974-11-15'),
	('António Oliveira',937587,104052455,'1952-10-06'),
	('Fernando Santos',null,102000906,'1954-10-10'),
	('Artur Jorge',7098428,100829087,'1946-02-13'),
	('Jesualdo Ferreira',null,107559969,'1946-05-24')
go

insert into automovel_cliente values
	('65-87-GR',1),
	('83-QD-27',4),
	('42-90-AS',2),
	('45-PD-98',1),
	('XO-65-98',5),
	('BL-87-23',3)
go

insert into Revisao values 
	('65-87-GR','2018-10-04 09:00','N'),
	('83-QD-27','2018-11-11 14:45', 'N'),
	('42-90-AS','2018-10-23 10:50','N'),
	('XO-65-98','2018-12-01 18:30','N'),
	('65-87-GR','2018-06-07 10:50','S'),
	('XO-65-98','2016-11-22 12:20','S')
go

